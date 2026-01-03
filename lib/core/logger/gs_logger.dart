import 'package:git_scout/core/logger/gs_logger_contract.dart';
import 'package:git_scout/core/logger/gs_logger_level.dart';

/// A singleton logger that can be access globally.

class GsLogger {
  const GsLogger._(this._loggers);

  factory GsLogger.init(List<IGsLoggerContract> loggers) {
    return _instance ??= GsLogger._(loggers);
  }

  final List<IGsLoggerContract> _loggers;
  static GsLogger? _instance;

  static GsLogger get instance {
    if (_instance == null) {
      throw Exception("GsLogger not initialized. Please Initialize it first.");
    }

    return _instance!;
  }

  /// Log a message with a specific level for all available loggers.
  void log(String message, {GsLoggerLevel level = GsLoggerLevel.info}) {
    for (var logger in _loggers) {
      logger.log(message, level: level);
    }
  }

  /// Log an error message for all available loggers.
  void logError(String message) {
    for (var logger in _loggers) {
      logger.logError(message);
    }
  }
}
