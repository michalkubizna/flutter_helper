import 'package:flutter/material.dart';

class PopUpStringView extends StatefulWidget {
  final List<String> values;
  final Function onSelected;
  final Widget icon;

  PopUpStringView({
    this.values,
    this.onSelected,
    this.icon
  });

  @override
  _PopUpStringViewState createState() => _PopUpStringViewState();
}

class _PopUpStringViewState extends State<PopUpStringView> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: widget.icon,
      onSelected: (String value) {
        widget.onSelected(value);
      },
      itemBuilder: (BuildContext context) => (widget.values ?? []).map<PopupMenuEntry<String>>((String value) {
        return PopupMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}