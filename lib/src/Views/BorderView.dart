import 'package:flutter/material.dart';

class BorderView extends StatelessWidget {
  final Widget child;
  final Color color;

  BorderView({
    this.child,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(child: child, width: MediaQuery.of(context).size.width,),
        Positioned(
          bottom: 0,
          child: Container(
            height: 1.0,
            width: MediaQuery.of(context).size.width,
            color: color ?? Colors.grey[350],
          ),
        )
      ],
    );
  }
}
