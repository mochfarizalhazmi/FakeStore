import 'package:dependencies/flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class ImageAW extends StatelessWidget {

	final String image;
	final String? package;
  final String? semanticLabel;
  final double? width;
  final double? height;
  final AlignmentGeometry alignment;
  final Color? color;
  final Animation<double>? opacity;
  final BlendMode? colorBlendMode;
  final BoxFit? fit;
  final ImageRepeat repeat;
  final Rect? centerSlice;
  final FilterQuality filterQuality;
	
	const ImageAW({
		Key? key,
		required this.image,
		this.package,
    this.semanticLabel,
    this.width,
    this.height,
    this.alignment = Alignment.center,
    this.color,
    this.opacity,
    this.colorBlendMode,
    this.fit,
    this.repeat = ImageRepeat.noRepeat,
    this.centerSlice,
    this.filterQuality = FilterQuality.low,
	}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		if (image.contains('.svg')) {
			return SvgPicture.asset(
				image,
				package: package,
				semanticsLabel: semanticLabel,
				width: width,
				height: height,
				alignment: alignment,
			);
		} else {
			return Image.asset(
				image,
				package: package,
				semanticLabel: semanticLabel,
				width: width,
				height: height,
				alignment: alignment,
				color: color,
				opacity: opacity,
				fit: fit,
				repeat: repeat,
				centerSlice: centerSlice,
				filterQuality: filterQuality,
			);
		}
	}
}