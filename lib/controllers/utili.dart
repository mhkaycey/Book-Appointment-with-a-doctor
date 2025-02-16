import 'dart:math';

import 'package:intl/intl.dart';

class Utils {
  static String getDayOfWeek(DateTime date) => DateFormat('EEE').format(date);

  static String getDayOfMonth(DateTime date) => DateFormat('dd').format(date);

  static String getDate(DateTime date) => DateFormat('yyyy-MM-dd').format(date);

  static uniqueRefenece() {
    const String numbers = '0123456789';
    final Random random = Random.secure();

    String numericPart =
        List.generate(6, (index) => numbers[random.nextInt(numbers.length)])
            .join();

    var fn = int.parse(numericPart);

    log(fn);

    return '$fn';
  }
}
