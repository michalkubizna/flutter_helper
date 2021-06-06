import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StreamView<T> extends StatelessWidget {
  final dynamic initialData;
  final Stream stream;
  final AsyncWidgetBuilder<T> builder;
  final Widget loader;

  StreamView({
    this.initialData,
    @required this.stream,
    @required this.builder,
    this.loader
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
        initialData: initialData,
        stream: stream,
        builder:
            (BuildContext context, AsyncSnapshot<T> snapshot) {
          if (initialData != null) {
            return builder(context, snapshot);
          } else {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return loader ?? Center(child: CircularProgressIndicator());
              default:
                return builder(context, snapshot);
            }
          }
        });
  }
}