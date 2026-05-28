import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sushi/l10n/app_localizations.dart';
import 'package:sushi/services/app_locale.dart';
import 'pages/credits_and_support_page.dart';
import 'pages/settings_page.dart';
import 'pages/historical_page.dart';
import 'pages/intro_page.dart';
import 'pages/categories_page.dart';
import 'pages/language_page.dart';
import 'pages/logic_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Locale>(
      valueListenable: appLocaleNotifier,
      builder: (context, locale, _) {
        return ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              locale: locale,
              debugShowCheckedModeBanner: false,
              title: 'Progetto Pasticciotto',
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              home: const IntroPage(),
              routes: {
                '/intropage': (context) => const IntroPage(),
                '/categoriespage': (context) => const CategoriesPage(),
                '/settings': (context) => const Settings(),
                '/language': (context) => const LanguagePage(),
                '/creditsandsupport': (context) => const CreditsAndSupport(),
                '/logicpage': (context) => const LogicPage(),
                '/historicalpage': (context) => const HistoricalPage(),
              },
              builder: (context, widget) {
                ScreenUtil.init(context);
                return widget!;
              },
            );
          },
        );
      },
    );
  }
}
