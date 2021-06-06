import 'package:flutter/material.dart';

class OverlayView extends StatefulWidget {
  final Widget child;
  final bool isLoading;

  OverlayView({
    this.child,
    this.isLoading
  });

  @override
  _OverlayViewState createState() => _OverlayViewState();
}

class _OverlayViewState extends State<OverlayView> {
  OverlayEntry _overlayEntry;

  void add(BuildContext context) {
    _overlayEntry = OverlayEntry(
        builder: (context) {
          return SizedBox.expand(
            child: Container(
              color: Colors.black54,
              child: Center(child: CircularProgressIndicator()),
            ),
          );
        }
    );

    Overlay.of(context).insert(_overlayEntry);
  }

  void remove() {
    if (_overlayEntry != null) {
      _overlayEntry.remove();

      _overlayEntry = null;
    }
  }

  @override
  void didUpdateWidget(OverlayView oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.isLoading) {
        add(context);
      } else {
        remove();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
