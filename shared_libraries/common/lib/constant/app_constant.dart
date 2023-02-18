class AppConstants {
  const AppConstants();

  static CachedKey cachedKey = const CachedKey();
}

class CachedKey {
  const CachedKey();
  String get tokenKey => 'tokenKey';
}
