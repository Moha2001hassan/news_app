import 'package:intl/intl.dart';

class AppDateFormatters{
  static String myY(DateTime dt) => DateFormat('MMM d,yyyy').format(dt);
}