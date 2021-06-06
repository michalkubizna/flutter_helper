import 'package:intl/intl.dart';

class DateFormatUtil {
  String formatToCupertinoPicker(DateTime dateTime) {
    return DateFormat('MMM d, yyyy').format(dateTime);
  }

  String formatToPicker(DateTime dateTime) {
    return DateFormat('EEEE, MMM d').format(dateTime);
  }

  DateTime parseToPicker(String day) {
    return DateFormat('EEEE, MMM d').parse(day);
  }

  String formatToMDY(DateTime dateTime) {
    return DateFormat("yyyy-MM-dd").format(dateTime);
  }

  DateTime parseToMDY(String day) {
    return DateFormat("yyyy-MM-dd").parse(day);
  }

  String formatToMD(DateTime dateTime) {
    return DateFormat("MM-dd").format(dateTime);
  }

  DateTime parseToMD(String day) {
    return DateFormat("MM-dd").parse(day);
  }
}