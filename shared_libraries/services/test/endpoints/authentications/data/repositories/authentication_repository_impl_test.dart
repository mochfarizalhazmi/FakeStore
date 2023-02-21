import 'package:common/utils/result.dart';
import 'package:dependencies/mocktail/mocktail.dart';
import 'package:dependencies/shared_preferences/shared_preferences.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dependencies/dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:services/endpoints/authentications/data/models/authentication_model.dart';
import 'package:services/endpoints/authentications/data/repositories/authentication_repository_impl.dart';
import 'package:services/endpoints/authentications/domain/entities/authentication_entity.dart';
import 'package:services/endpoints/authentications/domain/entities/authentication_parameter_entity.dart';
import 'package:services/endpoints/authentications/domain/repositories/authentication_repository.dart';
import 'package:services/utils/endpoint_constants.dart';

import '../../../../mock/mocked_shared_preferences.dart';


void main() {
	late Dio dio;
	late DioAdapter dioAdapter;
	late SharedPreferences mockedSharedPreferences;
	late AuthenticationRepository authenticationRepository;

	group('Authentications', () {
		const baseUrl = "https://dummyjson.com";
		const params = AuthenticationParameterEntity(
			username: 'kminchelle',
			password: 'password'
		);
		const mockedToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTUsInVzZXJuYW1lIjoia21pbmNoZWxsZSIsImVtYWlsIjoia21pbmNoZWxsZUBxcS5jb20iLCJmaXJzdE5hbWUiOiJKZWFubmUiLCJsYXN0TmFtZSI6IkhhbHZvcnNvbiIsImdlbmRlciI6ImZlbWFsZSIsImltYWdlIjoiaHR0cHM6Ly9yb2JvaGFzaC5vcmcvYXV0cXVpYXV0LnBuZz9zaXplPTUweDUwJnNldD1zZXQxIiwiaWF0IjoxNjM1NzczOTYyLCJleHAiOjE2MzU3Nzc1NjJ9.n9PQX8w8ocKo0dMCw3g8bKhjB8Wo7f7IONFBDqfxKhs";
		Map<String, dynamic> mockedResponseSuccessLogin = {
			"id": 15,
			"username": "kminchelle",
			"email": "kminchelle@qq.com",
			"firstName": "Jeanne",
			"lastName": "Halvorson",
			"gender": "female",
			"image": "https://robohash.org/autquiaut.png?size=50x50&set=set1",
			"token": mockedToken
		};
		Map<String, dynamic> mockedResponseErrorLogin = {
			"message": "Invalid credentials"
		};
		final mockedAuthenticationModel = AuthenticationModel.fromJson(mockedResponseSuccessLogin);
		final mockedAuthenticationEntity = AuthenticationEntity.fromModel(mockedAuthenticationModel);

		setUp(() {
			dio = Dio(BaseOptions(baseUrl: baseUrl));
			dioAdapter = DioAdapter(
				dio: dio,
				matcher: const FullHttpRequestMatcher(),
			);
			mockedSharedPreferences = MockedSharedPreferences();
			authenticationRepository = AuthenticationRepositoryImpl(
				dio: dio,
				sharedPreferences: mockedSharedPreferences,
			);
		});

		test('Login success and return AuthenticationEntity', () async {
			// Arrange
			when(() => mockedSharedPreferences.setString(
					EndpointConstants.tokenKey.authentication,
					mockedToken
			)).thenAnswer((_) async => true);
			when(() => mockedSharedPreferences.getString(
				EndpointConstants.tokenKey.authentication)
			).thenReturn(mockedToken);
			dioAdapter.onPost(
				EndpointConstants.endpointKey.authLogin,
				(server) => server.reply(
					201,
					mockedResponseSuccessLogin,
					delay: const Duration(seconds: 1),
				),
				data: params.toJson(),
			);

			// Act
			final result = await authenticationRepository.login(params: params);

			// Assert
			verify(() => mockedSharedPreferences.setString(
					EndpointConstants.tokenKey.authentication,
					mockedToken
			)).called(1);
			expect(
				mockedSharedPreferences.getString(EndpointConstants.tokenKey.authentication),
				mockedAuthenticationModel.token
			);
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

		test('Login failed because data not found', () async {
			// Arrange
			dioAdapter.onPost(
				EndpointConstants.endpointKey.authLogin,
				(server) => server.reply(
					201,
					null,
					delay: const Duration(seconds: 1),
				),
				data: params.toJson(),
			);

			// Act
			final result = await authenticationRepository.login(params: params);

			// Assert
			expect(result.status, Status.error);
			expect(result.message, "Data not found");
		});

		test('Login failed and return "Failed to login"', () async {
			// Arrange
			DioError dioError = DioError(
					response: Response<Map<String, dynamic>>(
						requestOptions: RequestOptions(
							path: EndpointConstants.endpointKey.authLogin,
						),
						data: mockedResponseErrorLogin,
					),
					requestOptions: RequestOptions(
						path: EndpointConstants.endpointKey.authLogin,
					),
					message: null
			);
			dioAdapter.onPost(
				EndpointConstants.endpointKey.authLogin,
				(server) => server.throws(
					400,
					dioError,
				),
				data: params.toJson(),
			);

			// Act
			final result = await authenticationRepository.login(params: params);

			// Assert
			expect(result.status, Status.error);
			expect(result.message, "Failed to login");
		});

		test('Login failed and return a message', () async {
			// Arrange
			DioError dioError = DioError(
					response: null,
					requestOptions: RequestOptions(
						path: EndpointConstants.endpointKey.authLogin,
					),
					message: "Invalid credentials"
			);
			dioAdapter.onPost(
				EndpointConstants.endpointKey.authLogin,
				(server) => server.throws(
					400,
					dioError,
				),
				data: params.toJson(),
			);

			// Act
			final result = await authenticationRepository.login(params: params);

			// Assert
			expect(result.status, Status.error);
			expect(result.message, "Failed to login");
		});

	});
}