import 'package:git_scout/core/logger/gs_logger_contract.dart';
import 'package:git_scout/core/logger/gs_logger_level.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@Environment(Environment.dev)
@LazySingleton(as: IGsLoggerContract)
class DevLogger implements IGsLoggerContract {
  const DevLogger(this._logger);
  final Logger _logger;

  @override
  void log(String message, {GsLoggerLevel? level}) {
    switch (level) {
      case GsLoggerLevel.debug:
        _logger.d(message);
        break;
      case GsLoggerLevel.info:
        _logger.i(message);
        break;
      case GsLoggerLevel.warning:
        _logger.w(message);
        break;
      case GsLoggerLevel.error:
        _logger.e(message);
        break;
      case GsLoggerLevel.fatal:
        _logger.f(message);
        break;
      default:
        _logger.i(message);
        break;
    }
  }

  @override
  void logError(String message, {StackTrace? stackTrace, Object? error}) {
    _logger.e(message, stackTrace: stackTrace, error: error);
  }
}
