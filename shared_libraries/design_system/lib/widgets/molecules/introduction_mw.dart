import 'package:flutter/material.dart';

import '../atomics/image_aw.dart';
import '../atomics/text_aw.dart';

class IntroductionMW extends StatelessWidget {

	final String image;
	final String package;
	final String title;
	final String description;

	const IntroductionMW({
		super.key,
		required this.image,
		this.package = 'design_system',
		required this.title,
		required this.description,
	});

	@override
	Widget build(BuildContext context) {
		final bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
		final double screenWidth = MediaQuery.of(context).size.width;
		final double screenHeight = MediaQuery.of(context).size.height;
		final double width = isPortrait ? screenWidth : screenHeight;
		final double height = isPortrait ? screenWidth : screenHeight;
		return Padding(
			padding: const EdgeInsets.symmetric(horizontal: 38),
			child: Column(
				mainAxisAlignment: MainAxisAlignment.center,
				crossAxisAlignment: CrossAxisAlignment.center,
				children: [
					ImageAW(
						image: image, 
						package: package,
						alignment: Alignment.center,
						width: width,
						height: height,
					),
					const SizedBox(height: 41),
					Column(
						children: [
							TextAW.headline(
								text: title,
							),
							const SizedBox(height: 16,),
							Column(
								children: [
									TextAW.body(
										text: description,
										textAlign: TextAlign.center,
									),
								],
							),
						],
					),
				],
			)
		);
	}
}