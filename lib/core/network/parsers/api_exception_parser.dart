import 'package:dio/dio.dart';
import 'package:git_scout/core/network/exceptions/api_exception.dart';
import 'package:git_scout/core/network/exceptions/connection_timeout_exception.dart';
import 'package:git_scout/core/network/exceptions/general_api_exception.dart';
import 'package:git_scout/core/network/exceptions/response_api_exception.dart';

extension ApiExceptionParser on DioException {
  ApiException parse() {
    final headers = requestOptions.headers;

    switch (type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        {
          throw ConnectionTimeoutException(
            message: message ?? 'Connection timeout',
            method: requestOptions.method,
            url: requestOptions.uri,
            headers: headers,
            timeout: requestOptions.connectTimeout,
          );
        }

      case DioExceptionType.badResponse:
        {
          throw ResponseApiException(
            message: message ?? 'Bad response',
            method: requestOptions.method,
            url: requestOptions.uri,
            headers: headers,
            statusCode: response?.statusCode ?? 0,
          );
        }

      case DioExceptionType.badCertificate:
      case DioExceptionType.cancel:
      case DioExceptionType.unknown:
        {
          throw GeneralApiException(
            message: message ?? 'Unknown error',
            method: requestOptions.method,
            url: requestOptions.uri,
            headers: headers,
          );
        }
    }
  }
}
