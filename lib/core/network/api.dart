import 'package:dio/dio.dart';
import 'package:git_scout/core/network/exceptions/api_exception.dart';
import 'package:git_scout/core/prelude/result.dart';

abstract class ApiClient {
  Future<Result<Response<dynamic>, ApiException>> get(
    String path, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  });

  Future<Result<Response<dynamic>, ApiException>> post(
    String path, {
    Map<String, dynamic>? headers,
    dynamic body,
  });

  Future<Result<Response<dynamic>, ApiException>> put(
    String path, {
    Map<String, dynamic>? headers,
    dynamic body,
  });

  Future<Result<Response<dynamic>, ApiException>> delete(
    String path, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    dynamic body,
  });
}
