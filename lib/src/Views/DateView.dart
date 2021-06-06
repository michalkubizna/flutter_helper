import 'package:flutter/material.dart';
import 'package:flutter_helper/flutter_helper.dart';

class DateView extends StatefulWidget {
  final Function onSelected;
  final DateTime dateTime;
  final String text;
  final Color color;
  final MainAxisAlignment mainAxisAlignment;

  DateView({
    this.onSelected,
    this.dateTime,
    this.text,
    this.color,
    this.mainAxisAlignment
  });

  @override
  _DateViewState createState() => _DateViewState();
}

class _DateViewState extends State<DateView> {
  Future<DateTime> _showDatePicker(BuildContext context) async {
    final bool isNull = widget.dateTime == null || widget.dateTime == DateTime(3000);

    return showDatePicker(
        context: context,
        initialDate: isNull ? DateTime.now() : widget.dateTime,
        firstDate: DateTime(2000),
        lastDate: DateTime(3000)
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isNull = widget.dateTime == null || widget.dateTime == DateTime(3000);

//    final String dateFormat =
//    DateFormat.yMMMMd(Localizations.localeOf(context).toLanguageTag())
//        .format(widget.dateTime);

    final String dateFormat = DateFormatUtil().formatToPicker(widget.dateTime);

    return ButtonView(
        mainAxisAlignment: widget.mainAxisAlignment,
        color: widget.color,
        iconData: Icons.calendar_today,
        text: isNull ? widget.text ?? "Select date" : dateFormat,
        onPressed: () async {
          final DateTime dateTime = await _showDatePicker(context);

          if (dateTime != null) {
            widget.onSelected(dateTime);
          }
        });
  }
}
