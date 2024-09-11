import 'package:intl/intl.dart';

String formatDateTime(DateTime dateTime) {
  DateFormat formatter = DateFormat('M/d/yyyy h:mm a');
  return formatter.format(dateTime);
}

String getDayOfWeek(String dateStr) {
  DateTime dateTime = DateTime.parse(dateStr);
  
  List<String> daysOfWeek = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun'
  ];
  
  int weekdayIndex = dateTime.weekday;
  
  return daysOfWeek[weekdayIndex - 1];
}
