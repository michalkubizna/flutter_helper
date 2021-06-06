import 'package:flutter/material.dart';

class DropDown {
  final String text;
  final Function() callback;

  const DropDown({
    @required this.text,
    @required this.callback
  });
}