import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/constans/const_app_model.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    print("dio Init");
    dio = Dio(BaseOptions(
      baseUrl: 'https://flutter.prominaagency.com/api/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> postData({
    required String url,
    required data,
  }) async {
    dio!.options.headers = {
      'Authorization': 'Bearer $TOKEN',
    };
    return await dio!.post(url, data: data);
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    dio!.options.headers = {
      'Authorization': 'Bearer $TOKEN',
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    };
    print('https://flutter.prominaagency.com/api/$url');
    return await dio!.get(url, data: data, queryParameters: query);
  }
}
