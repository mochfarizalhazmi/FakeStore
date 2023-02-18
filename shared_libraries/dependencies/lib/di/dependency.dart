import 'package:flutter/foundation.dart';

import '../connectivity_plus/connectivity_plus.dart';
import '../shared_preferences/shared_preferences.dart';
import '../get_it/get_it.dart';

class SharedLibDependencies {
  const SharedLibDependencies();

  Future<void> registerDepedencies() async {
    final sharedPreferences = await SharedPreferences.getInstance();
	debugPrint(sharedPreferences.toString());
    di.registerLazySingleton(() => sharedPreferences);

    final connectivity = Connectivity();
    di.registerLazySingleton(() => connectivity);
  }
}
