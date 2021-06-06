import 'package:flutter/material.dart';

class TextFieldControllerView extends StatefulWidget {
  final Widget Function(TextEditingController) child;
  final String text;

  TextFieldControllerView({
    this.child,
    this.text
  });

  @override
  _TextFieldControllerViewState createState() => _TextFieldControllerViewState();
}

class _TextFieldControllerViewState extends State<TextFieldControllerView> {
  final TextEditingController _textEditingController = TextEditingController();

  void _onChange() {
    setState(() {});
  }

  @override
  void didUpdateWidget(TextFieldControllerView oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);

    _textEditingController.text = widget.text;
  }

  @override
  void initState() {
    super.initState();

    _textEditingController.text = widget.text ?? "";

    _textEditingController.addListener(_onChange);
  }

  @override
  void dispose() {
    _textEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child(_textEditingController);
  }
}

