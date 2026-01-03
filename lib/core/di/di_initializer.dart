import 'package:get_it/get_it.dart';

typedef GetItInitializer = void Function(GetIt getIt, {String? environment});

abstract class AppDiInitializer {
  const AppDiInitializer(this._initializers);
  final GetItInitializer _initializers;

  void initialize(GetIt getIt) {
    _initializers.call(getIt);
  }
}
