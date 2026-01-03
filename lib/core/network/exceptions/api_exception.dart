import 'package:equatable/equatable.dart';

abstract class ApiException extends Equatable implements Exception {
  const ApiException({
    required this.message,
    required this.method,
    required this.url,
    required this.headers,
  });

  final String message;
  final String method;
  final Uri url;
  final Map<String, dynamic>? headers;

  @override
  List<Object?> get props => [message, method, url, headers];
}
