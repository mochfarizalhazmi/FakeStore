import 'package:dependencies/get_it/get_it.dart';
import 'package:dependencies/dio/dio.dart';
import 'package:services/endpoints/authentications/data/datasources/remote/authentication_remote_datasource.dart';
import 'base/dio_handler.dart';
import 'endpoints/authentications/data/datasources/local/authentication_local_datasource.dart';
import 'endpoints/authentications/data/repositories/authentication_repository_impl.dart';
import 'endpoints/authentications/domain/repositories/authentication_repository.dart';
import 'endpoints/authentications/domain/usecases/login_use_case.dart';

class RegisterServiceModule {
	final String apiBaseUrl;

  	RegisterServiceModule({
    	required this.apiBaseUrl,
  	}) {
    	_registerBaseService();
			_registerDataSources();
			_registerRepositories();
			_registerUseCases();
  	}

  	void _registerBaseService() {
    	di.registerLazySingleton<DioHandler>(() => DioHandler(
				apiBaseUrl: apiBaseUrl, 
				sharedPreferences: di()
			));
    	di.registerLazySingleton<Dio>(() => di<DioHandler>().dio);
    	// sl.registerLazySingleton<AppDatabase>(() => AppDatabase());
  	}

		void _registerDataSources() {
			di.registerLazySingleton<AuthenticationRemoteDataSource>(
				() => AuthenticationRemoteDataSourceImpl(dio: di())
			);
			di.registerLazySingleton<AuthenticationLocalDataSource>(
				() => AuthenticationLocalDataSourceImpl(sharedPreferences: di())
			);
		}

  	void _registerRepositories() {
			di.registerLazySingleton<AuthenticationRepository>(
				() => AuthenticationRepositoryImpl(
					authenticationRemoteDataSource: di(),
					authenticationLocalDataSource: di(),
				)
			);
  	}

  	void _registerUseCases() {
			di.registerLazySingleton<LoginUseCase>(
				() => LoginUseCase(
					repository: di(),
					connectivity: di()
				)
			);
  	}
}
