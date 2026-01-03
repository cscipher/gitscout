import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
abstract class IApiClientContract {
  Future<Response<dynamic>> get(
    String path, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  });

  Future<Response<dynamic>> post(
    String path, {
    Map<String, dynamic>? headers,
    dynamic body,
  });

  Future<Response<dynamic>> put(
    String path, {
    Map<String, dynamic>? headers,
    dynamic body,
  });

  Future<Response<dynamic>> delete(
    String path, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    dynamic body,
  });
}
