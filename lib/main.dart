import 'package:cloud_financial_x/ui/hesab/account_structure_page.dart';
import 'package:cloud_financial_x/ui/hesab/hesab_form_controller.dart';

import 'data/repository/hesab_repository.dart';
import 'ui/product/product_form_controller.dart';
// import 'ui/product/product_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:cloud_financial_x/data/drift/app_database.dart' as drift_db;
import 'data/repository/product_repository.dart';
import 'data/repository/sync_queue_repository.dart';
import 'domain/services/product_service.dart';
import 'domain/services/hesab_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' hide Provider, ChangeNotifierProvider;
import 'package:go_router/go_router.dart';
import 'screens/dashboard_screen.dart';
import 'widgets/app_layout.dart';
import 'screens/login_screen.dart';
import 'screens/wallet_screen.dart';
import 'screens/reports_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/payment_screen.dart';
import 'screens/receive_screen.dart';
import 'screens/product_structure_screen.dart';
import 'screens/product_list_screen.dart';
// import 'screens/account_structure_screen.dart';
import 'screens/customer_list_screen.dart';
import 'screens/compound_document_screen.dart';
import 'screens/advanced_settings_screen.dart';
import 'screens/system_definitions_screen.dart';
import 'screens/development_settings_screen.dart';
import 'screens/sale_invoice_screen.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final db = drift_db.AppDatabase();
  final syncQueueRepo = SyncQueueRepository(db);
  final productRepo = ProductRepository(db, syncQueueRepo: syncQueueRepo);
  final hesabRepo = HesabRepository(db, syncQueueRepo: syncQueueRepo);
  final productService = ProductService(productRepo);
  final hesabService = HesabService(hesabRepo);

  runApp(
    MultiProvider(
      providers: [
        Provider.value(value: db),
        Provider.value(value: syncQueueRepo),
        Provider.value(value: productRepo),
        Provider.value(value: hesabRepo),
        Provider.value(value: productService),
        Provider.value(value: hesabService),
        ChangeNotifierProvider(create: (c) => ProductFormController(),),
        ChangeNotifierProvider(create: (c) => HesabFormController(),),
            // c.read<ProductRepository>(),
      ],
      child: const CloudFinancialApp(),
    ),
  );
}

class CloudFinancialApp extends ConsumerWidget {
  const CloudFinancialApp({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
//     return const MaterialApp(
//       // home: ProductsPage(),
//       home: AccountStructurePage(),
//     );
//   }
// }
    return MaterialApp.router(
      title: 'ابر مالی بازرگانی خرد پرداز',
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(),
      routerConfig: _router,
      locale: const Locale('fa', 'IR'),
      builder: (context, child) {
        // Force RTL and normalize text scaling to avoid Windows DPI/textScaleFactor
        final widgetChild = Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );

        final mq = MediaQuery.of(context);
        return MediaQuery(
          data: mq.copyWith(textScaleFactor: 1.0),
          child: widgetChild,
        );
      },
    );
  }

  ThemeData _buildTheme() {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Vazir',

      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF7C3AED),
        primary: const Color(0xFF7C3AED),
        secondary: const Color(0xFF2563EB),
        surface: Colors.white,
        background: const Color(0xFFF9FAFB),
      ),

      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, height: 1.3),
        displayMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, height: 1.3),
        displaySmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, height: 1.3),
        headlineLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, height: 1.3),
        headlineMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, height: 1.3),
        headlineSmall: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, height: 1.3),
        titleLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, height: 1.3),
        titleMedium: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, height: 1.3),
        titleSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, height: 1.3),
        bodyLarge: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, height: 1.4),
        bodyMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, height: 1.4),
        bodySmall: TextStyle(fontSize: 11, fontWeight: FontWeight.w400, height: 1.4),
        labelLarge: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, height: 1.3),
        labelMedium: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, height: 1.3),
        labelSmall: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, height: 1.3),
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 1,
        titleTextStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
          fontFamily: 'Vazir',
        ),
        iconTheme: IconThemeData(color: Colors.black87, size: 18),
      ),

      cardTheme: CardThemeData(
        elevation: 1,
        shadowColor: Colors.black12,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Color(0xFF7C3AED), width: 1.5),
        ),
      ),
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    ShellRoute(
      builder: (context, state, child) {
        return AppLayout(
          currentRoute:  '/dashboard',// state.uri.toString(),
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/dashboard',
          builder: (context, state) => const DashboardScreen(),
        ),
        GoRoute(
          path: '/wallet',
          builder: (context, state) => const WalletScreen(),
        ),
        GoRoute(
          path: '/reports',
          builder: (context, state) => const ReportsScreen(),
        ),
        GoRoute(
          path: '/settings',
          builder: (context, state) => const SettingsScreen(),
        ),
        GoRoute(
          path: '/payment',
          builder: (context, state) => const PaymentScreen(),
        ),
        GoRoute(
          path: '/receive',
          builder: (context, state) => const ReceiveScreen(),
        ),
        GoRoute(
          path: '/products',
          builder: (context, state) => const ProductStructureScreen(),
        ),
        GoRoute(
          path: '/product-list',
          builder: (context, state) => const ProductListScreen(),
        ),
        GoRoute(
          path: '/SaleInvoice',
          builder: (context, state) => const SaleInvoiceScreen(),
        ),
        GoRoute(
          path: '/accounts',
          builder: (context, state) => const AccountStructurePage(),
        ),
        GoRoute(
          path: '/customers',
          builder: (context, state) => const CustomerListScreen(),
        ),
        GoRoute(
          path: '/compound-document',
          builder: (context, state) => const CompoundDocumentScreen(),
        ),
        GoRoute(
          path: '/advanced-settings',
          builder: (context, state) => const AdvancedSettingsScreen(),
        ),
        GoRoute(
          path: '/system-definitions',
          builder: (context, state) => const SystemDefinitionsScreen(),
        ),
        GoRoute(
          path: '/dev-settings',
          builder: (context, state) => const DevelopmentSettingsScreen(),
        ),
      ],
    ),
  ],
);
