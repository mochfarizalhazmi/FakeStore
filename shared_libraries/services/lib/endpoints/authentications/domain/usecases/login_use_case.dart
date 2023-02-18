import 'package:common/utils/use_case.dart';
import 'package:common/utils/result.dart';
import 'package:dependencies/connectivity_plus/connectivity_plus.dart';

import '../entities/authentication_entity.dart';
import '../entities/authentication_parameter_entity.dart';
import '../repositories/authentication_repository.dart';

class LoginUseCase extends UseCase<AuthenticationEntity, AuthenticationParameterEntity> {

	final AuthenticationRepository repository;
	final Connectivity connectivity;

  	LoginUseCase({
		required this.repository, 
		required this.connectivity,
	});

  	@override
  	Future<Result<AuthenticationEntity>> call(AuthenticationParameterEntity params) async {
		final connectivityResult = await (connectivity.checkConnectivity());
		if (connectivityResult == ConnectivityResult.none) {
			return Result.noInternet();
		}

    	Result<AuthenticationEntity> result = await repository.login(params: params);
		return result;
	}
}