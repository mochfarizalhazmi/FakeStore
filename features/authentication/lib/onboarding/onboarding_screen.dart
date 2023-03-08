import 'package:dependencies/go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';

class OnboardingScreen extends StatefulWidget {
	const OnboardingScreen({super.key});

	@override
	State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

	int _activateIndex = 0;
	final PageController _pageController = PageController(initialPage: 0);
	final List<Widget> _pages = [
		IntroductionMW(
			image: Assets.images.imagePlate.path,
			title: "All Your Favorites",
			description: "Order from the best local restaurants with easy, on-demand delivery.",
		),
		IntroductionMW(
			image: Assets.images.imageMotor.path,
			title: "Free delivery offers",
			description: "Free delivery for new customers via Apple Pay and others payment methods.",
		),
		IntroductionMW(
			image: Assets.images.imagePizza.path,
			title: "Choose your food",
			description: "Easily find your type of food craving and you’ll get delivery in wide range.",
		)
	];

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: Container(
				padding: const EdgeInsets.only(bottom: 161),
				child: Stack(
				  children: [
						PageView.builder(
							controller: _pageController,
							onPageChanged: (int page) {
								setState(() {
								  _activateIndex = page;
								});
							},
							itemCount: _pages.length,
							itemBuilder: (BuildContext context, int index) {
								return _pages[index % _pages.length];
							},
						),
						Positioned(
							bottom: 0,
							left: 0,
							right: 0,
							height: 50,
							child: Row(
								mainAxisAlignment: MainAxisAlignment.center,
								children: List<Widget>.generate(_pages.length, (index) {
									return Padding(
										key: Key("Padding_$index"),
										padding: const EdgeInsets.fromLTRB(4, 5, 4, 40),
										child: InkWell(
											key: Key("InkWell_$index"),
											child: Container(
												key: Key("Container_$index"),
												width: 8,
												height: 5,
												decoration: BoxDecoration(
													border: Border.all(
														color: index == _activateIndex ? ColorName.primaryColor : ColorName.bodyTextColor
													),
													color: index == _activateIndex ? ColorName.primaryColor : ColorName.bodyTextColor,
													borderRadius: const BorderRadius.all(Radius.circular(5))
												),
											),
											onTap: () {
												_pageController.animateToPage(
													index, 
													duration: const Duration(milliseconds: 300), 
													curve: Curves.easeIn
												);
											},
										),
									);
								}),
							),
						)
				  ],
				),
			),
			bottomSheet: Container(
				padding: const EdgeInsets.fromLTRB(20, 20, 20, 81),
				height: 161,
				child: ButtonAW(
					title: "GET STARTED",
					width: double.infinity,
					height: 60,
					onTap: () {
							context.go('/login');
						},
				),
			),
		);
	}
}

