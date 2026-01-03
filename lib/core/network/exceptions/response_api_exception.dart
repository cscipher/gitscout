import 'package:git_scout/core/network/exceptions/api_exception.dart';

/// Exception thrown when a response is received with a non-200 status code.
class ResponseApiException extends ApiException {
  const ResponseApiException({
    required super.message,
    required super.method,
    required super.url,
    required super.headers,
    required this.statusCode,
  });

  final int statusCode;

  @override
  List<Object?> get props => [...super.props, statusCode];
}
