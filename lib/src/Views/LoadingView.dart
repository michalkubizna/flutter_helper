import 'package:flutter/material.dart';
import 'package:flutter_helper/flutter_helper.dart';

class LoadingView extends StatefulWidget {
  final Function load;
  final Function callback;

  LoadingView({
    this.load,
    this.callback
  });

  @override
  _LoadingViewState createState() => _LoadingViewState();
}

class _LoadingViewState extends State<LoadingView> {
  bool _isLoading = false;

  Future<void> _load() async {
    setState(() {
      _isLoading = true;
    });

    await widget.load();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return OverlayView(
      isLoading: _isLoading,
      child: widget.callback(_load)
    );
  }
}