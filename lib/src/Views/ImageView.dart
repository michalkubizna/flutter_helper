import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  final String image;

  ImageView({
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    final image = this.image ?? "";

    Widget networkImage;

    if (image.contains("http")) {
      final resizedImage = ResizeImage(NetworkImage(image), width: 1000, height: 1000);

      networkImage = Image(image: resizedImage, fit: BoxFit.cover,
        loadingBuilder:(BuildContext context, Widget child, ImageChunkEvent loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null ?
              loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                  : null,
            ),
          );
        },
      );
    } else {
      networkImage = SizedBox.shrink();
    }

    return networkImage;
  }
}
