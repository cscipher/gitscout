import 'package:git_scout/core/network/exceptions/api_exception.dart';

/// Exception thrown when an unknown error occurs.
class GeneralApiException extends ApiException {
  const GeneralApiException({
    required super.message,
    required super.method,
    required super.url,
    required super.headers,
  });
}
