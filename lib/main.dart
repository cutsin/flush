import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import './app.dart';
import './router/index.dart';

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
    print(router);
    // Locales

    final app = MaterialApp(
      title: 'Flush',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: App.router.generator,
      // Locales
      localizationsDelegates: [
        i18n,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: i18n.supportedLocales,
      locale: Locale('zh'),
    );
    print("initial route = ${app.initialRoute}");
    return app;
    // Reload
    // https://hillel.dev/2018/08/15/flutter-how-to-rebuild-the-entire-app-to-change-the-theme-or-locale/
  }
}
