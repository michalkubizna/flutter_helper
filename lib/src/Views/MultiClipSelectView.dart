import 'package:flutter/material.dart';

class MultiClipSelectView extends StatefulWidget {
  final List<String> values;
  final List<String> selectedValues;

  MultiClipSelectView({
    this.values,
    this.selectedValues
  });

  @override
  _MultiClipSelectViewState createState() => _MultiClipSelectViewState();
}

class _MultiClipSelectViewState extends State<MultiClipSelectView> {
  List<String> _selectedValues = [];

  _buildChip(String value, Function onPressed) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ChoiceChip(selected: widget.selectedValues.contains(value), label: Text(value), onSelected: onPressed),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 8,
      children: [for (final value in widget.values) _buildChip(value, (_) {
        if (_selectedValues.contains(value)) {
          setState(() {
            _selectedValues.remove(value);
          });
        } else {
          setState(() {
            _selectedValues.add(value);
          });
        }
      })],
    );
  }
}
