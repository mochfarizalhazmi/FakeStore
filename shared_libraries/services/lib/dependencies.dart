import 'package:dependencies/get_it/get_it.dart';
import 'package:dependencies/dio/dio.dart';
import 'base/dio_handler.dart';
import 'endpoints/authentications/data/repositories/authentication_repository_impl.dart';
import 'endpoints/authentications/domain/repositories/authentication_repository.dart';
import 'endpoints/authentications/domain/usecases/login_use_case.dart';

class RegisterServiceModule {
	final String apiBaseUrl;

  	RegisterServiceModule({
    	required this.apiBaseUrl,
  	}) {
    	_registerBaseService();
		_registerRepository();
		_registerUseCase();
  	}

  	void _registerBaseService() {
    	di.registerLazySingleton<DioHandler>(() => DioHandler(
			apiBaseUrl: apiBaseUrl, 
			sharedPreferences: di()
		));
    	di.registerLazySingleton<Dio>(() => di<DioHandler>().dio);
    	// sl.registerLazySingleton<AppDatabase>(() => AppDatabase());
  	}

  	void _registerRepository() {
		di.registerLazySingleton<AuthenticationRepository>(
			() => AuthenticationRepositoryImpl(
				dio: di(), 
				sharedPreferences: di()
			)
		);
  	}

  	void _registerUseCase() {
		di.registerLazySingleton<LoginUseCase>(
			() => LoginUseCase(
				repository: di(),
				connectivity: di()
			)
		);
  	}
}
