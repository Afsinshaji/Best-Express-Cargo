

import 'package:dio/dio.dart';

Dio dio(){

  Dio dio =  Dio();

  dio.options.baseUrl = "https://bestexpress.vahid.tech/api";

  dio.options.headers['accept'] = '*/*';

  // dio.options.headers['Authorization'] = 'Bearer';

  return dio;

}