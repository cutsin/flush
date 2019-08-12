import 'package:flutter/material.dart';

import './app.dart';
import './router/index.dart';
import './components/global.dart';

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
    final app = MaterialApp(
      key: scaffoldKey,
      title: 'Flush',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: App.router.generator,
    );
    print("initial route = ${app.initialRoute}");
    return app;
  }
}