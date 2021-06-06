import 'package:flutter/material.dart';
import 'package:flutter_helper/flutter_helper.dart';

class ScaffoldView extends StatelessWidget {
  final Widget body;
  final bool resizeBody;
  final bool resizeAppBar;
  final Widget appBar;
  final Widget floatingActionButton;
  final FloatingActionButtonLocation floatingActionButtonLocation;
  final Widget bottomNavigationBar;
  final bool extendBody;

  ScaffoldView(
      {this.body,
      this.resizeBody = true,
      this.resizeAppBar = true,
      this.appBar,
      this.floatingActionButton,
      this.floatingActionButtonLocation,
      this.bottomNavigationBar,
      this.extendBody = false
  });

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: extendBody,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        appBar: appBar,
        bottomNavigationBar: bottomNavigationBar,
        body: Builder(
            builder: (BuildContext context) {
              var child;

              if (resizeBody) {
                child =  PlatformUtil().getResizedWidget(context, child: body);
              } else {
                child = body;
              }

              return child;
            }
        ),
      ),
    );
  }
}