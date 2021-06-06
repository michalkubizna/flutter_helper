import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FutureView<T> extends StatelessWidget {
  final dynamic initialData;
  final Future future;
  final AsyncWidgetBuilder<T> builder;
  final Widget loader;

  FutureView({
    this.initialData,
    @required this.future,
    @required this.builder,
    this.loader
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
        initialData: initialData,
        future: future,
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
