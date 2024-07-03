extension StringToDoubleExtension on String {
  double get toDouble {
    // Use double.tryParse to convert the string to a double
    // If parsing fails, return 0.0 as a default value
    return double.tryParse(this) ?? 0.0;
  }
}
