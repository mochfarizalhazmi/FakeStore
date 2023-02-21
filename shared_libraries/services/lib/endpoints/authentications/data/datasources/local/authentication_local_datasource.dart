import 'package:dependencies/shared_preferences/shared_preferences.dart';

import '../../../../../utils/endpoint_constants.dart';

abstract class AuthenticationLocalDataSource {
  // const AuthenticationRemoteDataSource();
  Future<bool> saveToken(String token);
}

class AuthenticationLocalDataSourceImpl implements AuthenticationLocalDataSource {
	
  final SharedPreferences sharedPreferences;

  const AuthenticationLocalDataSourceImpl({
		required this.sharedPreferences,
	});

  @override
  Future<bool> saveToken(String token) async {
		return await sharedPreferences.setString(
			EndpointConstants.tokenKey.authentication,
			token
		);
  }
  
}