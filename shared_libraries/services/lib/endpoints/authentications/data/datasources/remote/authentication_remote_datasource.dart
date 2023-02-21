import 'package:common/utils/result.dart';
import 'package:dependencies/dio/dio.dart';
import 'package:services/endpoints/authentications/authentications.dart';

import '../../../../../utils/endpoint_constants.dart';

abstract class AuthenticationRemoteDataSource {
  // const AuthenticationRemoteDataSource();
  Future<Result<AuthenticationModel>> login(AuthenticationParameterEntity params);
}

class AuthenticationRemoteDataSourceImpl implements AuthenticationRemoteDataSource {
	
  final Dio dio;

  const AuthenticationRemoteDataSourceImpl({
		required this.dio,
	});

  @override
  Future<Result<AuthenticationModel>> login(AuthenticationParameterEntity params) async {
		try {
			final response = await dio.post(
				EndpointConstants.endpointKey.authLogin,
				data: params.toJson()
			);
			AuthenticationModel authenticationModel = AuthenticationModel.fromJson(response.data);
			return Result.success(authenticationModel);
		} on DioError catch (e) {
			if (e.response != null) {
				print(e.response?.data);
				print(e.response?.headers);
				print(e.response?.requestOptions);
				return Result.error(message: "Failed login to server");
			} else {
				// Something happened in setting up or sending the request that triggered an Error
				print(e.requestOptions);
				print(e.message);
				return Result.error(message: "Failed login to server");
			}
		}
  }
  
}