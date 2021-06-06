import 'package:flutter/material.dart';
import 'package:flutter_helper/flutter_helper.dart';
import 'package:intl/intl.dart';

class DateAndTimeView extends StatelessWidget {
  final DateTime dateTime;
  final Function onSelected;
  
  DateAndTimeView({
    this.dateTime,
    this.onSelected
  });
  
  Future<DateTime> _showDatePicker(BuildContext context) async {
    return showDatePicker(
        context: context,
        initialDate: dateTime == null || dateTime == DateTime(3000) ? DateTime.now() : dateTime,
        firstDate: DateTime(2000),
        lastDate: DateTime(3000)
    );
  }

  Future<TimeOfDay> _showTimePicker(BuildContext context) async {
    return showTimePicker(
        context: context,
        initialTime: TimeOfDay.now()
    );
  }

  @override
  Widget build(BuildContext context) {
    return ButtonView(
        iconData: Icons.calendar_today,
        text: dateTime == null || dateTime == DateTime(3000) ? "Select date" : "${DateFormat.yMMMMd().add_jm().format(dateTime)}",
        onPressed: () async {
          final DateTime dateTime = await _showDatePicker(context);

          if (dateTime != null) {
            final TimeOfDay timeOfDay = await _showTimePicker(context);

            if (timeOfDay != null) {
              onSelected(
                  DateTime(
                  dateTime.year,
                  dateTime.month,
                  dateTime.day,
                  timeOfDay.hour,
                  timeOfDay.minute)
              );
            }
          }
        });
  }
}
