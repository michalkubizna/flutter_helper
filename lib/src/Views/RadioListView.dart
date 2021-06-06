import 'package:flutter/material.dart';

class RadioListView extends StatelessWidget {
  final List<String> children;
  final String value;
  final Function onChanged;

  RadioListView({
    this.children,
    this.value,
    this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: children.map((String e) => RadioListTile(title: Text(e,
                style:
                TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)), value: e, groupValue: value, onChanged: onChanged)).toList()
        ),
      ),
    );
  }
}
