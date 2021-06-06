import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

String getFirebaseId() {
  return FirebaseFirestore.instance.collection('placeholder').doc().id;
}

Future showDialogView(BuildContext context, {WidgetBuilder builder, shouldPop = false}) async {
  final object = await showDialog(useSafeArea: false, context: context, builder: (context) {
    return ScaffoldMessenger(
      child: WillPopScope(
          onWillPop: () async {
            FocusManager.instance.primaryFocus.unfocus();

            return shouldPop;
          },
          child: Builder(builder: (context) => builder(context),)),
    );
  });

  return object;
}

Future pushView(BuildContext context, Widget child) async {
  return Navigator.push(context, MaterialPageRoute(builder: (context) {
    return child;
  }));
}

double getBottomPadding(BuildContext context, GlobalKey globalKey) {
  final RenderBox renderBox = globalKey.currentContext.findRenderObject();

  double height;

  height = MediaQuery.of(context).size.height;

  final double bottomPadding = height + renderBox.globalToLocal(Offset.zero).dy - renderBox.size.height;

  return bottomPadding;
}