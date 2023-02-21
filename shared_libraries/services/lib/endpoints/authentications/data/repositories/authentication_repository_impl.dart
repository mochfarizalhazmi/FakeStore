import 'package:common/utils/result.dart';
import 'package:dependencies/dio/dio.dart';
import 'package:dependencies/shared_preferences/shared_preferences.dart';

import '../../../../utils/endpoint_constants.dart';
import '../../domain/entities/authentication_entity.dart';
import '../../domain/entities/authentication_parameter_entity.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../models/authentication_model.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {

	final Dio dio;
	final SharedPreferences sharedPreferences;

	AuthenticationRepositoryImpl({
		required this.dio,
		required this.sharedPreferences
	});

	@override
	Future<Result<AuthenticationEntity>> login({
		required AuthenticationParameterEntity params
	}) async {
		try {
			Response<Map<String, dynamic>> response = await dio.post(
				EndpointConstants.endpointKey.authLogin,
				data: params.toJson()
			);
			if (response.data != null) {
				final model = AuthenticationModel.fromJson(response.data!);
				await sharedPreferences.setString(
					EndpointConstants.tokenKey.authentication,
					model.token
				);
				return Result.success(AuthenticationEntity.fromModel(model));
			} else {
				return Result.error(message: "Data not found");
			}
		} on DioError catch (e) {
			if (e.response != null) {
				// print(e.response?.data);
				// print(e.response?.headers);
				// print(e.response?.requestOptions);
				return Result.error(message: "Failed to login");
			} else {
				// Something happened in setting up or sending the request that triggered an Error
				// print(e.requestOptions);
				// print(e.message);
				return Result.error(message: "Failed to login");
			}
		}
	}
	
}