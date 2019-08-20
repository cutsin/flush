import 'package:fluro/fluro.dart';

// Route Handlers
import './routes.dart';

Router router;

class Routes {
  static Router init () {
    if (router != null) return router;
    router = Router();
    // Generate Routes
    routes.forEach((k, v) {
      TransitionType transType = v['transitionType'] ?? TransitionType.inFromRight;
      router.define(v['path'], handler: v['handler'], transitionType: transType);
    });
    // 404
    router.notFoundHandler = Handler(handlerFunc: (_, params) {
      print("ROUTE WAS NOT FOUND");
      return;
    });
    return router;
  }
  static translate () {
    routes.forEach((k, v) {
      TransitionType transType = v['transitionType'] ?? TransitionType.inFromRight;
      router.define(v['path'], handler: v['handler'], transitionType: transType);
    });
  }
}
