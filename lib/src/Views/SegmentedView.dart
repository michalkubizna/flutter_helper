import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SegmentedView extends StatefulWidget {
  final List<Widget> children;
  final List<Widget> titles;

  SegmentedView({
    this.children,
    this.titles
  });

  @override
  _SegmentedViewState createState() => _SegmentedViewState();
}

class _SegmentedViewState extends State<SegmentedView> {
  dynamic _groupValue = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          child: CupertinoSlidingSegmentedControl(groupValue: _groupValue, children: Map.fromEntries([for (var i = 0; i < widget.titles.length; i++) MapEntry(i, widget.titles[i])]), onValueChanged: (dynamic value) {
            setState(() {
              _groupValue = value;
            });
          }),
        ),
        _groupValue == 0 ? widget.children[0] : widget.children[1]
      ],
    );
  }
}
