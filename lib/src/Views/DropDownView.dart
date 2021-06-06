import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DropDownView<T> extends StatefulWidget {
  final T initialValue;
  final List<T> values;
  final Function onSelected;
  final String label;

  DropDownView({
    this.initialValue,
    this.values,
    this.onSelected,
    this.label,
  });

  @override
  _DropDownViewState createState() => _DropDownViewState();
}

class _DropDownViewState extends State<DropDownView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kIsWeb ? 50 : 60,
      child: DropdownButtonFormField<dynamic>(
          decoration: InputDecoration(
              labelText: widget.label,
              border: OutlineInputBorder()
          ),
          validator: (value) {
            return null;
          },
          isExpanded: true,
          value: widget.values.contains(widget.initialValue) ? widget.initialValue : widget.values.first,
          iconEnabledColor: Colors.grey,
          icon: Icon(Icons.keyboard_arrow_down),
          iconSize: 24,
          elevation: 16,
          onChanged: (dynamic value) {
            widget.onSelected(value);
          },
          items: (widget.values ?? []).map<DropdownMenuItem<dynamic>>((dynamic value) {
            return DropdownMenuItem<dynamic>(
              value: value,
              child: Text(value.toString()),
            );
          }).toList()
      ),
    );
  }
}
