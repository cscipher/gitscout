import 'package:get_it/get_it.dart';

typedef GetItInitializer = void Function(GetIt getIt, String? environment);

abstract class AppInitializer {
  const AppInitializer(this._initializer);

  final GetItInitializer _initializer;

  void initialize(GetIt getIt) {
    _initializer.call(getIt, null);
  }
}
