import 'package:dio/dio.dart';

extension ApiResponseParser on Response<Map<String, dynamic>> {
  bool get isSuccessful => ((statusCode ?? 0) ~/ 100) == 2;

  Map<String, dynamic>? get dataMap => data?['data'] as Map<String, dynamic>?;
}
