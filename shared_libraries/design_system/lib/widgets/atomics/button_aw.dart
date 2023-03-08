
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class ButtonAW extends StatelessWidget {

	final String title;
	final double width;
  final double height;
	final bool disable;
	final bool loading;
	final bool outline;
	final void Function()? onTap;

	const ButtonAW({
		Key? key,
		required this.title,
		required this.width,
		required this.height,
		this.disable = false,
		this.loading = false,
		this.outline = false,
		this.onTap
	}) : super(key: key);

	const ButtonAW.outline({
		Key? key,
    required this.title,
		required this.width,
		required this.height,
		this.disable = false,
		this.loading = false,
		this.outline = true,
    this.onTap,
  }) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return InkWell(
			onTap: onTap,
			child: AnimatedContainer(
				duration: const Duration(milliseconds: 350),
				width: width,
				height: height,
				alignment: Alignment.center,
				decoration: !outline
					? BoxDecoration(
						color: !disable ? ColorName.primaryColor : ColorName.bodyTextColor,
						borderRadius: BorderRadius.circular(8),
					)
					: BoxDecoration(
						color: ColorName.backgroundColor,
						borderRadius: BorderRadius.circular(8),
						border: Border.all(
							color: ColorName.primaryColor,
							width: 1,
						)
					),
				child: !loading
				? Text(
						title,
						style: bodyStyle.copyWith(
							fontSize: !outline ? 14 : 12,
							fontWeight: !outline ? FontWeight.w700 : FontWeight.w600,
							color: !outline ? ColorName.backgroundColor : ColorName.primaryColor,
						),
					)
				: const CircularProgressIndicator(
						strokeWidth: 8,
						valueColor: AlwaysStoppedAnimation(ColorName.backgroundColor),
					),	
			),
		);
	}
}