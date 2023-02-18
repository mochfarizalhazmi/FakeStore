import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_parameter_entity.freezed.dart';
part 'authentication_parameter_entity.g.dart';

@freezed
abstract class AuthenticationParameterEntity with _$AuthenticationParameterEntity {
	const factory AuthenticationParameterEntity({
		required String username,
		required String password,
	}) = _AuthenticationParameterEntity;

	factory AuthenticationParameterEntity.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationParameterEntityFromJson(json);
}
