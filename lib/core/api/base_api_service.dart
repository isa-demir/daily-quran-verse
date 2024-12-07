import 'package:dio/dio.dart';

class ApiService {
  ApiService._();

  static final ApiService _instance = ApiService._();

  factory ApiService() {
    return _instance;
  }

  final _dio = Dio();

  final String _baseUrl = 'https://api.acikkuran.com';

  Future<Response> getRequest(
      String endPoint,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers) async {
    final response = await _dio.get(
      '$_baseUrl$endPoint',
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
      ),
    );

    return response;
  }

  Future<Response> postRequest(
      String endPoint,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? body) async {
    final response = await _dio.post(
      '$_baseUrl$endPoint',
      queryParameters: queryParameters,
      data: body,
      options: Options(
        headers: headers,
      ),
    );

    return response;
  }
}
