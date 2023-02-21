import 'package:dependencies/mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:services/endpoints/authentications/data/datasources/local/authentication_local_datasource.dart';
import 'package:dependencies/shared_preferences/shared_preferences.dart';
import 'package:services/utils/endpoint_constants.dart';

import '../../../../../mock/mocked_shared_preferences.dart';

void main() => authenticationLocalDataSourceTest();

void authenticationLocalDataSourceTest() {

	late SharedPreferences mockedSharedPreferences;
	late AuthenticationLocalDataSource authenticationLocalDataSource;
	const mockedToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTUsInVzZXJuYW1lIjoia21pbmNoZWxsZSIsImVtYWlsIjoia21pbmNoZWxsZUBxcS5jb20iLCJmaXJzdE5hbWUiOiJKZWFubmUiLCJsYXN0TmFtZSI6IkhhbHZvcnNvbiIsImdlbmRlciI6ImZlbWFsZSIsImltYWdlIjoiaHR0cHM6Ly9yb2JvaGFzaC5vcmcvYXV0cXVpYXV0LnBuZz9zaXplPTUweDUwJnNldD1zZXQxIiwiaWF0IjoxNjM1NzczOTYyLCJleHAiOjE2MzU3Nzc1NjJ9.n9PQX8w8ocKo0dMCw3g8bKhjB8Wo7f7IONFBDqfxKhs";

	setUpAll(() {
		mockedSharedPreferences = MockedSharedPreferences();
		authenticationLocalDataSource = AuthenticationLocalDataSourceImpl(
			sharedPreferences: mockedSharedPreferences
		);
	});

	group('saveToken', () { 

		test('''
			GIVEN token to save
			WHEN saveToken is called
			THEN isTokenSaved should be to be true
		''', () async {
			// Arrange
			when(() => mockedSharedPreferences.setString(
				EndpointConstants.tokenKey.authentication, 
				mockedToken
			)).thenAnswer((_) async => true);

			// Act
			final isTokenSaved = await authenticationLocalDataSource.saveToken(mockedToken);

			// Assert
			expect(isTokenSaved, true);
		});

		test('''
			GIVEN token to save
			WHEN saveToken is called
			THEN isTokenSaved should be to be false
		''', () async {
			// Arrange
			when(() => mockedSharedPreferences.setString(
				EndpointConstants.tokenKey.authentication, 
				mockedToken
			)).thenAnswer((_) async => false);

			// Act
			final isTokenSaved = await authenticationLocalDataSource.saveToken(mockedToken);

			// Assert
			expect(isTokenSaved, false);
		});

	});

}