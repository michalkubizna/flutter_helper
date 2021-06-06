import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_helper/flutter_helper.dart';

class HeroImageView extends StatefulWidget {
  final String image;
  final String text;
  final bool isCircle;

  HeroImageView({@required this.image,
    this.text,
    this.isCircle = false});

  @override
  _HeroImageViewState createState() => _HeroImageViewState();
}


class _HeroImageViewState extends State<HeroImageView> {
  UniqueKey _uniqueKey;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _uniqueKey = UniqueKey();
  }

  @override
  Widget build(BuildContext context) {
    final image = kReleaseMode && kIsWeb ? "https://cors-anywhere.herokuapp.com/${widget.image}" : widget.image;

    if (!widget.isCircle) {
      return _RefactoredView(
        initialImage: _HeroView(imageName: image, tag: _uniqueKey),
        destinationImage: _HeroView(imageName: image, tag: _uniqueKey),
        text: widget.text,
      );
    } else {
      final double minRadius = 100.0;

      final double maxRadius = MediaQuery.of(context).size.width / 2;

      return _RefactoredView(initialImage: _RadialHeroView(
        radius: minRadius,
        maxRadius: maxRadius,
        minRadius: minRadius,
        imageName: image,
        tag: _uniqueKey,
      ), destinationImage: _RadialHeroView(
        radius: maxRadius,
        maxRadius: maxRadius,
        minRadius: minRadius,
        imageName: image,
        tag: _uniqueKey,
      ), text: widget.text);
    }
  }
}

class _RefactoredView extends StatelessWidget {
  final Widget initialImage;
  final Widget destinationImage;
  final String text;

  _RefactoredView({
    @required this.destinationImage,
    @required this.initialImage,
    @required this.text
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: initialImage,
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Scaffold(
              backgroundColor: Colors.black,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: SizedBox(
                      width: PlatformUtil().isMobile(context) ? null : 500,
                      height: PlatformUtil().isMobile(context) ? null : 500,
                      child: destinationImage,
                    ),
                  ),
                  PaddedView(
                    child: Text(text ?? "",
                        style: TextStyle(fontSize: 18, color: Colors.white), textAlign: TextAlign.center,),
                  )
                ],
              ),
            ),
          );
        }));
      },
    );
  }
}


class _HeroView extends StatelessWidget {
  final UniqueKey tag;
  final String imageName;

  _HeroView({
    @required this.tag,
    @required this.imageName
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: ImageView(
        image: imageName,
      ),
    );
  }
}


class _RadialHeroView extends StatelessWidget {
  final String imageName;
  final double radius;
  final double maxRadius;
  final double minRadius;
  final UniqueKey tag;

  _RadialHeroView({
    @required this.imageName,
    @required this.radius,
    @required this.maxRadius,
    @required this.minRadius,
    @required this.tag,
  });

  RectTween _createRectTween(Rect begin, Rect end) {
    return MaterialRectCenterArcTween(begin: begin, end: end);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        createRectTween: _createRectTween,
        tag: tag,
        child: _RadialExpansion(
          maxRadius: maxRadius,
          minRadius: minRadius,
          radius: radius,
          child: ImageView(
            image: imageName,
          ),
        ),
      ),
    );
  }
}

class _RadialExpansion extends StatelessWidget {
  _RadialExpansion({
    Key key,
    this.radius,
    this.maxRadius,
    this.minRadius,
    this.child,
  }) : clipRectExtent = 2.0 * (maxRadius / sqrt2),
        super(key: key);

  final double radius;
  final double maxRadius;
  final clipRectExtent;
  final double minRadius;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: radius * 2.0,
      height: radius * 2.0,
      child: ClipOval(
        child: Center(
          child: SizedBox(
            width: clipRectExtent,
            height: clipRectExtent,
            child: ClipRect(
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}