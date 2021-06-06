import 'package:flutter/material.dart';

class PlatformUtil {
  Widget getDifferentWidget(BuildContext context, Widget mobileView, Widget webView) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;

    if (isMobile) {
      return mobileView;
    } else {
      return webView;
    }
  }
  
  Widget getResizedWidget(BuildContext context, {Alignment alignment = Alignment.topCenter, Widget child, double divider = 3}) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;

    double width;

    if (isMobile) {
      width = MediaQuery
          .of(context)
          .size
          .width;
    } else {
      width = 1917 / divider;
    }

    final Widget container = Container(
      width: width,
      child: child,
    );

    Widget alignedWidget = container;

    if (alignment != null) {
      alignedWidget = Align(alignment: alignment, child: container);
    }

    return child is Text ? child : alignedWidget;
  }

  bool isDesktop(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width > 800;

    return isDesktop;
  }

  bool isMobile(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;

    return isMobile;
  }
}