import 'package:flutter/material.dart';

class TitleView extends StatelessWidget {
  final String title;
  final Alignment align;

  TitleView({
    this.title,
    this.align = Alignment.centerLeft
  });

  @override
  Widget build(BuildContext context) {
    final Widget child = Text(title,
        style: TextStyle(color: Theme.of(context).accentColor, fontSize: 18));

    if (align != null) {
      return Align(
        alignment: align,
        child: child,
      );
    } else {
      return child;
    }
  }
}
