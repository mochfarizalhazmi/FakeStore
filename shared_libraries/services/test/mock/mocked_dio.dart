import 'package:dependencies/dio/dio.dart';
import 'package:dependencies/mocktail/mocktail.dart';
import 'package:services/base/dio_handler.dart';

class MockedDioHandler extends Mock implements DioHandler {}
class MockedDio extends Mock implements Dio {}