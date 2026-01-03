import 'package:dio/dio.dart';
import 'package:git_scout/core/network/api.dart';
import 'package:git_scout/core/network/exceptions/api_exception.dart';
import 'package:git_scout/core/network/extensions/api_result.dart';
import 'package:git_scout/core/prelude/result.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ApiClient)
class DioClient implements ApiClient {
  const DioClient(this._dio);

  final Dio _dio;

  @override
  Future<Result<Response<dynamic>, ApiException>> get(
    String path, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    return Result.fromAsync(
      () => _dio.get(
        path,
        options: Options(headers: headers),
        queryParameters: queryParameters,
      ),
    ).toApiResult();
  }

  @override
  Future<Result<Response<dynamic>, ApiException>> post(
    String path, {
    Map<String, dynamic>? headers,
    body,
  }) async {
    return Result.fromAsync(
      () => _dio.post(
        path,
        options: Options(headers: headers),
        data: body,
      ),
    ).toApiResult();
  }

  @override
  Future<Result<Response<dynamic>, ApiException>> put(
    String path, {
    Map<String, dynamic>? headers,
    body,
  }) async {
    return Result.fromAsync(
      () => _dio.put(
        path,
        options: Options(headers: headers),
        data: body,
      ),
    ).toApiResult();
  }

  @override
  Future<Result<Response<dynamic>, ApiException>> delete(
    String path, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    body,
  }) async {
    return Result.fromAsync(
      () => _dio.delete(
        path,
        options: Options(headers: headers),
        data: body,
      ),
    ).toApiResult();
  }
}
