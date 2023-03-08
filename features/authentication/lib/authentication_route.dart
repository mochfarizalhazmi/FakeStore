import 'package:dependencies/go_router/go_router.dart';
import 'onboarding/onboarding_screen.dart';
import 'login/login_screen.dart';

class AuthenticationRouter {

	List<GoRoute> initRoutes() => [
		GoRoute(
      path: '/',
      builder: (context, state) => const OnboardingScreen(),
    ),
		GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    )
	];
}