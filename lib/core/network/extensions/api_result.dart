import 'package:dio/dio.dart';
import 'package:git_scout/core/network/exceptions/api_exception.dart';
import 'package:git_scout/core/network/exceptions/general_api_exception.dart';
import 'package:git_scout/core/network/extensions/api_exception_parser.dart';
import 'package:git_scout/core/prelude/result.dart';

extension ApiResultExtension on Future<Result<Response<dynamic>, Exception>> {
  /// This extension method is used for converting generic Exception to ApiException
  /// for a Result.
  Future<Result<Response<dynamic>, ApiException>> toApiResult() async {
    return (await this).fold(
      ifSuccess: (response) => success(response),
      ifFailure: (exception) {
        if (exception is DioException) {
          return failure(exception.parse());
        } else {
          return failure(
            GeneralApiException(
              message: exception.toString(),
              method: 'Unknown',
              url: Uri.parse(''),
              headers: {},
            ),
          );
        }
      },
    );
  }
}
