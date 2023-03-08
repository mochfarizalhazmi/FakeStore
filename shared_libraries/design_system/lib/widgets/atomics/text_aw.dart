import 'package:design_system/base/styles.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui show TextHeightBehavior;

class TextAW extends StatelessWidget {

	final String text;
	final TextStyle style;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
	final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final ui.TextHeightBehavior? textHeightBehavior;
  final Color? selectionColor;

	const TextAW.heading1({
		Key? key,
		required this.text,
		this.style = heading1Style,
		this.textAlign,
		this.textDirection,
		this.locale,
		this.softWrap,
		this.overflow,
		this.textScaleFactor,
		this.maxLines,
		this.semanticsLabel,
		this.textWidthBasis,
		this.textHeightBehavior,
		this.selectionColor, 
	}) : super(key: key);

	const TextAW.heading2({
		Key? key,
		required this.text,
		this.style = heading2Style,
		this.textAlign,
		this.textDirection,
		this.locale,
		this.softWrap,
		this.overflow,
		this.textScaleFactor,
		this.maxLines,
		this.semanticsLabel,
		this.textWidthBasis,
		this.textHeightBehavior,
		this.selectionColor, 
	}) : super(key: key);

	const TextAW.heading3({
		Key? key,
		required this.text,
		this.style = heading3Style,
		this.textAlign,
		this.textDirection,
		this.locale,
		this.softWrap,
		this.overflow,
		this.textScaleFactor,
		this.maxLines,
		this.semanticsLabel,
		this.textWidthBasis,
		this.textHeightBehavior,
		this.selectionColor, 
	}) : super(key: key);

	const TextAW.headline({
		Key? key,
		required this.text,
		this.style = headlineStyle,
		this.textAlign,
		this.textDirection,
		this.locale,
		this.softWrap,
		this.overflow,
		this.textScaleFactor,
		this.maxLines,
		this.semanticsLabel,
		this.textWidthBasis,
		this.textHeightBehavior,
		this.selectionColor, 
	}) : super(key: key);

	const TextAW.subhead({
		Key? key,
		required this.text,
		this.style = subheadStyle,
		this.textAlign,
		this.textDirection,
		this.locale,
		this.softWrap,
		this.overflow,
		this.textScaleFactor,
		this.maxLines,
		this.semanticsLabel,
		this.textWidthBasis,
		this.textHeightBehavior,
		this.selectionColor, 
	}) : super(key: key);

	const TextAW.caption1({
		Key? key,
		required this.text,
		this.style = caption1Style,
		this.textAlign,
		this.textDirection,
		this.locale,
		this.softWrap,
		this.overflow,
		this.textScaleFactor,
		this.maxLines,
		this.semanticsLabel,
		this.textWidthBasis,
		this.textHeightBehavior,
		this.selectionColor, 
	}) : super(key: key);

	const TextAW.caption2({
		Key? key,
		required this.text,
		this.style = caption2Style,
		this.textAlign,
		this.textDirection,
		this.locale,
		this.softWrap,
		this.overflow,
		this.textScaleFactor,
		this.maxLines,
		this.semanticsLabel,
		this.textWidthBasis,
		this.textHeightBehavior,
		this.selectionColor, 
	}) : super(key: key);

	const TextAW.body({
		Key? key,
		required this.text,
		this.style = bodyStyle,
		this.textAlign,
		this.textDirection,
		this.locale,
		this.softWrap,
		this.overflow,
		this.textScaleFactor,
		this.maxLines,
		this.semanticsLabel,
		this.textWidthBasis,
		this.textHeightBehavior,
		this.selectionColor,
	}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Text(
			text,
			style: style,
			textAlign: textAlign,
			textDirection: textDirection,
			locale: locale,
			softWrap: softWrap,
			overflow: overflow,
			textScaleFactor: textScaleFactor,
			maxLines: maxLines,
			semanticsLabel: semanticsLabel,
			textWidthBasis: textWidthBasis,
			textHeightBehavior: textHeightBehavior,
			selectionColor: selectionColor,
		);
	}
}