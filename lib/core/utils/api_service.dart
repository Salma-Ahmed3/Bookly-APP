import 'package:dio/dio.dart';

// 1 ) This Class Name Is Rapper My Project
class ApiService {
  final _baseUrl = 'https://www.googleapis.com/books/v1/';

// 2 ) Copy About DIO
  final Dio _dio;
  ApiService(this._dio);

// 3 ) First Methode Get Methode
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint');
    return response.data;
  }
}
