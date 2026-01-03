import 'package:git_scout/core/logger/gs_logger_level.dart';

abstract interface class IGsLoggerContract {
  void log(String message, {GsLoggerLevel? level});
  void logError(String message, {StackTrace? stackTrace, Object? error});
}
