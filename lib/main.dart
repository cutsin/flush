import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app.dart';
import 'router/index.dart';
import 'components/theme-manager.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(Main());
}

class Main extends StatefulWidget {
  @override
  State createState () => _MainState();
}

class _MainState extends State<Main> {
  _MainState() {
    App.router = Routes.init();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<ThemeData>(builder: (context) => themeManager.theme),
      ],
      child: Consumer<ThemeData>(
        builder: (context, theme, child) => MaterialApp(
          title: 'Flush',
          debugShowCheckedModeBanner: false,
          theme: theme,
          onGenerateRoute: App.router.generator,
          // Locales
          localizationsDelegates: [
            i18n,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: i18n.supportedLocales,
          locale: Locale('zh'),
        ),
      ),
    );
  }
}
