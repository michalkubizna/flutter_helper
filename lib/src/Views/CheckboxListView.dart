import 'package:flutter/material.dart';

class CheckboxListView extends StatelessWidget {
  final Map map;
  final Function onChanged;

  CheckboxListView({
    this.map,
    this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: map.entries.map((MapEntry e) => CheckboxListTile(title: Text(e.value["item"]["text"]), value: e.value["selected"], onChanged: (value) {
              onChanged(e.key, value);
            })).toList()
        ),
      ),
    );
  }
}
