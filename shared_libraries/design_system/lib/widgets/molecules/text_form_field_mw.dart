
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldMW extends StatelessWidget {

	final TextEditingController controller;
	final String? Function(String?)? validator;
	final List<TextInputFormatter>? inputFormatters;
	final bool enabled;
	final int maxLength;
	final bool isHasLabel;
	final String labelText;
	final String? initialValue;
	final TextInputType keyboardType;
	final TextCapitalization textCapitalization;
	final bool obscureText;
  final String obscuringCharacter;
	final bool enableSuggestions;
	final bool autocorrect;
	final TextDirection textDirection;
  final TextAlign textAlign;
  final bool autofocus;
  final bool readOnly;
	final bool showCursor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final BoxConstraints? prefixIconConstraints;
  final String? helperText;
  final String? errorText;
  final TextStyle? helperStyle;
	final TextInputAction? textInputAction;
	final ValueChanged<String>? onChanged;
  final TapRegionCallback? onTapOutside;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;

  const TextFormFieldMW({
		super.key,
		required this.controller,
		this.validator,
		this.inputFormatters,
		this.enabled = true,
		this.maxLength = 50,
		this.isHasLabel = true,
		this.labelText = '',
		this.initialValue,
		required this.keyboardType,
		this.textCapitalization = TextCapitalization.none,
		this.obscureText = false,
		this.obscuringCharacter = '*',
		this.enableSuggestions = false,
		this.autocorrect = false,
		this.textDirection = TextDirection.ltr,
		this.textAlign = TextAlign.start,
		this.autofocus = false,
		this.readOnly = false,
		this.showCursor = true,
		this.prefixIcon,
		this.suffixIcon,
		this.hintText,
		this.prefixIconConstraints,
		this.helperText,
		this.errorText,
		this.helperStyle,
		this.textInputAction,
		this.onChanged,
		this.onTapOutside,
		this.onEditingComplete,
		this.onFieldSubmitted,
	});

  @override
  Widget build(BuildContext context) {
    return Column(
			mainAxisAlignment: MainAxisAlignment.start,
			crossAxisAlignment: CrossAxisAlignment.start,
      children: [
				Visibility(
					visible: isHasLabel,
					child: TextAW.caption2(
						text: labelText,
						textAlign: TextAlign.start,
					),
				),
				Visibility(
					visible: isHasLabel,
					child: const SizedBox(height: 9,),
				),
        TextFormField(
					controller: controller,
					validator: validator,
					inputFormatters: inputFormatters,
					enabled: enabled,
					maxLength: maxLength,
					initialValue: initialValue,
					keyboardType: keyboardType,
					textCapitalization: textCapitalization,
					decoration: InputDecoration(
						prefixIcon: prefixIcon,
						suffixIcon: suffixIcon,
						hintText: hintText,
						prefixIconConstraints: prefixIconConstraints,
						helperText: helperText,
						errorText: errorText,
						helperStyle: helperStyle,
						border: const UnderlineInputBorder(
							borderSide: BorderSide(
								color: ColorName.dividerActiveColor
							),
						),
						enabledBorder: const UnderlineInputBorder(
							borderSide: BorderSide(
								color: ColorName.dividerActiveColor
							),
						),
						disabledBorder: const UnderlineInputBorder(
							borderSide: BorderSide(
								color: ColorName.dividerInactiveColor
							),
						),
						focusedBorder: const UnderlineInputBorder(
							borderSide: BorderSide(
								color: ColorName.primaryColor
							),
						),
						errorBorder: const UnderlineInputBorder(
							borderSide: BorderSide(
								color: ColorName.errorColor
							),
						),
					),
					obscureText: obscureText,
					obscuringCharacter: obscuringCharacter,
					enableSuggestions: enableSuggestions,
					textDirection: textDirection,
					textAlign: textAlign,
					autocorrect: autocorrect,
					showCursor: showCursor,
					cursorWidth: 1.0,
					cursorHeight: 24,
					cursorColor: ColorName.primaryColor,
					textInputAction: textInputAction,
					onChanged: onChanged,
					onTapOutside: onTapOutside,
					onEditingComplete: onEditingComplete,
					onFieldSubmitted: onFieldSubmitted,
				),
      ],
    );
  }
}