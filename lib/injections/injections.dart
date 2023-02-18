import 'package:dependencies/di/dependency.dart';
import 'package:services/dependencies.dart';

class Injections {
  final String apiBaseUrl;

  Injections({
    required this.apiBaseUrl,
  });

  Future<void> initialize() async {
    await _registerSharedDependencies();
  }

  Future<void> _registerSharedDependencies() async {
    // await const SharedLibDependencies().registerCore();
    // RegisterCoreModule();
    // CommonDependencies();
    await const SharedLibDependencies().registerDepedencies();
    RegisterServiceModule(apiBaseUrl: apiBaseUrl);
  }
}
