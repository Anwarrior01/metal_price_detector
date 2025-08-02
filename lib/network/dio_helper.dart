import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://www.goldapi.io/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData(String url) {
    dio!.options.headers = {'x-access-token':'goldapi-vmfjusmdu8e8pf-io'};

    return dio!.get(url);
  }
}
