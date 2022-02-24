import 'package:dio/dio.dart';

class TodoListApi  {

  static Dio getApiDio() {
    BaseOptions options = BaseOptions(
      baseUrl: 'http://192.168.110.178:8080',
      connectTimeout: 90000,
      receiveTimeout: 90000,
    );
    Dio dio = Dio(options);

    return dio;
  }

}