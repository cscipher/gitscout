import 'package:git_scout/core/logger/gs_logger_contract.dart';
import 'package:git_scout/core/logger/gs_logger_level.dart';
import 'package:injectable/injectable.dart';

/// A singleton logger that can be access globally.

@lazySingleton
class GsLogger {
  const GsLogger(this._loggers);
  final List<IGsLoggerContract> _loggers;

  /// Log a message with a specific level for all available loggers.
  void log(String message, {GsLoggerLevel level = GsLoggerLevel.info}) {
    for (var logger in _loggers) {
      logger.log(message, level: level);
    }
  }

  /// Log an error message for all available loggers.
  void logError(String message, {Object? error, StackTrace? stackTrace}) {
    for (var logger in _loggers) {
      logger.logError(message, error: error, stackTrace: stackTrace);
    }
  }
}
