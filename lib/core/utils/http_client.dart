import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Http {
  static Dio? _dio;

  static Dio? getDio() {
    if (_dio == null) {
      _dio = new Dio();
      _dio?.options.baseUrl = "https://api.todoist.com/";
      _dio?.options.headers['Authorization'] =
          'Bearer ${dotenv.env['TODOIST_API_TOKEN']}';
      // _dio?.options.connectTimeout = Duration(seconds: 15);
      // _dio?.options.receiveTimeout = Duration(seconds: 15);
      //_dio?.options.headers["Api-Key"] = dotenv.env['TODOIST_API_TOKEN'];
      //_dio?.options.headers["Accept-Language"] = 'en';
    }

    return _dio;
  }
}
