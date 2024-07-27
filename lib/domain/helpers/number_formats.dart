import 'package:intl/intl.dart';

class NumberFormats {
  static String abbreviatedAmount(double number){
    return NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
    ).format(number);
  }

}