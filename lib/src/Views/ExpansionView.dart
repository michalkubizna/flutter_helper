import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpansionView extends StatefulWidget {
  final Widget header;
  final Widget child;
  final Color color;

  ExpansionView({
    @required this.header,
    @required this.child,
    this.color
  });

  @override
  _ExpansionViewState createState() => _ExpansionViewState();
}

class _ExpansionViewState extends State<ExpansionView> {
  bool _isExpanded = false;

  void _change() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  Widget _transitionBuilder(Widget child, Animation<double> animation) {
    return SizeTransition(child: child, sizeFactor: animation);
  }

  AnimatedSwitcherTransitionBuilder _builder;

  UniqueKey _uniqueKey;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _builder = _transitionBuilder;

    _uniqueKey = UniqueKey();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: _change,
          child: Row(
            children: [
              Expanded(child: widget.header),
              ExpandIcon(
                color: widget.color,
                isExpanded: _isExpanded,
                onPressed: (isExpanded) {
                  _change();
                },
              ),
            ],
          ),
        ),
        AnimatedSwitcher(
          transitionBuilder: _builder,
          duration: Duration(milliseconds: 200),
          child: !_isExpanded ? Container() : Container(
            key: _uniqueKey,
            child: widget.child,
          ),
        ),
      ],
    );
  }
}

//    if (widget.children.isNotEmpty) {
//      return Theme(
//        data: ThemeData(
//            dividerColor: Colors.transparent,
//            accentColor: Colors.black,
//            unselectedWidgetColor: Colors.black),
//        child: ExpansionTile(
//          title: widget.children[0],
//          tilePadding: EdgeInsets.only(left: 12, right: 12),
//          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
//          children: widget.children.length > 1 ? ChildrenUtil().getAllPaddedChildren(widget.children.sublist(1)) : [],
//        ),
//      );
//    } else {
//      return SizedBox.shrink();
//    }
//    return Theme(
//      data: ThemeData(dividerColor: Colors.transparent, accentColor: Colors.grey, unselectedWidgetColor: Colors.grey),
//      child: Container(
//        decoration: BoxDecoration(
//          borderRadius: BorderRadius.circular(4),
//          border: Border.all(color: Colors.grey),
//        ),
//        child: ClipRRect(
//          borderRadius: BorderRadius.circular(4),
//          child: ExpansionTile(leading: widget.leading, tilePadding: EdgeInsets.only(left: 12, right: 12), title: DefaultTextStyle(
//              textAlign: TextAlign.left,
//              style: TextStyle(color: Colors.grey[600]),
//              child: widget.title), children: [
//            widget.child
//          ],),
//        ),
//      ),
//    );