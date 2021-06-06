import 'package:flutter/material.dart';
import 'package:flutter_helper/flutter_helper.dart';

class ChildrenUtil {
  List<Widget> getAllPaddedChildren(List<Widget> children, {double padding = 12, bool isOutside = true, bool isVertical = true}) {
    children.removeWhere((element) => element.toString() == "SizedBox.shrink");

    for (var i = 0; i < children.length; i++) {
      children[i] = PaddedView(
        child: children[i],
        paddingEnum: _getHorizontalPadding(i, children, isOutside, isVertical),
        padding: padding,
      );
    }

    return children;
  }

  PaddingEnum _getHorizontalPadding(int i, List<Widget> children, bool isOutside, bool isVertical) {
    PaddingEnum paddingEnum;

    if (isVertical) {
      if (isOutside) {
        paddingEnum = i == children.length - 1 ? PaddingEnum.all : PaddingEnum.topHorizontal;
      } else {
        paddingEnum = i == children.length - 1 ? null : PaddingEnum.bottom;
      }
    } else {
      if (isOutside) {
        paddingEnum = i == children.length - 1 ? PaddingEnum.all : PaddingEnum.leftVertical;
      } else {
        paddingEnum = i == children.length - 1 ? null : PaddingEnum.right;
      }
    }

    return paddingEnum;
  }

  List<Widget> getDividedChildren(List<Widget> children, {Color color}) {
    for (var i = 0; i < children.length; i++) {
      children[i] = BorderView(
        child: children[i],
        color: color,
      );
    }

    return children;
  }
}