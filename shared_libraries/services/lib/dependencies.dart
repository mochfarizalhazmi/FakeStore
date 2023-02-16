class RegisterServiceModule {
  RegisterServiceModule() {
    _registerService();
  }

  void _registerService() {
    // sl.registerLazySingleton<Dio>(() => sl<DioHandler>().dio);
    // sl.registerLazySingleton<DioHandler>(() => DioHandler(
    //       sharedPreferences: sl(),
    //       apiBaseUrl: '',
    //     ));

    // sl.registerLazySingleton<AppDatabase>(() => AppDatabase());
  }
}
