# راهنمای توسعه‌دهنده Cloud Financial X

این سند یک راهنمای دقیق برای توسعه‌دهندگان است که می‌خواهند پروژه را ادامه دهند، تغییر دهند یا روی قابلیت‌های جدید آن کار کنند.

## 1) هدف سند

این راهنما شما را به‌سرعت با ساختار پروژه، جریان‌های اصلی اطلاعات، نقاط ورود توسعه و بهترین مسیرهای پیاده‌سازی آشنا می‌کند.

## 2) تصویر کلی معماری پروژه

این پروژه بر پایه‌ی معماری لایه‌ای و Local First طراحی شده است:

- Presentation Layer: صفحات و رابط کاربری
- Repository Layer: هماهنگی عملیات داده‌ای و Sync Queue
- Domain Layer: مدل‌های کسب‌وکار و قراردادهای همگام‌سازی
- Data Layer: پایگاه‌داده محلی Drift و مپ‌های داده
- Smart Intake Layer: ورودی هوشمند از تصویر/صدا/متن
- Cloud Sync Layer: آینده‌ای برای ارسال تغییرات به سرور
- Backend Layer: سرویس Java/Spring Boot برای پردازش و API

## 3) ساختار پوشه‌ها

### lib/main.dart
ورودی اصلی برنامه است. در این فایل:
- پایگاه‌داده محلی AppDatabase ساخته می‌شود
- Repositoryها ایجاد می‌شوند
- Providerها ثبت می‌شوند
- GoRouter تنظیم می‌شود

### lib/data/drift
شامل تعریف جدول‌ها و پایگاه‌داده‌ی Drift است:
- app_database.dart: تعریف AppDatabase و MigrationStrategy
- product_table.dart
- sync_queue_table.dart
- hesab_table.dart
- journal_table.dart
- journal_row_table.dart
- cost_center_table.dart

### lib/data/repository
مسئولیت اتصال بین داده و دامنه را دارد و اطمینان حاصل می‌کند که هر تغییر داده‌ای در Sync Queue نیز ثبت شود:
- ProductRepository
- HesabRepository
- JournalRepository (شامل رفتار JournalRow)
- CostCenterRepository
- SyncQueueRepository

### lib/data/mapper
مسئول تبدیل داده‌های Drift به مدل‌های دامنه و بالعکس است.

### lib/domain
مدل‌های اصلی کسب‌وکار و قراردادهای Sync در این پوشه قرار دارند:
- مدل‌های Freezed برای Product، Hesab، Journal، JournalRow، CostCenter
- SyncEntity: رابط مشترک برای همه مدل‌های همگام‌سازی‌شونده
- SyncQueueRecord: مدل صف همگام‌سازی
- ConflictResolutionService: قوانین حل تعارض

### lib/screens و lib/ui
صفحات و ویجت‌های رابط کاربری در اینجا قرار دارند. نقطه‌های کلیدی:
- dashboard_screen.dart
- login_screen.dart
- product_structure_screen.dart
- account_structure_screen.dart
- sale_invoice_screen.dart
- settings_screen.dart

### lib/widgets
شامل قالب‌بندی کلی اپلیکیشن و UI مشترک مانند AppLayout است.

## 4) گردش اصلی داده

### 4.1 ثبت داده جدید
1. کاربر داده را وارد می‌کند یا ورودی هوشمند آن را ایجاد می‌کند.
2. صفحه مربوطه داده را به Repository ارسال می‌کند.
3. Repository تغییر را در پایگاه‌داده محلی ثبت می‌کند.
4. در همان تراکنش، یک رکورد در SyncQueue درج می‌شود.
5. اگر اتصال شبکه وجود داشته باشد، سپس این رکوردها باید به سرور ارسال شوند.

### 4.2 جریان همگام‌سازی
- SyncQueueRepository مسئول مدیریت صف است.
- رکوردها در حالت Pending نگه داشته می‌شوند.
- در صورت موفقیت، رکورد حذف یا علامت‌گذاری می‌شود.
- در صورت خطا، Retry Count و Last Error ذخیره می‌شوند.

## 5) پشتیبانی از چند مبنای مالی و ارز

این پروژه برای حسابداری در چندین مبنای مالی طراحی شده است. برای هر سند و هر ردیف:
- ارز یا مبنای مالی باید ذخیره شود.
- نسخه و timestamps باید برای حل تعارض ثبت شود.
- مدل‌ها باید امکان ثبت ارزهای فیات، رمز ارز و سایر واحدهای مالی را داشته باشند.

### پیشنهاد پیاده‌سازی در مدل‌ها
- افزودن فیلد currencyCode به Journal و JournalRow
- ذخیره نرخ تبدیل در صورت نیاز به گزارش مقایسه‌ای
- نگهداری مبنای مالی در هنگام ثبت تراکنش‌ها

## 6) لایه هوشمند ورود اطلاعات

### وظیفه
هدف این لایه تبدیل داده‌های خام (تصویر، صوت، متن) به draft eventهای قابل بررسی است.

### اجزا
- Ingestion Adapter: دریافت و نرمال‌سازی ورودی
- OCR: استخراج متن از تصویر
- Speech-to-Text: تبدیل صوت به متن
- NLP/NER: استخراج نام‌ها، مبالغ، تاریخ‌ها، حساب‌ها، کالاها و طرف‌های معامله
- Draft Builder: ساخت ورودی اولیه بدون ثبت نهایی
- Validation: بررسی کیفیت و تعیین confidence
- Approval: صفحه یا سرویس تایید نهایی قبل از ثبت در Repository

## 7) پیشنهاد Backend

با توجه به تجربه‌ی Java/Spring Boot، Backend پروژه باید بر همین پایه استوار شود.

### معماری پیشنهادی Backend
- Spring Boot service برای API و پردازش
- Spring Security + JWT برای احراز هویت
- PostgreSQL/MySQL برای پایگاه‌داده سرور
- Queue/Event Bus مثل RabbitMQ یا Kafka برای پردازش غیرهمزمان
- ماژول‌های اصلی:
  - Draft Intake Service
  - OCR/Speech Processing API
  - Entity Extraction Service
  - Validation/Enrichment Service
  - Sync / Audit Service

## 8) نقاط ورود برای توسعه

### ورود سریع
1. lib/main.dart
2. lib/data/drift/app_database.dart
3. lib/data/repository/sync_queue_repository.dart
4. lib/data/repository/product_repository.dart
5. lib/domain/sync_entity.dart
6. lib/screens/product_structure_screen.dart
7. lib/screens/account_structure_screen.dart

### برای افزودن قابلیت جدید
1. مدل دامنه جدید یا زمینه‌ی موجود را در lib/domain تعریف کنید.
2. Mapperهای مربوطه را در lib/data/mapper توسعه دهید.
3. جدول یا فیلد جدید را در lib/data/drift اضافه کنید.
4. Repository مرتبط را اصلاح کنید تا رفتار جدید را پشتیبانی کند.
5. UI مناسب را در lib/screens یا lib/ui اضافه کنید.
6. اگر لازم است، SyncQueue را برای ثبت تغییرات جدید گسترش دهید.

## 9) پیشنهاد استانداردهای کدنویسی

- از Freezed برای مدل‌های immutable استفاده کنید.
- هر تغییر داده‌ای باید در یک تراکنش همراه با enqueue Sync ثبت شود.
- از soft delete به جای حذف مستقیم استفاده شود.
- ورودی‌های کاربر را قبل از ذخیره اعتبارسنجی کنید.
- نام‌گذاری فایل‌ها و کلاس‌ها را مطابق با فانکشن و موجودیت انجام دهید.

## 10) رفرنس‌های مهم

- lib/constants/app_constants.dart
- lib/data/drift/app_database.dart
- lib/data/repository/sync_queue_repository.dart
- lib/domain/sync_queue_record.dart
- lib/domain/SyncEntity.dart

## 11) نکته‌ی نهایی

این پروژه یک بستر قوی برای پیاده‌سازی یک سیستم مالی ابری است. تمرکز اولیه روی ذخیره‌ی محلی و صف همگام‌سازی بوده است؛ بنابراین توسعه قابلیت‌های جدید باید ابتدا در لایه‌ی Domain/Data انجام شود و سپس به UI و Backend اتصال پیدا کند.
