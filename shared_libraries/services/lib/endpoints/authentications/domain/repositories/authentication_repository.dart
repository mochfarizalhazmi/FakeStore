import 'package:common/utils/result.dart';
import '../entities/authentication_entity.dart';
import '../entities/authentication_parameter_entity.dart';

abstract class AuthenticationRepository {
  	Future<Result<AuthenticationEntity>> login({
		required AuthenticationParameterEntity params
	});
}
