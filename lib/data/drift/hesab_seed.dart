import 'package:cloud_financial_x/domain/enums/account_level.dart';
import 'package:cloud_financial_x/domain/hesab.dart';
import 'package:cloud_financial_x/data/drift/app_database.dart' as drift_db;
import 'package:cloud_financial_x/data/mapper/hesab_mapper.dart';

/// یک رکورد بذر سرفصل حسابداری
///
/// برای ایجاد ساختار حسابداری پایه (Chart of Accounts) در پایگاه‌داده.
class HesabSeed {
  const HesabSeed({
    required this.code,
    required this.parentCode,
    required this.name,
    required this.level,
    this.nameEn = '',
    this.balance = 0,
  });

  /// کد سرفصل (مثلاً ۱۰۰۰)
  final String code;

  /// کد سرفصل اصلی (null یعنی سرفصل ریشه)
  final String? parentCode;

  /// نام سرفصل (فارسی)
  final String name;

  /// سطح سرفصل
  final AccountLevel level;

  /// نام انگلیسی سرفصل
  final String nameEn;

  /// موجودی اولیه سرفصل (فقط برای حساب‌های برگ)
  final double balance;
}

/// ساختار حسابداری default (Chart of Accounts) برای یک کسب‌وکار متوسط
/// با تولید ساده.
///
/// - سطح ۱: ۹ گروه اصلی (سرفصل‌های کل)
/// - سطح ۲: سرفصل‌های معین
/// - سطح ۳: سرفصل‌های تفصیلی
///
/// کدگذاری: گروه‌های سطح ۱ کدهای ۴‌رقمی دارند و حساب‌های زیرگروه با
/// کدهای زیرگروهی ادامه می‌یابند (مثلاً ۱۰۰۰ → ۱۱۰۰ → ۱۱۰۱).
const List<HesabSeed> defaultHesabs = [
  // ===== سطح ۱: دارایی‌ها =====
  HesabSeed(
    code: '1000',
    parentCode: null,
    name: 'دارایی‌های جاری',
    nameEn: 'Current Assets',
    level: AccountLevel.level1,
  ),
  HesabSeed(
    code: '1100',
    parentCode: '1000',
    name: 'نقد و بانک',
    nameEn: 'Cash & Bank',
    level: AccountLevel.level2,
  ),
  HesabSeed(
    code: '1101',
    parentCode: '1100',
    name: 'صندوق',
    nameEn: 'Cash',
    level: AccountLevel.level3,
    balance: 15000000,
  ),
  HesabSeed(
    code: '1102',
    parentCode: '1100',
    name: 'بانک ملی',
    nameEn: 'Melli Bank',
    level: AccountLevel.level3,
    balance: 45000000,
  ),
  HesabSeed(
    code: '1103',
    parentCode: '1100',
    name: 'بانک پارسیان',
    nameEn: 'Parsian Bank',
    level: AccountLevel.level3,
    balance: 25000000,
  ),
  HesabSeed(
    code: '1104',
    parentCode: '1100',
    name: 'بانک‌های دیگر',
    nameEn: 'Other Banks',
    level: AccountLevel.level3,
  ),
  HesabSeed(
    code: '1200',
    parentCode: '1000',
    name: 'حساب‌های دریافتنی',
    nameEn: 'Accounts Receivable',
    level: AccountLevel.level2,
  ),
  HesabSeed(
    code: '1201',
    parentCode: '1200',
    name: 'مشتریان',
    nameEn: 'Customers',
    level: AccountLevel.level3,
    balance: 35000000,
  ),
  HesabSeed(
    code: '1202',
    parentCode: '1200',
    name: 'چک دریافتنی',
    nameEn: 'Notes Receivable',
    level: AccountLevel.level3,
    balance: 5000000,
  ),
  HesabSeed(
    code: '1203',
    parentCode: '1200',
    name: 'سایر وصولی‌ها',
    nameEn: 'Other Receivables',
    level: AccountLevel.level3,
  ),
  HesabSeed(
    code: '1300',
    parentCode: '1000',
    name: 'مواد و کالا',
    nameEn: 'Materials & Goods',
    level: AccountLevel.level2,
  ),
  HesabSeed(
    code: '1301',
    parentCode: '1300',
    name: 'مواد اولیه',
    nameEn: 'Raw Materials',
    level: AccountLevel.level3,
  ),
  HesabSeed(
    code: '1302',
    parentCode: '1300',
    name: 'بسته‌بندی',
    nameEn: 'Packaging',
    level: AccountLevel.level3,
  ),
  HesabSeed(
    code: '1303',
    parentCode: '1300',
    name: 'محصولات نیمه‌تمام',
    nameEn: 'Goods in Process',
    level: AccountLevel.level3,
  ),
  HesabSeed(
    code: '1304',
    parentCode: '1300',
    name: 'کالاهای آماده',
    nameEn: 'Finished Goods',
    level: AccountLevel.level3,
  ),
  HesabSeed(
    code: '1400',
    parentCode: '1000',
    name: 'هزینه‌های پیش‌پرداخته',
    nameEn: 'Prepaid Expenses',
    level: AccountLevel.level2,
  ),
  HesabSeed(
    code: '1401',
    parentCode: '1400',
    name: 'هزینه‌های پیش‌پرداخته',
    nameEn: 'Prepaid Expenses',
    level: AccountLevel.level3,
  ),
  HesabSeed(
    code: '1402',
    parentCode: '1400',
    name: 'بیمه پیش‌پرداخته',
    nameEn: 'Prepaid Insurance',
    level: AccountLevel.level3,
  ),

  // ===== سطح ۱: دارایی‌های غیرجاری =====
  HesabSeed(
    code: '1500',
    parentCode: null,
    name: 'دارایی‌های غیرجاری',
    nameEn: 'Non-current Assets',
    level: AccountLevel.level1,
  ),
  HesabSeed(
    code: '1510',
    parentCode: '1500',
    name: 'دارایی‌های ثابت',
    nameEn: 'Fixed Assets',
    level: AccountLevel.level2,
  ),
  HesabSeed(
    code: '1511',
    parentCode: '1510',
    name: 'ماشین‌آلات و تجهیزات',
    nameEn: 'Machinery & Equipment',
    level: AccountLevel.level3,
  ),
  HesabSeed(
    code: '1512',
    parentCode: '1510',
    name: 'وسایل نقلیه',
    nameEn: 'Vehicles',
    level: AccountLevel.level3,
  ),
  HesabSeed(
    code: '1513',
    parentCode: '1510',
    name: 'لوازم و تجهیزات اداری',
    nameEn: 'Furniture & Office Equipment',
    level: AccountLevel.level3,
  ),
  HesabSeed(
    code: '1520',
    parentCode: '1500',
    name: 'املاک و سازه‌ها',
    nameEn: 'Land & Buildings',
    level: AccountLevel.level2,
  ),
  HesabSeed(
    code: '1521',
    parentCode: '1520',
    name: 'زمین',
    nameEn: 'Land',
    level: AccountLevel.level3,
  ),
  HesabSeed(
    code: '1522',
    parentCode: '1520',
    name: 'ساختمان‌ها',
    nameEn: 'Buildings',
    level: AccountLevel.level3,
  ),
  HesabSeed(
    code: '1530',
    parentCode: '1500',
    name: 'دارایی‌های حق‌الحاقي',
    nameEn: 'Intangible Assets',
    level: AccountLevel.level2,
  ),
  HesabSeed(
    code: '1531',
    parentCode: '1530',
    name: 'حسن رواج',
    nameEn: 'Goodwill',
    level: AccountLevel.level3,
  ),
  HesabSeed(
    code: '1532',
    parentCode: '1530',
    name: 'حق‌اختراع و مجوزها',
    nameEn: 'Patents & Licenses',
    level: AccountLevel.level3,
  ),

  // ===== سطح ۱: بدهی‌های جاری =====
  HesabSeed(
    code: '2000',
    parentCode: null,
    name: 'بدهی‌های جاری',
    nameEn: 'Current Liabilities',
    level: AccountLevel.level1,
  ),
  HesabSeed(
    code: '2100',
    parentCode: '2000',
    name: 'حساب‌های پرداختنی',
    nameEn: 'Accounts Payable',
    level: AccountLevel.level2,
  ),
  HesabSeed(
    code: '2101',
    parentCode: '2100',
    name: 'تامین‌کنندگان',
    nameEn: 'Suppliers',
    level: AccountLevel.level3,
    balance: 40000000,
  ),
  HesabSeed(
    code: '2102',
    parentCode: '2100',
    name: 'چک پرداختنی',
    nameEn: 'Notes Payable',
    level: AccountLevel.level3,
    balance: 5000000,
  ),
  HesabSeed(
    code: '2200',
    parentCode: '2000',
    name: 'بدهی‌های کوتاه‌مدت',
    nameEn: 'Short-term Debt',
    level: AccountLevel.level2,
  ),
  HesabSeed(
    code: '2201',
    parentCode: '2200',
    name: 'تسهیلات بانکی کوتاه‌مدت',
    nameEn: 'Short-term Bank Loans',
    level: AccountLevel.level3,
    balance: 30000000,
  ),
  HesabSeed(
    code: '2202',
    parentCode: '2200',
    name: 'سایر بدهی‌های کوتاه‌مدت',
    nameEn: 'Other Short-term Debt',
    level: AccountLevel.level3,
  ),
  HesabSeed(
    code: '2300',
    parentCode: '2000',
    name: 'بدهی‌های تعهدی',
    nameEn: 'Accrued Liabilities',
    level: AccountLevel.level2,
  ),
  HesabSeed(
    code: '2301',
    parentCode: '2300',
    name: 'هزینه‌های تعهدی',
    nameEn: 'Accrued Expenses',
    level: AccountLevel.level3,
  ),
  HesabSeed(
    code: '2302',
    parentCode: '2300',
    name: 'مطالبات کارکنان',
    nameEn: 'Employee Payables',
    level: AccountLevel.level3,
  ),
  HesabSeed(
    code: '2303',
    parentCode: '2300',
    name: 'مالیات‌های پرداختنی',
    nameEn: 'Taxes Payable',
    level: AccountLevel.level3,
  ),

  // ===== سطح ۱: بدهی‌های غیرجاری =====
  HesabSeed(
    code: '2500',
    parentCode: null,
    name: 'بدهی‌های غیرجاری',
    nameEn: 'Non-current Liabilities',
    level: AccountLevel.level1,
  ),
  HesabSeed(
    code: '2510',
    parentCode: '2500',
    name: 'تسهیلات بلند‌مدت',
    nameEn: 'Long-term Loans',
    level: AccountLevel.level2,
  ),
  HesabSeed(
    code: '2511',
    parentCode: '2510',
    name: 'تسهیلات بانکی بلند‌مدت',
    nameEn: 'Long-term Bank Loans',
    level: AccountLevel.level3,
  ),
  HesabSeed(
    code: '2512',
    parentCode: '2510',
    name: 'سایر بدهی‌های بلند‌مدت',
    nameEn: 'Other Long-term Debt',
    level: AccountLevel.level3,
  ),
  HesabSeed(
    code: '2520',
    parentCode: '2500',
    name: 'سایر بدهی‌های غیرجاری',
    nameEn: 'Other Non-current Liabilities',
    level: AccountLevel.level2,
  ),
  HesabSeed(
    code: '2521',
    parentCode: '2520',
    name: 'تعهدات اجاره',
    nameEn: 'Lease Liabilities',
    level: AccountLevel.level3,
  ),
  HesabSeed(
    code: '2522',
    parentCode: '2520',
    name: 'بدهی‌های پس‌رفته',
    nameEn: 'Deferred Liabilities',
    level: AccountLevel.level3,
  ),

  // ===== سطح ۱: حقوق صاحبان =====
  HesabSeed(
    code: '3000',
    parentCode: null,
    name: 'حقوق صاحبان',
    nameEn: 'Equity',
    level: AccountLevel.level1,
  ),
  HesabSeed(
    code: '3100',
    parentCode: '3000',
    name: 'سرمایه',
    nameEn: 'Paid-in Capital',
    level: AccountLevel.level2,
  ),
  HesabSeed(
    code: '3101',
    parentCode: '3100',
    name: 'سرمایه سهام',
    nameEn: 'Common Stock',
    level: AccountLevel.level3,
  ),
  HesabSeed(
    code: '3200',
    parentCode: '3000',
    name: 'سودهای انباشته',
    nameEn: 'Retained Earnings',
    level: AccountLevel.level2,
  ),
  HesabSeed(
    code: '3201',
    parentCode: '3200',
    name: 'سودهای انباشته',
    nameEn: 'Retained Earnings',
    level: AccountLevel.level3,
  ),
  HesabSeed(
    code: '3300',
    parentCode: '3000',
    name: 'ذخایر',
    nameEn: 'Reserves',
    level: AccountLevel.level2,
  ),
  HesabSeed(
    code: '3301',
    parentCode: '3300',
    name: 'ذخایر قانونی',
    nameEn: 'Legal Reserves',
    level: AccountLevel.level3,
  ),
  HesabSeed(
    code: '3302',
    parentCode: '3300',
    name: 'ذخایر عمومی',
    nameEn: 'General Reserves',
    level: AccountLevel.level3,
  ),

  // ===== سطح ۱: درآمدها =====
  HesabSeed(
    code: '4000',
    parentCode: null,
    name: 'درآمدها',
    nameEn: 'Revenues',
    level: AccountLevel.level1,
  ),
  HesabSeed(
    code: '4100',
    parentCode: '4000',
    name: 'فروش محصولات',
    nameEn: 'Sales of Products',
    level: AccountLevel.level2,
  ),
  HesabSeed(
    code: '4101',
    parentCode: '4100',
    name: 'فروش داخلی',
    nameEn: 'Domestic Sales',
    level: AccountLevel.level3,
    balance: 180000000,
  ),
  HesabSeed(
    code: '4102',
    parentCode: '4100',
    name: 'فروش خارج از کشور',
    nameEn: 'Export Sales',
    level: AccountLevel.level3,
  ),
  HesabSeed(
    code: '4200',
    parentCode: '4000',
    name: 'درآمد خدمات',
    nameEn: 'Service Revenue',
    level: AccountLevel.level2,
  ),
  HesabSeed(
    code: '4201',
    parentCode: '4200',
    name: 'خدمات مشاوره',
    nameEn: 'Consulting Services',
    level: AccountLevel.level3,
    balance: 20000000,
  ),
  HesabSeed(
    code: '4202',
    parentCode: '4200',
    name: 'سایر خدمات',
    nameEn: 'Other Services',
    level: AccountLevel.level3,
  ),

  // ===== سطح ۱: هزینه کالاهای فروش‌شده =====
  HesabSeed(
    code: '5000',
    parentCode: null,
    name: 'هزینه کالاهای فروش‌شده',
    nameEn: 'Cost of Goods Sold',
    level: AccountLevel.level1,
  ),
  HesabSeed(
    code: '5100',
    parentCode: '5000',
    name: 'هزینه مواد اولیه',
    nameEn: 'Raw Materials Cost',
    level: AccountLevel.level2,
  ),
  HesabSeed(
    code: '5101',
    parentCode: '5100',
    name: 'مصرف مواد اولیه',
    nameEn: 'Raw Materials Consumption',
    level: AccountLevel.level3,
  ),
  HesabSeed(
    code: '5102',
    parentCode: '5100',
    name: 'هزینه بسته‌بندی',
    nameEn: 'Packaging Cost',
    level: AccountLevel.level3,
  ),
  HesabSeed(
    code: '5200',
    parentCode: '5000',
    name: 'هزینه نیروی مستقیم',
    nameEn: 'Direct Labor',
    level: AccountLevel.level2,
  ),
  HesabSeed(
    code: '5201',
    parentCode: '5200',
    name: 'دستمزد تولید',
    nameEn: 'Production Wages',
    level: AccountLevel.level3,
  ),
  HesabSeed(
    code: '5202',
    parentCode: '5200',
    name: 'پاداش تولید',
    nameEn: 'Production Bonuses',
    level: AccountLevel.level3,
  ),
  HesabSeed(
    code: '5300',
    parentCode: '5000',
    name: 'هزینه‌های کارگاهی',
    nameEn: 'Manufacturing Overhead',
    level: AccountLevel.level2,
  ),
  HesabSeed(
    code: '5301',
    parentCode: '5300',
    name: 'قبوض کارخانه',
    nameEn: 'Factory Utilities',
    level: AccountLevel.level3,
  ),
  HesabSeed(
    code: '5302',
    parentCode: '5300',
    name: 'نگهداری کارخانه',
    nameEn: 'Factory Maintenance',
    level: AccountLevel.level3,
  ),

  // ===== سطح ۱: هزینه‌های عملیاتی =====
  HesabSeed(
    code: '5500',
    parentCode: null,
    name: 'هزینه‌های عملیاتی',
    nameEn: 'Operating Expenses',
    level: AccountLevel.level1,
  ),
  HesabSeed(
    code: '5510',
    parentCode: '5500',
    name: 'هزینه‌های فروش',
    nameEn: 'Selling Expenses',
    level: AccountLevel.level2,
  ),
  HesabSeed(
    code: '5511',
    parentCode: '5510',
    name: 'هزینه تبلیغات',
    nameEn: 'Advertising',
    level: AccountLevel.level3,
  ),
  HesabSeed(
    code: '5512',
    parentCode: '5510',
    name: 'هزینه حمل‌ونقل',
    nameEn: 'Transportation',
    level: AccountLevel.level3,
  ),
  HesabSeed(
    code: '5520',
    parentCode: '5500',
    name: 'هزینه‌های مدیریتی',
    nameEn: 'Administrative Expenses',
    level: AccountLevel.level2,
  ),
  HesabSeed(
    code: '5521',
    parentCode: '5520',
    name: 'دستمزدها و حقوق',
    nameEn: 'Salaries & Wages',
    level: AccountLevel.level3,
  ),
  HesabSeed(
    code: '5522',
    parentCode: '5520',
    name: 'اجاره و قبوض',
    nameEn: 'Rent & Utilities',
    level: AccountLevel.level3,
  ),
  HesabSeed(
    code: '5523',
    parentCode: '5520',
    name: 'هزینه‌های اداری',
    nameEn: 'Office Expenses',
    level: AccountLevel.level3,
  ),
  HesabSeed(
    code: '5530',
    parentCode: '5500',
    name: 'هزینه‌های مالی',
    nameEn: 'Financial Expenses',
    level: AccountLevel.level2,
  ),
  HesabSeed(
    code: '5531',
    parentCode: '5530',
    name: 'کارمزد بانکی',
    nameEn: 'Bank Charges',
    level: AccountLevel.level3,
  ),
  HesabSeed(
    code: '5532',
    parentCode: '5530',
    name: 'سود تسهیلات',
    nameEn: 'Interest Expense',
    level: AccountLevel.level3,
  ),

  // ===== سطح ۱: حساب‌های امانتی =====
  HesabSeed(
    code: '6000',
    parentCode: null,
    name: 'حساب‌های امانتی',
    nameEn: 'Fiduciary Accounts',
    level: AccountLevel.level1,
  ),
  HesabSeed(
    code: '6100',
    parentCode: '6000',
    name: 'واگذاری‌های مشتری',
    nameEn: 'Customer Deposits',
    level: AccountLevel.level2,
  ),
  HesabSeed(
    code: '6101',
    parentCode: '6100',
    name: 'پیش‌پرداخت مشتری',
    nameEn: 'Customer Advances',
    level: AccountLevel.level3,
  ),
  HesabSeed(
    code: '6200',
    parentCode: '6000',
    name: 'مالیات‌های کسر‌شده',
    nameEn: 'Withheld Taxes',
    level: AccountLevel.level2,
  ),
  HesabSeed(
    code: '6201',
    parentCode: '6200',
    name: 'نگهداری مالیات',
    nameEn: 'Tax Withholding',
    level: AccountLevel.level3,
  ),
  HesabSeed(
    code: '6202',
    parentCode: '6200',
    name: 'وجوه بیمه',
    nameEn: 'Insurance Funds',
    level: AccountLevel.level3,
  ),
];

/// ساخت شناسه یکتا (UUID) برای سرفصل با کد داده‌شده.
///
/// شناسه‌ها از کد حساب تولید می‌شوند تا در ایجاد بذر در هر محیط
/// یکسان باشند.
String hesabIdForCode(String code) =>
    '00000000-0000-0000-0000-${code.padLeft(12, '0')}';

/// وارد کردن ساختار حسابداری default به پایگاه‌داده.
///
/// این تابع داده‌های بذر را در جدول hesabs درج می‌کند:
/// - اگر جدول از قبل خالی باشد، همه رکوردهای بذر وارد می‌شوند.
/// - موجودی گروه‌ها (سرفصل‌های سطح ۱ و ۲) به‌صورت خودکار به جمع
///   موجودی فرزندان آن گروه محاسبه می‌شود.
Future<void> seedDefaultHesabs(drift_db.AppDatabase db) async {
  final now = DateTime.now().millisecondsSinceEpoch;

  await db.transaction(() async {
    // اگر جدول از قبل پر است، ذخیره‌سازی انجام نمی‌شود
    final existing = await db.select(db.hesabs).get();
    if (existing.isNotEmpty) return;

    // محاسبه موجودی هر سرفصل: جمع موجودی فرزندان + موجودی خودش
    final balanceByCode = <String, double>{};
    for (final seed in defaultHesabs) {
      balanceByCode[seed.code] = seed.balance;
    }
    for (final seed in defaultHesabs) {
      final parent = seed.parentCode;
      if (parent != null) {
        balanceByCode[parent] = (balanceByCode[parent] ?? 0) + seed.balance;
      }
    }

    for (final seed in defaultHesabs) {
      final parentCode = seed.parentCode;
      await db.into(db.hesabs).insert(
        HesabMapper.toInsert(
          Hesab(
            id: hesabIdForCode(seed.code),
            level: seed.level,
            parentId: parentCode == null ? null : hesabIdForCode(parentCode),
            code: seed.code,
            name: seed.name,
            balance: balanceByCode[seed.code],
            fuPrice: null,
            nameEn: seed.nameEn,
            createdAt: now,
            updatedAt: now,
            version: 1,
            isDeleted: false,
          ),
        ),
      );
    }
  });
}
