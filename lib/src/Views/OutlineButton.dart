import 'package:flutter/material.dart';

class OutlineButtonView extends StatefulWidget {
  final Function onPressed;
  final String text;
  final Color color;
  
  OutlineButtonView({
    @required this.onPressed,
    @required this.text,
    this.color = Colors.blue
  });
  
  @override
  _OutlineButtonViewState createState() => _OutlineButtonViewState();
}

class _OutlineButtonViewState extends State<OutlineButtonView> {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
        borderSide: BorderSide(color: widget.color, width: 2.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: widget.onPressed,
        disabledBorderColor: Colors.grey,
        disabledTextColor: Colors.grey,
        child: Text(
            widget.text,
            style: TextStyle(
                color: widget.color,
                fontSize: 16.0,
                fontWeight: FontWeight.w600
            )
        )
    );
  }
}
