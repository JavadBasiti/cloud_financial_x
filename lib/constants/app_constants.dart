import 'package:flutter/material.dart';

class AppConstants {
  // App Information
  static const String appName = 'ابر مالی بازرگانی نوین اکس';
  static const String appNameShort = 'ابر مالی بازرگانی';
  static const String companyName = 'نوین اکس';
  static const String appVersion = '1.0.0';
  
  // Colors
  static const Color primaryColor = Color(0xFF7C3AED);
  static const Color secondaryColor = Color(0xFF2563EB);
  static const Color accentColor = Color(0xFF8B5CF6);
  static const Color successColor = Color(0xFF059669);
  static const Color warningColor = Color(0xFFEA580C);
  static const Color errorColor = Color(0xFFDC2626);
  static const Color surfaceColor = Color(0xFFF8FAFC);
  
  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryColor, secondaryColor],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient dashboardGradient = LinearGradient(
    colors: [primaryColor, accentColor, secondaryColor],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  // Text Styles
  static const TextStyle headingLarge = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Color(0xFF1F2937),
  );
  
  static const TextStyle headingMedium = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Color(0xFF1F2937),
  );
  
  static const TextStyle headingSmall = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Color(0xFF1F2937),
  );
  
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    color: Color(0xFF374151),
  );
  
  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    color: Color(0xFF374151),
  );
  
  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    color: Color(0xFF6B7280),
  );
  
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    color: Color(0xFF9CA3AF),
  );
  
  // Spacing
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double paddingXLarge = 32.0;
  
  // Border Radius
  static const double radiusSmall = 8.0;
  static const double radiusMedium = 12.0;
  static const double radiusLarge = 16.0;
  
  // Animation Durations
  static const Duration animationFast = Duration(milliseconds: 200);
  static const Duration animationMedium = Duration(milliseconds: 300);
  static const Duration animationSlow = Duration(milliseconds: 500);
  
  // Box Shadows
  static final List<BoxShadow> shadowSmall = [
    BoxShadow(
      color: Colors.black.withOpacity(0.05),
      blurRadius: 4,
      offset: const Offset(0, 2),
    ),
  ];
  
  static final List<BoxShadow> shadowMedium = [
    BoxShadow(
      color: Colors.black.withOpacity(0.08),
      blurRadius: 8,
      offset: const Offset(0, 4),
    ),
  ];
  
  static final List<BoxShadow> shadowLarge = [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      blurRadius: 16,
      offset: const Offset(0, 8),
    ),
  ];
  
  // Demo Data
  static const String demoPassword = 'demo123';
  
  // API Configuration
  static const String baseUrl = 'https://api.financial-system.com';
  static const Duration requestTimeout = Duration(seconds: 30);
  
  // Local Storage Keys
  static const String keyIsAuthenticated = 'is_authenticated';
  static const String keyUserData = 'user_data';
  static const String keySettings = 'settings';
  static const String keyWalletData = 'wallet_data';
  static const String keyTransactionHistory = 'transaction_history';
  
  // Currency Formats
  static const String iranianRialSymbol = 'ریال';
  static const String iranianTomanSymbol = 'تومان';
  static const String usdSymbol = 'USD';
  static const String eurSymbol = 'EUR';
  
  // Date Formats
  static const String persianDateFormat = 'yyyy/MM/dd';
  static const String persianDateTimeFormat = 'yyyy/MM/dd HH:mm';
  
  // Breakpoints for Responsive Design
  static const double mobileBreakpoint = 768;
  static const double tabletBreakpoint = 1024;
  static const double desktopBreakpoint = 1200;
  
  // Grid Configuration
  static const int mobileGridColumns = 2;
  static const int tabletGridColumns = 3;
  static const int desktopGridColumns = 4;
  
  // Navigation
  static const Duration navigationAnimationDuration = Duration(milliseconds: 250);
  
  // Error Messages
  static const String networkErrorMessage = 'خطا در اتصال به شبکه';
  static const String authenticationErrorMessage = 'خطا در احراز هویت';
  static const String generalErrorMessage = 'خطای غیرمنتظره رخ داده است';
  
  // Success Messages
  static const String loginSuccessMessage = 'ورود موفقیت‌آمیز';
  static const String transactionSuccessMessage = 'تراکنش با موفقیت انجام شد';
  static const String dataBackupSuccessMessage = 'پشتیبان‌گیری با موفقیت انجام شد';
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppConstants.primaryColor,
        brightness: Brightness.light,
      ),
      primaryColor: AppConstants.primaryColor,
      scaffoldBackgroundColor: AppConstants.surfaceColor,
      fontFamily: 'IRANSans',
      
      // App Bar Theme
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Color(0xFF1F2937),
        titleTextStyle: AppConstants.headingMedium,
      ),
      
      // Card Theme
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
        ),
        shadowColor: Colors.black.withOpacity(0.05),
      ),
      
      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppConstants.primaryColor,
          foregroundColor: Colors.white,
          elevation: 2,
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.paddingLarge,
            vertical: AppConstants.paddingMedium,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
          ),
        ),
      ),
      
      // Outlined Button Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppConstants.primaryColor,
          side: const BorderSide(color: AppConstants.primaryColor),
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.paddingLarge,
            vertical: AppConstants.paddingMedium,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
          ),
        ),
      ),
      
      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
          borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
          borderSide: const BorderSide(color: AppConstants.primaryColor),
        ),
        contentPadding: const EdgeInsets.all(AppConstants.paddingMedium),
      ),
      
      // Tab Bar Theme
      tabBarTheme: const TabBarThemeData(
        labelColor: Colors.white,
        unselectedLabelColor: Color(0xFF6B7280),
        indicator: BoxDecoration(
          color: AppConstants.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(AppConstants.radiusMedium)),
        ),
      ),
    );
  }
  
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppConstants.primaryColor,
        brightness: Brightness.dark,
      ),
      primaryColor: AppConstants.primaryColor,
      scaffoldBackgroundColor: const Color(0xFF0F172A),
      fontFamily: 'IRANSans',
    );
  }
}