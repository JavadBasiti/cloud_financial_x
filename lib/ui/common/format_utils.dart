/// ابزارهای مشترک قالب‌بندی برای لایهٔ UI
///
/// این فایل شامل:
/// - تبدیل تاریخ میلادی به شمسی (بدون وابستگی به پکیج بیرونی)
/// - قالب‌بندی مبالغ با جداکنندهٔ هزارگان
/// - نرمال‌سازی ارقام فارسی/عربی برای ورودی‌های عددی
///
/// نکته معماری: دامنه (Domain) تاریخ‌ها را به صورت میلی‌ثانیه (epoch millis)
/// نگه می‌دارد؛ تبدیل به تقویم شمسی فقط یک دغدغهٔ نمایشی است و در همین لایه
/// انجام می‌شود.
library;

int _div(int a, int b) => a ~/ b;

int _mod(int a, int b) => a - (a ~/ b) * b;

/// نتیجهٔ محاسبات تقویم شمسی برای یک سال
class _JalaliCal {
  final int leap;
  final int gy;
  final int march;

  const _JalaliCal(this.leap, this.gy, this.march);
}

/// تاریخ شمسی (هجری خورشیدی)
///
/// پیاده‌سازی بر اساس الگوریتم استاندارد «جلالی» (Borkowski / jalaali)
class JalaliDate {
  final int year;
  final int month;
  final int day;

  const JalaliDate(this.year, this.month, this.day);

  static const List<String> monthNames = [
    'فروردین',
    'اردیبهشت',
    'خرداد',
    'تیر',
    'مرداد',
    'شهریور',
    'مهر',
    'آبان',
    'آذر',
    'دی',
    'بهمن',
    'اسفند',
  ];

  static const List<int> _breaks = [
    -61,
    9,
    38,
    199,
    426,
    686,
    756,
    818,
    1111,
    1181,
    1210,
    1635,
    2060,
    2097,
    2192,
    2262,
    2324,
    2394,
    2456,
    3178,
  ];

  /// ساخت تاریخ شمسی از تاریخ میلادی
  factory JalaliDate.fromDateTime(DateTime date) =>
      _jdnToJalali(_gregorianToJdn(date.year, date.month, date.day));

  /// ساخت تاریخ شمسی از میلی‌ثانیه (همان قالبی که در Domain ذخیره می‌شود)
  factory JalaliDate.fromEpochMillis(int millis) =>
      JalaliDate.fromDateTime(DateTime.fromMillisecondsSinceEpoch(millis));

  /// تبدیل به تاریخ میلادی
  DateTime toDateTime() {
    final g = _jdnToGregorian(_jalaliToJdn(year, month, day));
    return DateTime(g[0], g[1], g[2]);
  }

  /// میلی‌ثانیه معادل (برای ذخیره در Domain)
  int toEpochMillis() => toDateTime().millisecondsSinceEpoch;

  String get monthName => monthNames[month - 1];

  /// قالب کوتاه: 1404/03/22
  String format() => '$year/${_two(month)}/${_two(day)}';

  /// قالب بلند: 22 خرداد 1404
  String formatLong() => '$day $monthName $year';

  @override
  String toString() => format();

  static String _two(int value) => value.toString().padLeft(2, '0');

  // --- الگوریتم تبدیل ---

  static _JalaliCal _jalCal(int jy) {
    final bl = _breaks.length;
    final gy = jy + 621;
    var leapJ = -14;
    var jp = _breaks[0];

    if (jy < jp || jy >= _breaks[bl - 1]) {
      // خارج از بازهٔ پشتیبانی‌شده؛ مقدار امن برگردانده می‌شود
      return _JalaliCal(0, gy, 20);
    }

    var jump = 0;
    for (var i = 1; i < bl; i++) {
      final jm = _breaks[i];
      jump = jm - jp;
      if (jy < jm) break;
      leapJ = leapJ + _div(jump, 33) * 8 + _div(_mod(jump, 33), 4);
      jp = jm;
    }

    var n = jy - jp;
    leapJ = leapJ + _div(n, 33) * 8 + _div(_mod(n, 33) + 3, 4);
    if (_mod(jump, 33) == 4 && jump - n == 4) leapJ += 1;

    final leapG = _div(gy, 4) - _div((_div(gy, 100) + 1) * 3, 4) - 150;
    final march = 20 + leapJ - leapG;

    if (jump - n < 6) n = n - jump + _div(jump + 4, 33) * 33;
    var leap = _mod(_mod(n + 1, 33) - 1, 4);
    if (leap == -1) leap = 4;

    return _JalaliCal(leap, gy, march);
  }

  static int _gregorianToJdn(int gy, int gm, int gd) {
    var d = _div((gy + _div(gm - 8, 6) + 100100) * 1461, 4) +
        _div(153 * _mod(gm + 9, 12) + 2, 5) +
        gd -
        34840408;
    d = d - _div(_div(gy + 100100 + _div(gm - 8, 6), 100) * 3, 4) + 752;
    return d;
  }

  static List<int> _jdnToGregorian(int jdn) {
    var j = 4 * jdn + 139361631;
    j = j + _div(_div(4 * jdn + 183187720, 146097) * 3, 4) * 4 - 3908;
    final i = _div(_mod(j, 1461), 4) * 5 + 308;
    final gd = _div(_mod(i, 153), 5) + 1;
    final gm = _mod(_div(i, 153), 12) + 1;
    final gy = _div(j, 1461) - 100100 + _div(8 - gm, 6);
    return [gy, gm, gd];
  }

  static JalaliDate _jdnToJalali(int jdn) {
    final gy = _jdnToGregorian(jdn)[0];
    var jy = gy - 621;
    final cal = _jalCal(jy);
    final jdn1f = _gregorianToJdn(gy, 3, cal.march);
    var k = jdn - jdn1f;

    if (k >= 0) {
      if (k <= 185) {
        return JalaliDate(jy, 1 + _div(k, 31), _mod(k, 31) + 1);
      }
      k -= 186;
    } else {
      jy -= 1;
      k += 179;
      if (cal.leap == 1) k += 1;
    }

    return JalaliDate(jy, 7 + _div(k, 30), _mod(k, 30) + 1);
  }

  static int _jalaliToJdn(int jy, int jm, int jd) {
    final cal = _jalCal(jy);
    return _gregorianToJdn(cal.gy, 3, cal.march) +
        (jm - 1) * 31 -
        _div(jm, 7) * (jm - 7) +
        jd -
        1;
  }
}

/// قالب‌بندی تاریخ ذخیره‌شده (میلی‌ثانیه) به تاریخ شمسی کوتاه
String formatJalali(int? epochMillis) {
  if (epochMillis == null) return '-';
  return JalaliDate.fromEpochMillis(epochMillis).format();
}

/// قالب‌بندی تاریخ ذخیره‌شده (میلی‌ثانیه) به تاریخ شمسی بلند
String formatJalaliLong(int? epochMillis) {
  if (epochMillis == null) return '-';
  return JalaliDate.fromEpochMillis(epochMillis).formatLong();
}

/// قالب‌بندی عدد با جداکنندهٔ هزارگان
String formatAmount(num value, {int decimals = 0}) {
  final isNegative = value < 0;
  final fixed = value.abs().toStringAsFixed(decimals);
  final parts = fixed.split('.');
  final intPart = parts[0].replaceAllMapped(
    RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
    (m) => '${m[1]},',
  );
  final buffer = StringBuffer(isNegative ? '-' : '')..write(intPart);
  if (parts.length > 1) buffer.write('.${parts[1]}');
  return buffer.toString();
}

/// قالب‌بندی مبلغ؛ اگر مقدار اعشار داشته باشد تا دو رقم نمایش داده می‌شود
String formatMoney(num value) {
  final hasFraction = value != value.roundToDouble();
  return formatAmount(value, decimals: hasFraction ? 2 : 0);
}

/// تبدیل ارقام فارسی/عربی به ارقام لاتین و حذف جداکننده‌ها
String normalizeDigits(String input) {
  const persian = '۰۱۲۳۴۵۶۷۸۹';
  const arabic = '٠١٢٣٤٥٦٧٨٩';
  final buffer = StringBuffer();

  for (final char in input.split('')) {
    final pIndex = persian.indexOf(char);
    if (pIndex >= 0) {
      buffer.write(pIndex);
      continue;
    }
    final aIndex = arabic.indexOf(char);
    if (aIndex >= 0) {
      buffer.write(aIndex);
      continue;
    }
    if (char == ',' || char == '،' || char == ' ' || char == '\u200c') continue;
    buffer.write(char);
  }

  return buffer.toString();
}

/// تبدیل ورودی کاربر به مبلغ (double)
double parseAmount(String input) {
  final normalized = normalizeDigits(input.trim());
  if (normalized.isEmpty) return 0;
  return double.tryParse(normalized) ?? 0;
}

/// تبدیل ورودی کاربر به عدد صحیح
int parseIntValue(String input) {
  final normalized = normalizeDigits(input.trim());
  if (normalized.isEmpty) return 0;
  return int.tryParse(normalized) ?? 0;
}
