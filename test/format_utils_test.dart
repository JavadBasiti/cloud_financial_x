import 'package:cloud_financial_x/ui/common/format_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('JalaliDate', () {
    test('تبدیل میلادی به شمسی', () {
      expect(JalaliDate.fromDateTime(DateTime(2026, 9, 7)).format(), '1405/06/16');
      expect(JalaliDate.fromDateTime(DateTime(2024, 3, 20)).format(), '1403/01/01');
      expect(JalaliDate.fromDateTime(DateTime(2025, 3, 21)).format(), '1404/01/01');
      expect(JalaliDate.fromDateTime(DateTime(2026, 3, 20)).format(), '1404/12/29');
    });

    test('تبدیل شمسی به میلادی', () {
      expect(const JalaliDate(1405, 6, 16).toDateTime(), DateTime(2026, 9, 7));
      expect(const JalaliDate(1403, 1, 1).toDateTime(), DateTime(2024, 3, 20));
    });

    test('رفت و برگشت تاریخ پایدار است', () {
      var date = DateTime(2020, 1, 1);
      while (date.isBefore(DateTime(2030, 1, 1))) {
        final jalali = JalaliDate.fromDateTime(date);
        expect(jalali.toDateTime(), DateTime(date.year, date.month, date.day));
        expect(jalali.month, inInclusiveRange(1, 12));
        expect(jalali.day, inInclusiveRange(1, 31));
        date = date.add(const Duration(days: 1));
      }
    });

    test('قالب بلند نام ماه را نمایش می‌دهد', () {
      expect(const JalaliDate(1404, 3, 22).formatLong(), '22 خرداد 1404');
    });
  });

  group('قالب‌بندی مبالغ', () {
    test('جداکننده هزارگان', () {
      expect(formatAmount(6600000), '6,600,000');
      expect(formatAmount(-1500), '-1,500');
      expect(formatMoney(1234.5), '1,234.50');
      expect(formatMoney(1234), '1,234');
    });

    test('تبدیل ورودی کاربر به عدد', () {
      expect(parseAmount('1,500,000'), 1500000);
      expect(parseAmount('۲۵۰۰'), 2500);
      expect(parseAmount(''), 0);
      expect(parseIntValue('۱۴۰۴'), 1404);
    });
  });
}
