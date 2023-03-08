import 'package:authentication/authentication.dart';
import 'package:dependencies/go_router/go_router.dart';

class AppRouter {

	List<GoRoute> initRoutes() {
		List<GoRoute> routes = <GoRoute>[];
		routes.addAll(AuthenticationRouter().initRoutes());
		return routes;
	}

}