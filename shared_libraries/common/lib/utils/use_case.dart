import 'result.dart';

/// Abstract class of use case, that implements callable class in dart
/// See [https://dart.dev/guides/language/language-tour#callable-classes]
abstract class UseCase<Type, Params> {
  Future<Result<Type>> call(Params params);
}
