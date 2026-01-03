import 'package:get_it/get_it.dart';
import 'package:git_scout/core/di/di_initializer.config.dart';
import 'package:git_scout/core/di/di_initializer_contract.dart';
import 'package:injectable/injectable.dart';

final diContainer = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: false,
  asExtension: true,
)
void configureDependencies(GetIt getIt, String? environment) =>
    getIt.init(environment: environment);

void initializeDiConatiners({required List<AppInitializer> initializers}) {
  for (final initializer in initializers) {
    initializer.initialize(diContainer);
  }
}
