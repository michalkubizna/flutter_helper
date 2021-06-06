import 'package:flutter/material.dart';

class PaginationView extends StatefulWidget {
  final Future<void> Function() paginate;
  final Function child;

  PaginationView({
    this.paginate,
    this.child
  });

  @override
  _PaginationViewState createState() => _PaginationViewState();
}

class _PaginationViewState extends State<PaginationView> {
  bool _isLoading = false;

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.paginate != null) {
      _scrollController.addListener(() async {
        if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && !_isLoading) {
          setState(() {
            _isLoading = true;
          });

          await widget.paginate();

          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final child = _isLoading ? SizedBox(width: 100, height: 100, child: Align(alignment: Alignment.topCenter, child: CircularProgressIndicator())) : SizedBox(width: 80, height: 80);

    return widget.child(_scrollController, SafeArea(child: child));
  }
}
