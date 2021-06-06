import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldView extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final TextCapitalization textCapitalization;
  final bool obscureText;
  final String hintText;
  final TextInputType keyboardType;
  final bool autofocus;
  final bool isMandatory;
  final Function onSubmitted;
  final TextInputAction textInputAction;
  final int maxLines;
  final Function validator;
  final double fontSize;
  final bool readOnly;
  final Function onTap;
  final InputBorder border;
  final bool isExpanded;
  final Function onChanged;
  final TextAlign textAlign;
  final List<TextInputFormatter> inputFormatters;

  TextFieldView({
    this.label,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.textCapitalization,
    this.obscureText,
    this.hintText,
    this.keyboardType,
    this.autofocus,
    this.isMandatory,
    this.onSubmitted,
    this.textInputAction,
    this.maxLines,
    this.validator,
    this.fontSize,
    this.readOnly,
    this.onTap,
    this.isExpanded,
    this.onChanged,
    this.textAlign = TextAlign.start,
    this.border = const OutlineInputBorder(),
    this.inputFormatters
  });
  
  @override
  Widget build(BuildContext context) {
    var _inputFormatters = <TextInputFormatter>[];

    if (keyboardType == TextInputType.number ||
        keyboardType == TextInputType.numberWithOptions(decimal: true)) {
      _inputFormatters = [FilteringTextInputFormatter.allow(RegExp('[0-9.,]+'))];
    } else if (keyboardType == TextInputType.numberWithOptions(decimal: true, signed: true) ||
        keyboardType == TextInputType.numberWithOptions(signed: true)) {
      _inputFormatters = [];
    }

    _inputFormatters.addAll(inputFormatters ?? []);

    return TextFormField(
      onChanged: onChanged,
      keyboardAppearance: Brightness.light,
      inputFormatters: _inputFormatters,
      onTap: onTap,
      readOnly: readOnly ?? false,
      textInputAction: textInputAction,
      onFieldSubmitted: onSubmitted,
      keyboardType: keyboardType,
      validator: isMandatory != null && isMandatory ? (String value) {
        if (value.isEmpty) {
          return "Please enter some text";
        } else {
          return null;
        }
      } : validator != null ? validator : null,
      controller: controller,
      textAlign: label == null ? TextAlign.center : textAlign,
      style: TextStyle(fontSize: fontSize ?? 16.0),
      autofocus: autofocus ?? false,
      decoration: InputDecoration(
        contentPadding: label == null ? EdgeInsets.all(0.0) : null,
        border: border,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        labelText: label,
      ),
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      maxLines: isExpanded != null && isExpanded ? maxLines : maxLines ?? 1,
      obscureText: obscureText ?? false,
    );
  }
}