# سند حسابداری (Journal) - چرخهٔ کامل CRUD

این سند، پیاده‌سازی Use Case «ورود و تغییرات سند حسابداری دوبل» را توضیح می‌دهد.

## 1) صفحهٔ نهایی

- مسیر فایل: `lib/ui/journal/compound_document_page.dart` (کلاس `CompoundDocumentPage`)
- دیالوگ ردیف سند: `lib/ui/journal/journal_row_dialog.dart`
- مسیر ناوبری: `/compound-document`

صفحهٔ قبلی `lib/screens/compound_document_screen.dart` که فقط طراحی ظاهری با دادهٔ نمونه بود
حذف و به لایهٔ `ui` منتقل شده است (هماهنگ با `ProductsPage` و `AccountStructurePage`).

## 2) زنجیرهٔ لایه‌ها

```
CompoundDocumentPage
  ├── JournalFormController      (اعتبارسنجی و ساخت Journal)
  ├── JournalRowFormController   (اعتبارسنجی و ساخت JournalRow)
  └── JournalService             (قواعد دامنه: تراز، شماره‌گذاری، آماده‌سازی)
        └── JournalRepository    (تراکنش اتمی Drift + ثبت در SyncQueue)
```

## 3) فیلدهای ورودی (هماهنگ با لایه Domain)

### سند (`Journal`)
| فیلد | ورودی در UI |
|---|---|
| `referenceNumber` | شماره سند (در صورت خالی بودن، خودکار تعیین می‌شود) |
| `date` | انتخاب تاریخ (نمایش شمسی، ذخیره به میلی‌ثانیه) |
| `description` | شرح سند (حداکثر ۴۰۰ کاراکتر، الزامی) |
| `currencyCode` | ارز/پایه مالی (IRR, USD, EUR, AED, BTC, USDT) |
| `isAuto` | کلید «سند خودکار» |
| `signed` | کلید «امضای سند» |

### ردیف سند (`JournalRow`)
| فیلد | ورودی در UI |
|---|---|
| `hesabId` | انتخاب سرفصل از `HesabService` |
| `prBed` / `prBest` | انتخاب سمت (بدهکار/بستانکار) + مبلغ |
| `costCenterId` | انتخاب مرکز هزینه از `CostCenterService` (اختیاری) |
| `descRow` | شرح ردیف (حداکثر ۲۵۵ کاراکتر) |
| `media` | لینک عکس/صوت/فایل مستند |
| `currencyCode` | ارز ردیف (پیش‌فرض از سند) |
| `isAuto` | ردیف تولیدشده توسط سیستم |
| `journalId` / `noSnd` / `date` / `rowF` | به‌صورت خودکار از سند والد تنظیم می‌شود |

## 4) قواعد حسابداری دوبل (در `JournalService`)

- هر سند حداقل دو ردیف دارد.
- هر ردیف فقط بدهکار یا فقط بستانکار است (نه هر دو، نه هیچ‌کدام).
- جمع بدهکار باید با جمع بستانکار برابر باشد (`JournalBalance.isBalanced`).
- ارز ردیف‌ها باید با ارز سند یکسان باشد.
- در صورت نقض قواعد، `JournalValidationException` پرتاب می‌شود و UI پیام را نمایش می‌دهد.

## 5) عملیات پشتیبانی‌شده

| عملیات | متد سرویس | رفتار داده |
|---|---|---|
| ایجاد سند + ردیف‌ها | `saveJournalWithRows(mode: create)` | درج سند و ردیف‌ها در یک تراکنش + enqueue در SyncQueue |
| ویرایش سند + ردیف‌ها | `saveJournalWithRows(mode: edit)` | تفکیک خودکار ردیف‌های جدید/ویرایش‌شده/حذف‌شده |
| حذف سند | `deleteJournal` | حذف نرم سند به همراه تمام ردیف‌ها |
| امضا/لغو امضا | `setSigned` | سند امضاشده قابل ویرایش و حذف نیست |
| شماره سند بعدی | `nextReferenceNumber` | بیشترین شماره موجود + ۱ (local-first) |

## 6) نکات و کارهای آینده

- تاریخ شمسی با ابزار داخلی `lib/ui/common/format_utils.dart` محاسبه می‌شود (بدون وابستگی بیرونی).
  انتخاب تاریخ فعلاً از `showDatePicker` میلادی استفاده می‌کند و مقدار انتخاب‌شده شمسی نمایش داده می‌شود.
- مرکز هزینه اختیاری است و در صورت انتخاب‌نشدن با رشتهٔ خالی ذخیره می‌شود؛ اگر در آینده
  `PRAGMA foreign_keys` فعال شود باید این حالت به `nullable` تبدیل گردد.
- تست‌های واحد: `test/journal_service_test.dart` و `test/format_utils_test.dart`
