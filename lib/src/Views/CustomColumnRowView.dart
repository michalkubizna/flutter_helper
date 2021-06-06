import 'package:flutter/material.dart';
import 'package:quiver/iterables.dart';

class CustomColumnRowView extends StatelessWidget {
  final List<Widget> children;
  final double itemCount;

  CustomColumnRowView({
    this.children,
    this.itemCount
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 600) {
        return Column(children: [for (final i in children) SizedBox(width: MediaQuery.of(context).size.width, child: i)]);
      } else {
        return Column(children: [for (final subchildren in partition(children, itemCount.toInt())) Row(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [for (final i in subchildren) i])]);
      }
    });
  }
}
