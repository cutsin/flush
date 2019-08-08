import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

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
    final router = Router();
    Routes.configureRoutes(router);
    App.router = router;
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