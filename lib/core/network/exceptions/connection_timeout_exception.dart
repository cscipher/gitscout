import 'package:git_scout/core/network/exceptions/api_exception.dart';

/// Exception thrown when a connection timeout occurs.
class ConnectionTimeoutException extends ApiException {
  const ConnectionTimeoutException({
    required super.message,
    required super.method,
    required super.url,
    required super.headers,
    required this.timeout,
  });

  final Duration? timeout;

  @override
  List<Object?> get props => [...super.props, timeout];
}
