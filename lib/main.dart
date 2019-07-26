import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import './app.dart';
import './router/index.dart';

main() => runApp(Main());

class Main extends StatefulWidget {
  @override
  State createState() {
    return MainState();
  }
}

class MainState extends State<Main> {
  MainState() {
    final router = Router();
    Routes.configureRoutes(router);
    App.router = router;
  }

  @override
  Widget build(BuildContext context) {
    final app = MaterialApp(
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