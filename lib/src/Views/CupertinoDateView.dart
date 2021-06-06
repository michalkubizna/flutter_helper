import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_helper/flutter_helper.dart';
import 'package:intl/intl.dart';

class CupertinoDateView extends StatelessWidget {
  final Function onSelected;
  final DateTime initTime;
  final CupertinoDatePickerMode mode;

  CupertinoDateView({
    this.onSelected,
    this.initTime,
    this.mode
  });

  @override
  Widget build(BuildContext context) {
    return ButtonView(
        iconData: Icons.timelapse,
        text: initTime == null ? "Select date" : "${mode != null ? DateFormat.jm().format(initTime) : DateFormat.yMMMMd().add_jm().format(initTime)}",
        onPressed: () async {
          showModalBottomSheet(context: context, builder: (BuildContext context) {
            return Container(
              decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey))),
              height: MediaQuery.of(context).copyWith().size.height / 3,
              child: CupertinoDatePicker(mode: mode ?? CupertinoDatePickerMode.dateAndTime, initialDateTime: initTime ?? DateTime.now(), onDateTimeChanged: (DateTime dateTime) {
                onSelected(dateTime);
              }),
            );
          });
        });
  }
}