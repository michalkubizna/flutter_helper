import 'package:flutter/material.dart';
import 'package:flutter_helper/flutter_helper.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerView extends StatefulWidget {
  final List images;
  final Function addImage;
  final Function(String) removeImage;
  final bool isLoading;
  final int i;

  ImagePickerView({
    this.images,
    this.addImage,
    this.removeImage,
    this.isLoading,
    this.i
  });

  @override
  _ImagePickerViewState createState() => _ImagePickerViewState();
}

class _ImagePickerViewState extends State<ImagePickerView> {
  Future<ImageSource> _showDialog(BuildContext context) async {
    final ImageSource imageSource = await showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text("Where do you want to get your pictures from?"),
        actions: [
          FlatButton(onPressed: () {
            Navigator.pop(context, ImageSource.gallery);
          }, child: Text("Gallery")),
          FlatButton(onPressed: () {
            Navigator.pop(context, ImageSource.camera);
          }, child: Text("Camera"))
        ],
      );
    });

    return imageSource;
  }

  Widget _buildPicture(int index, BuildContext context) {
    Widget icon;

    Key key;

    final length = widget.images.length;

    if (length >= index) {
      icon = widget.isLoading ? Center(child: SizedBox(width: 50.0, height: 50.0, child: CircularProgressIndicator())) : Icon(Icons.add_a_photo);

      key = Key("camera_plus");
    } else {
      icon = Icon(Icons.photo_camera);

      key = Key("camera");
    }

    Widget child;

    if (length - 1 >= index) {
      child = CircleDeletableImageView(removeImage: widget.removeImage, image: widget.images[index]);
    } else {
      child = Center(
        child: IconBackgroundView(
          key: key,
          icon: icon,
          onPressed: key == Key("camera_plus") ? () async {
            final ImageSource imageSource = await _showDialog(context);

            if (imageSource != null) {
              widget.addImage(imageSource);
            }
          } : null,
          radius: 100.0,
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildPicture(widget.i, context);
  }
}
