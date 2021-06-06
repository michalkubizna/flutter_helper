import 'package:flutter/material.dart';
import 'package:flutter_helper/src/Models/BottomBar.dart';

class BottomAppBarView extends StatefulWidget {
  final List<BottomBar> datas;
  final Function onDestinationSelected;
  final Color selectedColor;
  final Color backgroundColor;
  final Color color;
  final int selectedIndex;

  BottomAppBarView(
      {
        this.datas,
        this.onDestinationSelected,
        this.selectedColor,
        this.backgroundColor,
        this.color = Colors.white,
        this.selectedIndex
      });

  @override
  _BottomAppBarViewState createState() => _BottomAppBarViewState();
}

class _BottomAppBarViewState extends State<BottomAppBarView> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 4.0,
      clipBehavior: Clip.antiAlias,
      color: widget.backgroundColor,
      child: Container(
        color: widget.backgroundColor,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var i = 0; i < widget.datas.length; i++)
                Flexible(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        widget.onDestinationSelected(i);
                      },
                      child: SizedBox(
                        height: 60,
                        child: FractionallySizedBox(
                          widthFactor: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconTheme(
                              data: IconThemeData(
                                  color: i == widget.selectedIndex
                                      ? widget.selectedColor
                                      : widget.color
                              ),
                              child: DefaultTextStyle(
                                style: TextStyle(
                                    color: i == widget.selectedIndex
                                        ? widget.selectedColor
                                        : widget.color,
                                    fontSize: 13
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    widget.datas[i].firstIcon,
                                    widget.datas[i].text
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
            ]..insert(widget.datas.length ~/ 2, Spacer())),
      ),
    );
  }
}