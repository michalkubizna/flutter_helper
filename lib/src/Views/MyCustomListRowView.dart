import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_helper/flutter_helper.dart';

class MyCustomScrollView extends StatelessWidget {
  final List<Widget> children;
  final Future<void> Function() paginate;
  final Widget Function(Widget) notFoundWidget;
  final bool isGrid;
  final double crossAxisCount;

  MyCustomScrollView({
    @required this.children,
    @required this.paginate,
    @required this.notFoundWidget,
    this.isGrid = false,
    this.crossAxisCount = 0.0
  });

  @override
  Widget build(BuildContext context) {
    // List<Widget> paddedChildren = ChildrenUtil().getAllPaddedChildren(children);

    return PaginationView(child: (scrollController, circularProgressIndicator) {
      return LayoutBuilder(builder: (context, constraints) {
        Widget child;

        if (isGrid) {
          child = CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverPadding(
                padding: EdgeInsets.all(12),
                sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) =>
                              SizedBox(
                                child: children[index],
                                height: 10,
                              ),
                      childCount: children.length
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12)
                ),
              ),
              SliverToBoxAdapter(
                child: circularProgressIndicator,
              )
            ],
          );
        } else {
          child = CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverPadding(
                padding: EdgeInsets.all(6),
                sliver: SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return Padding(padding: EdgeInsets.all(6), child: children[index]);
                    }, childCount: children.length),
                ),
              ),
              SliverToBoxAdapter(
                child: circularProgressIndicator,
              )
            ],
          );
        }

        return Scrollbar(
            child: notFoundWidget(child)
        );
      });
    }, paginate: paginate);
  }
}
