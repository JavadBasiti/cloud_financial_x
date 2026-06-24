typedef Validator<T> = String? Function(T value);

class Validators {
  static Validator<String> required({String message = 'الزامی'}) {
    return (value) =>
    value.trim().isEmpty ? message : null;
  }

  static Validator<String> minLength(int n) {
    return (value) =>
    value.length < n ? 'کمترین اندازه $n حرف' : null;
  }
  //'Must be > 0'
  static Validator<int> positive({String message = 'الزامآ بزرگتر از 0'}) {
    return (value) =>
    value <= 0 ? message : null;
  }

  // برای فیلدهای عددی غیرالزامی که می‌توانند 0 باشند
  static Validator<double> nonNegative({String message = 'Must be >= 0'}) {
    return (value) => value < 0 ? message : null;
  }

  // برای فیلدهای عددی که می‌توانند صفر یا مثبت باشند
  static Validator<double> positiveOrZero({String message = 'Must be >= 0'}) {
    return (value) => value < 0 ? message : null;
  }

}
