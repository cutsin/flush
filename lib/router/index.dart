import 'package:fluro/fluro.dart';

// Route Handlers
import './routes.dart';

class Routes {
  static void configureRoutes(Router router) {
    // Generate Routes
    routes.forEach((k, v) => router.define(v['path'], handler: v['handler'], transitionType: v['transitionType']));
    // 404
    router.notFoundHandler = Handler(handlerFunc: (_, params) {
      print("ROUTE WAS NOT FOUND");
      return;
    });
  }
}