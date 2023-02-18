import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:services/endpoints/authentications/data/models/authentication_model.dart';

part 'authentication_entity.freezed.dart';
part 'authentication_entity.g.dart';

@freezed
abstract class AuthenticationEntity with _$AuthenticationEntity {
	const factory AuthenticationEntity({
		required int id,
		required String username,
		required String email,
		required String firstName,
		required String lastName,
		required String gender,
		required String image,
		required String token,
	}) = _AuthenticationEntity;

	factory AuthenticationEntity.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationEntityFromJson(json);


	factory AuthenticationEntity.fromModel(AuthenticationModel model) {
		return AuthenticationEntity(
			id: model.id,
			username: model.username,
			email: model.email,
			firstName: model.firstName,
			lastName: model.lastName,
			gender: model.gender,
			image: model.image,
			token: model.token
		);
	}
}