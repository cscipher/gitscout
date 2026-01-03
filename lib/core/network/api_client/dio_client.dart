import 'package:dio/dio.dart';
import 'package:git_scout/core/network/api.dart';
import 'package:git_scout/core/network/api_client/dio_factory.dart';
import 'package:git_scout/core/network/parsers/api_exception_parser.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DioClient implements IApiClientContract {
  const DioClient(this._dioFactory);

  final DioFactory _dioFactory;

  Dio get dio => _dioFactory.dio;

  @override
  Future<Response<dynamic>> get(
    String path, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.get(
        path,
        options: Options(headers: headers),
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      throw e.parse();
    }
  }

  @override
  Future<Response<dynamic>> post(
    String path, {
    Map<String, dynamic>? headers,
    body,
  }) async {
    try {
      final response = await dio.post(
        path,
        options: Options(headers: headers),
        data: body,
      );
      return response;
    } on DioException catch (e) {
      throw e.parse();
    }
  }

  @override
  Future<Response<dynamic>> put(
    String path, {
    Map<String, dynamic>? headers,
    body,
  }) async {
    try {
      final response = await dio.put(
        path,
        options: Options(headers: headers),
        data: body,
      );
      return response;
    } on DioException catch (e) {
      throw e.parse();
    }
  }

  @override
  Future<Response<dynamic>> delete(
    String path, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
    body,
  }) async {
    try {
      final response = await dio.delete(
        path,
        options: Options(headers: headers),
        data: body,
      );
      return response;
    } on DioException catch (e) {
      throw e.parse();
    }
  }
}
