import 'package:flutter/material.dart';

class NavigatorUtil {

  void navigate(BuildContext context, dynamic object) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return object;
    }));
  }

  void pop(BuildContext context) {
    Navigator.of(context).pop();
  }

  void fullPop(BuildContext context) {
    Navigator.of(context).popUntil(ModalRoute.withName(Navigator.defaultRouteName));
  }

}