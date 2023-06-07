import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'main/main_view.dart';
import 'settings/language_provider.dart';
import 'settings/theme_provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ThemeProvider themeProvider;
  late LanguageProvider languageProvider;

  @override
  void initState() {
    super.initState();
    themeProvider = ThemeProvider();
    themeProvider.loadBackgroundColor();

    languageProvider = LanguageProvider();
    languageProvider.loadLanguage();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>.value(value: themeProvider),
        ChangeNotifierProvider<LanguageProvider>.value(value: languageProvider),
      ],
      child: Consumer2<ThemeProvider, LanguageProvider>(
        builder: (context, themeProvider, languageProvider, child) {
          return MaterialApp(
            restorationScopeId: 'app',
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale(languageProvider.language),
            theme: ThemeData(
              scaffoldBackgroundColor: Color(themeProvider.backgroundColor),
              appBarTheme: AppBarTheme(
                color: Color(themeProvider.backgroundColor),
              ),
            ),
            home: const MainView(),
          );
        },
      ),
    );
  }
}
