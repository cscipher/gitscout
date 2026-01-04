import 'package:git_scout/app/boot_page.dart';
import 'package:git_scout/app/bootstrap.dart';
import 'package:injectable/injectable.dart';

void main() {
  const env = String.fromEnvironment('ENV', defaultValue: Environment.prod);
  bootstrap(() => const BootPage(), environment: env);
}
