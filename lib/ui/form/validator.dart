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

  // بیشترین طول مجاز یک فیلد متنی (هماهنگ با محدودیت ستون‌های Drift)
  static Validator<String> maxLength(int n, {String? message}) {
    return (value) =>
    value.length > n ? (message ?? 'بیشترین اندازه $n حرف') : null;
  }

  //'Must be > 0'
  static Validator<int> positive({String message = 'الزامآ بزرگتر از 0'}) {
    return (value) =>
    value <= 0 ? message : null;
  }

  // برای فیلدهای عددی صحیح که می‌توانند صفر باشند (مثل شماره سند خودکار)
  static Validator<int> nonNegativeInt({String message = 'نمی‌تواند منفی باشد'}) {
    return (value) => value < 0 ? message : null;
  }

  // برای فیلدهای عددی غیرالزامی که می‌توانند 0 باشند
  static Validator<double> nonNegative({String message = 'Must be >= 0'}) {
    return (value) => value < 0 ? message : null;
  }

  // برای فیلدهای عددی که می‌توانند صفر یا مثبت باشند
  static Validator<double> positiveOrZero({String message = 'Must be >= 0'}) {
    return (value) => value < 0 ? message : null;
  }

  // مبلغ باید بزرگتر از صفر باشد (ردیف سند بدون مبلغ معنا ندارد)
  static Validator<double> positiveAmount({String message = 'مبلغ باید بزرگتر از صفر باشد'}) {
    return (value) => value <= 0 ? message : null;
  }

}
