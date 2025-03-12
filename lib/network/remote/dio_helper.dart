import 'package:dio/dio.dart';

class DioHelper {
   static late Dio dio;

  static  init() {
    dio = Dio(BaseOptions(baseUrl: 'https://newsapi.org/', receiveDataWhenStatusError: true));
  }

  static Future<Response> getData({
     required String url,
    required Map<String,dynamic> query
})async
  {
    return await dio.get(url,queryParameters: query);
  }
}

//https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=2e16eee24e88404184af8a9e74c073a6