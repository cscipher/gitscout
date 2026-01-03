import 'package:dio/dio.dart';
import 'package:git_scout/core/network/environment/environment_config_module.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioClientModule {
  @singleton
  Dio dio(IEnvConfig envConfig) =>
      Dio(_createBaseOptions(envConfig.baseUrl, envConfig.githubApiToken))
        ..interceptors.addAll(envConfig.interceptors);

  BaseOptions _createBaseOptions(String url, String githubApiToken) {
    final options = BaseOptions(
      baseUrl: url,
      receiveDataWhenStatusError: true,
      headers: {"Authorization": "Bearer $githubApiToken"},
      contentType: Headers.jsonContentType,
      sendTimeout: const Duration(seconds: 10),
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    );

    return options;
  }
}
