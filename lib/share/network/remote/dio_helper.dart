
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
        BaseOptions(
          baseUrl: 'https://student.valuxapps.com/api/',
          receiveDataWhenStatusError: true,

        )
    );
    (dio?.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? lang,
    String? token
  }) async
  {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': 'en',
      'Authorization': token
    };
    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? lang,
    String? token
  }) async

  {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token
    };
    return dio!.post(
        url,
        queryParameters: query,
        data: data
    );
  }
}