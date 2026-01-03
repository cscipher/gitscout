import 'package:git_scout/core/logger/gs_logger_contract.dart';
import 'package:git_scout/core/logger/gs_logger_level.dart';
import 'package:injectable/injectable.dart';

/*
  No logging implementation as of now.
  Feel free to modify this as per your needs.
*/

@Environment(Environment.prod)
@lazySingleton
class ProdLogger implements IGsLoggerContract {
  @override
  void log(String message, {GsLoggerLevel? level}) {}

  @override
  void logError(String message) {}
}
