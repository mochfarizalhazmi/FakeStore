
import 'package:common/utils/result.dart';
import 'package:dependencies/dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:services/endpoints/authentications/data/datasources/remote/authentication_remote_datasource.dart';
import 'package:services/endpoints/authentications/data/models/authentication_model.dart';
import 'package:services/endpoints/authentications/domain/entities/authentication_parameter_entity.dart';
import 'package:services/utils/endpoint_constants.dart';

void main() => authenticationRemoteDataSourceTest();

void authenticationRemoteDataSourceTest() {

	late Dio dio;
	late DioAdapter dioAdapter;
	late AuthenticationRemoteDataSource authenticationLocalDataSource;

	const baseUrl = "https://dummyjson.com";
	const params = AuthenticationParameterEntity(
		username: 'kminchelle', 
		password: 'password'
	);
	Map<String, dynamic> mockedResponseSuccessLogin = {
		"id": 15,
		"username": "kminchelle",
		"email": "kminchelle@qq.com",
		"firstName": "Jeanne",
		"lastName": "Halvorson",
		"gender": "female",
		"image": "https://robohash.org/autquiaut.png?size=50x50&set=set1",
		"token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTUsInVzZXJuYW1lIjoia21pbmNoZWxsZSIsImVtYWlsIjoia21pbmNoZWxsZUBxcS5jb20iLCJmaXJzdE5hbWUiOiJKZWFubmUiLCJsYXN0TmFtZSI6IkhhbHZvcnNvbiIsImdlbmRlciI6ImZlbWFsZSIsImltYWdlIjoiaHR0cHM6Ly9yb2JvaGFzaC5vcmcvYXV0cXVpYXV0LnBuZz9zaXplPTUweDUwJnNldD1zZXQxIiwiaWF0IjoxNjM1NzczOTYyLCJleHAiOjE2MzU3Nzc1NjJ9.n9PQX8w8ocKo0dMCw3g8bKhjB8Wo7f7IONFBDqfxKhs"
	};
	Map<String, dynamic> mockedResponseErrorLogin = {
		"message": "Invalid credentials"
	};
	AuthenticationModel mockedAuthenticationModel = AuthenticationModel.fromJson(mockedResponseSuccessLogin);

	setUpAll(() {
		dio = Dio();
		dio = Dio(BaseOptions(baseUrl: baseUrl));
		dioAdapter = DioAdapter(
			dio: dio,
			matcher: const FullHttpRequestMatcher(),
		);
		authenticationLocalDataSource = AuthenticationRemoteDataSourceImpl(
			dio: dio
		);
	});

	group('login', () { 

		test('''
			GIVEN username and password
			WHEN login is called
			THEN return result success
			AND AuthenticationModel data
		''', () async {
			// Arrange
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
			final result = await authenticationLocalDataSource.login(params);

			// Expect
			expect(result.status, Status.success);
			expect(result.data.id, mockedAuthenticationModel.id);
			expect(result.data.username, mockedAuthenticationModel.username);
			expect(result.data.email, mockedAuthenticationModel.email);
			expect(result.data.firstName, mockedAuthenticationModel.firstName);
			expect(result.data.lastName, mockedAuthenticationModel.lastName);
			expect(result.data.gender, mockedAuthenticationModel.gender);
			expect(result.data.image, mockedAuthenticationModel.image);
			expect(result.data.token, mockedAuthenticationModel.token);
		});

		test('''
			GIVEN username and password
			WHEN login is called
			AND have a response from server 
			THEN return result error
			AND message 'Failed login to server'
		''', () async {
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
			final result = await authenticationLocalDataSource.login(params);

			// Expect
			expect(result.status, Status.error);
			expect(result.message, "Failed login to server");
		});

		test('''
			GIVEN username and password
			WHEN login is called
			AND server not return a response
			THEN return result error
			AND message 'Failed login to server'
		''', () async {
			// Arrange
			DioError dioError = DioError(
					response: null,
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
			final result = await authenticationLocalDataSource.login(params);

			// Expect
			expect(result.status, Status.error);
			expect(result.message, "Failed login to server");
		});

	});
	
}