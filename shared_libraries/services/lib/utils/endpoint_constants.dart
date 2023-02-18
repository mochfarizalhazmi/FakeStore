class EndpointConstants {
  	const EndpointConstants();
	static TokenKey tokenKey = const TokenKey();
  	static EndpointKey endpointKey = const EndpointKey();
}

class TokenKey {
	const TokenKey();
	String get authentication => "authentication";
}

class EndpointKey {
  const EndpointKey();
  String get authLogin => '/auth/login';
}