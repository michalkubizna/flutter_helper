import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_helper/flutter_helper.dart';

class CupertinoTimeView extends StatelessWidget {
  final Function onSelected;
  final Duration duration;

  CupertinoTimeView({
    this.onSelected,
    this.duration
  });

  @override
  Widget build(BuildContext context) {
    return ButtonView(
        iconData: Icons.calendar_today,
        text: duration == null ? "Select duration" : "${duration.inHours} days",
        onPressed: () async {
          showModalBottomSheet(context: context, builder: (BuildContext context) {
            return Container(
              decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey))),
              height: MediaQuery.of(context).copyWith().size.height / 3,
              child: CupertinoTimerPicker(initialTimerDuration: duration ?? Duration(seconds: 0), onTimerDurationChanged: (Duration duration) {
                onSelected(duration);
              }),
            );
          });
        });
  }
}