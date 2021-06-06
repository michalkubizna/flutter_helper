import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ButtonView extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color;
  final Color contentColor;
  final IconData iconData;
  final double circular;
  final MainAxisAlignment mainAxisAlignment;

  ButtonView({
    this.text,
    this.onPressed,
    this.color,
    this.contentColor,
    this.iconData,
    this.circular,
    this.mainAxisAlignment
  });

  @override
  Widget build(BuildContext context) {
    final Color accentColor = Theme.of(context).accentColor;

    Widget child;

    Widget _buildText() {
      return Text(text, style: TextStyle(fontSize: 18),);
    }

    if (iconData == null) {
      child = RaisedButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onPressed: onPressed,
        child: _buildText(),
      );
    } else {
      child = RaisedButton.icon(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        icon: Icon(iconData),
        onPressed: onPressed,
        label: _buildText()
      );
    }

    return DefaultTextStyle(
      style: TextStyle(color: contentColor ?? Colors.white),
      child: IconTheme(
        data: IconThemeData(color: Colors.white),
        child: ButtonTheme(
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(circular ?? 4)),
          height: kIsWeb ? 45.0 : 40.0,
          buttonColor: color ?? accentColor,
          disabledColor: Colors.grey,
          child: child,
        ),
      ),
    );
  }
}
