
import 'package:common/utils/result.dart';
import 'package:dependencies/mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:services/endpoints/authentications/data/datasources/local/authentication_local_datasource.dart';
import 'package:services/endpoints/authentications/data/datasources/remote/authentication_remote_datasource.dart';
import 'package:services/endpoints/authentications/data/models/authentication_model.dart';
import 'package:services/endpoints/authentications/data/repositories/authentication_repository_impl.dart';
import 'package:services/endpoints/authentications/domain/entities/authentication_entity.dart';
import 'package:services/endpoints/authentications/domain/entities/authentication_parameter_entity.dart';
import 'package:services/endpoints/authentications/domain/repositories/authentication_repository.dart';

import '../../../../mock/mocked_authentication_local_data_source.dart';
import '../../../../mock/mocked_authentication_remote_data_source.dart';

void main() => authenticationRepositoryTest();

void authenticationRepositoryTest() {

	late AuthenticationRemoteDataSource mockedAuthenticationRemoteDataSource;
	late AuthenticationLocalDataSource mockedAuthenticationLocalDataSource;
	late AuthenticationRepository authenticationRepository;

	const params = AuthenticationParameterEntity(
		username: 'kminchelle', 
		password: 'password'
	);
	const token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTUsInVzZXJuYW1lIjoia21pbmNoZWxsZSIsImVtYWlsIjoia21pbmNoZWxsZUBxcS5jb20iLCJmaXJzdE5hbWUiOiJKZWFubmUiLCJsYXN0TmFtZSI6IkhhbHZvcnNvbiIsImdlbmRlciI6ImZlbWFsZSIsImltYWdlIjoiaHR0cHM6Ly9yb2JvaGFzaC5vcmcvYXV0cXVpYXV0LnBuZz9zaXplPTUweDUwJnNldD1zZXQxIiwiaWF0IjoxNjM1NzczOTYyLCJleHAiOjE2MzU3Nzc1NjJ9.n9PQX8w8ocKo0dMCw3g8bKhjB8Wo7f7IONFBDqfxKhs";
	Map<String, dynamic> mockedResponseSuccessLogin = {
		"id": 15,
		"username": "kminchelle",
		"email": "kminchelle@qq.com",
		"firstName": "Jeanne",
		"lastName": "Halvorson",
		"gender": "female",
		"image": "https://robohash.org/autquiaut.png?size=50x50&set=set1",
		"token": token
	};
	final mockedAuthenticationModel = AuthenticationModel.fromJson(mockedResponseSuccessLogin);
	final mockedAuthenticationEntity = AuthenticationEntity.fromModel(mockedAuthenticationModel);

	setUpAll(() {
		mockedAuthenticationRemoteDataSource = MockedAuthenticationRemoteDataSource();
		mockedAuthenticationLocalDataSource = MockedAuthenticationLocalDataSource();
		authenticationRepository = AuthenticationRepositoryImpl(
			authenticationRemoteDataSource: mockedAuthenticationRemoteDataSource, 
			authenticationLocalDataSource: mockedAuthenticationLocalDataSource
		);
	});

	group('login', () {
		
		test('''
			GIVEN username and password
			AND remoteDataSource login is success
			AND localDataSource saveToken is saved
			WHEN login is called
			THEN return result success
			AND AuthenticationEntity data
		''', () async {
			// Arrange
			when(
				() => mockedAuthenticationRemoteDataSource.login(params)
			).thenAnswer(
				(_) async => Result.success(mockedAuthenticationModel)
			);
			when(
				() => mockedAuthenticationLocalDataSource.saveToken(token)
			).thenAnswer(
				(_) async => true
			);

			// Act
			Result<AuthenticationEntity> result = await authenticationRepository.login(params: params);

			// Expect
			expect(result.status, Status.success);
			expect(result.data.id, mockedAuthenticationEntity.id);
			expect(result.data.username, mockedAuthenticationEntity.username);
			expect(result.data.email, mockedAuthenticationEntity.email);
			expect(result.data.firstName, mockedAuthenticationEntity.firstName);
			expect(result.data.lastName, mockedAuthenticationEntity.lastName);
			expect(result.data.gender, mockedAuthenticationEntity.gender);
			expect(result.data.image, mockedAuthenticationEntity.image);
			expect(result.data.token, mockedAuthenticationEntity.token);

		});
		
		test('''
			GIVEN username and password
			AND remoteDataSource login is success
			AND localDataSource saveToken is false
			WHEN login is called
			THEN return result error
			AND message 'Failed to save authentication token'
		''', () async {
			// Arrange
			when(
				() => mockedAuthenticationRemoteDataSource.login(params)
			).thenAnswer(
				(_) async => Result.success(mockedAuthenticationModel)
			);
			when(
				() => mockedAuthenticationLocalDataSource.saveToken(token)
			).thenAnswer(
				(_) async => false
			);

			// Act
			Result<AuthenticationEntity> result = await authenticationRepository.login(params: params);

			// Expect
			expect(result.status, Status.error);
			expect(result.message, 'Failed to save authentication token');

		});
		
		test('''
			GIVEN username and password
			AND remoteDataSource login is error
			WHEN login is called
			THEN return result error
			AND message 'Failed to save authentication token'
		''', () async {
			// Arrange
			when(
				() => mockedAuthenticationRemoteDataSource.login(params)
			).thenAnswer(
				(_) async => Result.error(message: 'Failed to save authentication token')
			);

			// Act
			Result<AuthenticationEntity> result = await authenticationRepository.login(params: params);

			// Expect
			expect(result.status, Status.error);
			expect(result.message, 'Failed to save authentication token');

		});

	});

}