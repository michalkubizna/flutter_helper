import 'package:flutter/material.dart';
import 'package:flutter_helper/flutter_helper.dart';

class PaddedView extends StatelessWidget {
  final Widget child;
  final double padding;
  final PaddingEnum paddingEnum;

  PaddedView({
    this.child,
    this.padding = 12.0,
    this.paddingEnum = PaddingEnum.all
  });

  @override
  Widget build(BuildContext context) {
    if (paddingEnum == PaddingEnum.top) {
      return Padding(
        padding: EdgeInsets.only(top: padding),
        child: child,
      );
    } else if (paddingEnum == PaddingEnum.bottom) {
      return Padding(
        padding: EdgeInsets.only(bottom: padding),
        child: child,
      );
    } else if (paddingEnum == PaddingEnum.left) {
      return Padding(
        padding: EdgeInsets.only(left: padding),
        child: child,
      );
    } else if (paddingEnum == PaddingEnum.right) {
      return Padding(
        padding: EdgeInsets.only(right: padding),
        child: child,
      );
    } else if (paddingEnum == PaddingEnum.all) {
      return Padding(
        padding: EdgeInsets.all(padding),
        child: child,
      );
    } else if (paddingEnum == PaddingEnum.horizontal) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: child,
      );
    } else if (paddingEnum == PaddingEnum.vertical) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: padding),
        child: child,
      );
    } else if (paddingEnum == PaddingEnum.bottomHorizontal) {
      return Padding(
        padding: EdgeInsets.only(top: 0.0, bottom: padding, left: padding, right: padding),
        child: child,
      );
    } else if (paddingEnum == PaddingEnum.topHorizontal) {
      return Padding(
        padding: EdgeInsets.only(top: padding, bottom: 0.0, left: padding, right: padding),
        child: child,
      );
    } else if (paddingEnum == PaddingEnum.rightVertical) {
      return Padding(
        padding: EdgeInsets.only(top: padding, bottom:padding, left: padding, right: 0.0),
        child: child,
      );
    } else if (paddingEnum == PaddingEnum.leftVertical) {
      return Padding(
        padding: EdgeInsets.only(top: padding, bottom:padding, right: padding, left: 0.0),
        child: child,
      );
    } else if (paddingEnum == PaddingEnum.rightBottom) {
      return Padding(
        padding: EdgeInsets.only(top: 0.0, bottom: padding, right: padding, left: 0.0),
        child: child,
      );
    } else if (paddingEnum == PaddingEnum.leftBottom) {
      return Padding(
        padding: EdgeInsets.only(top: 0.0, bottom: padding, right: 0.0, left: padding),
        child: child,
      );
    } else if (paddingEnum == PaddingEnum.rightTop) {
      return Padding(
        padding: EdgeInsets.only(top: padding, bottom: 0.0, right: padding, left: 0.0),
        child: child,
      );
    } else if (paddingEnum == PaddingEnum.leftTop) {
      return Padding(
        padding: EdgeInsets.only(top: padding, bottom: 0.0, right: 0.0, left: padding),
        child: child,
      );
    } else {
      return child;
    }
  }
}
