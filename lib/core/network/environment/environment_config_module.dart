import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract interface class IEnvConfig {
  String get environment;
  String get baseUrl;
  String get githubApiToken;
  List<Interceptor> get interceptors;

  String toPrettyString() {
    return "Environment: $environment\nBase URL: $baseUrl\nGitHub API Token: $githubApiToken\nInterceptors: $interceptors";
  }
}

@Environment(Environment.dev)
@Injectable(as: IEnvConfig)
class DevEnvConfig extends IEnvConfig {
  @override
  String get environment => Environment.dev;

  @override
  String get baseUrl => "https://dev-api.github.com";

  @override
  String get githubApiToken => "dev-github-api-token";

  @override
  List<Interceptor> get interceptors => [];
}

@Environment(Environment.prod)
@Injectable(as: IEnvConfig)
class ProdEnvConfig extends IEnvConfig {
  @override
  String get environment => Environment.prod;

  @override
  String get baseUrl => "https://api.github.com";

  @override
  String get githubApiToken => "prod-github-api-token";

  @override
  List<Interceptor> get interceptors => [];
}
