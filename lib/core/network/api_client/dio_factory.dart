import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class DioFactory {
  const DioFactory({required String baseUrl, List<Interceptor>? interceptors})
    : _baseUrl = baseUrl,
      _interceptors = interceptors ?? const [];

  final String _baseUrl;
  final List<Interceptor> _interceptors;

  static Dio? _dio;

  Dio get dio {
    return _dio ??= _createDio();
  }

  Dio _createDio() {
    return Dio(_createBaseOptions())..interceptors.addAll(_interceptors);
  }

  BaseOptions _createBaseOptions() {
    final options = BaseOptions(
      baseUrl: _baseUrl,
      receiveDataWhenStatusError: true,
      contentType: Headers.jsonContentType,
      sendTimeout: const Duration(seconds: 10),
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    );

    return options;
  }
}
