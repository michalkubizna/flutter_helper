import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_helper/src/Models/DropDown.dart';

class PopUpView extends StatelessWidget {
  final List<DropDown> values;
  final Color color;

  PopUpView({
    @required this.values,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<DropDown>(
      iconSize: Theme.of(context).iconTheme.size,
      padding: EdgeInsets.all(0.0),
      icon: Icon(Icons.more_vert, color: color ?? Colors.black),
      onSelected: (DropDown value) {
        value.callback();
      },
      itemBuilder: (BuildContext context) => values.map<PopupMenuEntry<DropDown>>((DropDown value) {
        return PopupMenuItem<DropDown>(
          value: value,
          child: Text(value.text),
        );
      }).toList(),
    );
  }
}