import 'package:flutter/material.dart';
import 'package:flutter_helper/flutter_helper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quiver/iterables.dart';

class ImagesPickerView extends StatelessWidget {
  final List images;
  final Function(ImageSource) addImage;
  final Function(String) removeImage;
  final bool isLoading;
  final int itemCount;
  final List<String> texts;
  final int crossItemCount;

  ImagesPickerView({
    this.images,
    this.addImage,
    this.removeImage,
    this.isLoading,
    this.itemCount = 4,
    this.texts = const ["", "", "", ""],
    this.crossItemCount = 2
  });

  List<Widget> _getPaddedChildren(List<Widget> children) {
    return ChildrenUtil().getAllPaddedChildren(children);
  }

  Widget _buildPictures(BuildContext context) {
    final List<Widget> children = [for (var i = 0; i < (itemCount); i++) ImagePickerView(i: i, addImage: addImage, removeImage: removeImage, isLoading: isLoading, images: images)];

    if (itemCount > 3) {
      final List partitionedChildren = partition(children, (crossItemCount)).toList();

      return Column(
        children: _getPaddedChildren([for (var i = 0; i < partitionedChildren.length; i++) Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("${texts[i]}", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: partitionedChildren[i])
        ],)]),
      );
    } else {
      return Column(
        children: _getPaddedChildren([for (var i = 0; i < children.length; i++) Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("${texts[i]}", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),),
          ),
          children[i]
        ],)]),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildPictures(context);
  }
}
