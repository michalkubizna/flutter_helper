import 'package:flutter/material.dart';
import 'package:flutter_helper/flutter_helper.dart';

class TimeView extends StatefulWidget {
  final Function onSelected;
  final TimeOfDay initTime;
  final String text;

  TimeView({
    this.onSelected,
    this.initTime,
    this.text
  });

  @override
  _TimeViewState createState() => _TimeViewState();
}

class _TimeViewState extends State<TimeView> {
  TimeOfDay _timeOfDay;

  Future<TimeOfDay> _showTimePicker(BuildContext context) async {
    return showTimePicker(
        context: context,
        initialTime: TimeOfDay.now()
    );
  }

  @override
  void didUpdateWidget(TimeView oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);

    _timeOfDay = widget.initTime;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    _timeOfDay = widget.initTime;
  }

  @override
  Widget build(BuildContext context) {
    return ButtonView(
        iconData: Icons.timelapse,
        text: _timeOfDay == null ? widget.text ?? "Select time" : "${_timeOfDay.format(context)}",
        onPressed: () async {
          final TimeOfDay timeOfDay = await _showTimePicker(context);

          if (timeOfDay != null) {
            _timeOfDay = timeOfDay;
          }

          if (timeOfDay != null) {
            widget.onSelected(_timeOfDay);
          }
        }
    );
  }
}
