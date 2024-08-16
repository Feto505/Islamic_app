import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_app/core/settings_provider.dart';
import 'package:islamic_app/moduls/quran/sura_details_view.dart';
import '/moduls/splash/splashView.dart';
import 'core/themes/app_theme.dart';
import 'layouts/layoutView.dart';
import 'moduls/hadith/hadith_details_view.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => SettingsProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context); //singleton
    return MaterialApp(
        themeMode: provider.currentTheme,
        theme: AppThemeManager.lightTheme,
        darkTheme: AppThemeManager.darkTheme,
        locale: Locale(provider.currentLanguage),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        title: 'islamic app',
        debugShowCheckedModeBanner: false,
        // theme: AppThemeManager.lightTheme,
        initialRoute: SplashView.routeName,
        routes: {
          SplashView.routeName: (context) => const SplashView(),
          Layoutview.routeName: (context) => const Layoutview(),
          SuraDetailsView.routeName: (context) => const SuraDetailsView(),
          HadithDetailsView.routeName: (context) => const HadithDetailsView(),
        });
  }
}
