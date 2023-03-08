// import 'package:fake_store/screen/walkthrough_screen.dart';
import 'package:dependencies/go_router/go_router.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'injections/injections.dart';
import 'utils/app_router.dart';

void main() async {
	WidgetsFlutterBinding.ensureInitialized();	
  	// TODO: check flavor first, preprod or prod
  	await Injections(apiBaseUrl: "https://dummyjson.com").initialize();
  	runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
		return MaterialApp.router(
			title: 'FakeStore',
			theme: ThemeData(
				primaryColor: ColorName.primaryColor,
				scaffoldBackgroundColor: ColorName.backgroundColor,
			),
			routerConfig: GoRouter(routes: AppRouter().initRoutes()) ,
		);
  }
}
