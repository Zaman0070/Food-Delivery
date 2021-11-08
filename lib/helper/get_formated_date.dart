import 'package:intl/intl.dart';

DateTime? getDateFormatedFromString(String? date) {
  if (date != null) {
    DateFormat format = new DateFormat("yyyy-MM-dd");
    DateTime formattedDate = format.parse(date);
    return formattedDate;
  } else
    return null;
}

String getDateFormatedToString(DateTime date) {
  DateFormat format = new DateFormat("yyyy-MM-dd");
  String formattedDate = format.format(date);
  return formattedDate;
}
