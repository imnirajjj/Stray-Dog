import 'package:intl/intl.dart';

extension DatetimeExtension on DateTime {
  String readableDateWithoutTime() {
    return DateFormat('yyyy, MMMM, dd').format(this);
  }

  String dateWithDash() {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  DateTime makeTimeZero() {
    return DateTime(year, month, day);
  }
}
