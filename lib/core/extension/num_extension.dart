import 'package:intl/intl.dart';

extension StringExtension on num {
  String toCurrency({
    required String currencyCode,
    String? symbol,
  }) {
    return NumberFormat.currency(
      name: currencyCode,
      symbol: symbol == null ? null : '$symbol ',
    ).format(this);
  }
}
