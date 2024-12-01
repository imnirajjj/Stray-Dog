extension StringExtension on String {
  /// [n] is length of string from which read me appears
  String toReadMe(int n) {
    if (length > n) {
      return '${substring(0, n - 2)}...';
    } else {
      return this;
    }
  }
}
