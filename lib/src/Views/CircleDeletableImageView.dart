import 'package:flutter/material.dart';
import 'package:flutter_helper/flutter_helper.dart';

class CircleDeletableImageView extends StatelessWidget {
  final Function removeImage;
  final String image;

  CircleDeletableImageView({this.removeImage, this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: ClipOval(child: HeroImageView(image: image, isCircle: true,)),
        ),
        Positioned(
          right: -20.0,
          bottom: -20.0,
          child: IconButton(
            iconSize: 40.0,
            icon: Icon(Icons.cancel),
            onPressed: () {
              removeImage(image);
            },
          ),
        ),
      ],
    );
  }
}
