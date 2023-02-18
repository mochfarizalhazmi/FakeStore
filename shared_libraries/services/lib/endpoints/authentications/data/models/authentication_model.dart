import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'authentication_model.freezed.dart';
part 'authentication_model.g.dart';

@freezed
abstract class AuthenticationModel with _$AuthenticationModel {
	const factory AuthenticationModel({
		required int id,
		required String username,
		required String email,
		required String firstName,
		required String lastName,
		required String gender,
		required String image,
		required String token,
	}) = _AuthenticationModel;

	factory AuthenticationModel.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationModelFromJson(json);
}