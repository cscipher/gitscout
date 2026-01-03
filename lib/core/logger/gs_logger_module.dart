import 'package:git_scout/core/logger/dev_logging/dev_logger.dart';
import 'package:git_scout/core/logger/gs_logger_contract.dart';
import 'package:git_scout/core/logger/prod_logging/prod_logger.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@module
abstract class GsLoggerModule {
  @singleton
  Logger get logger => Logger();

  @lazySingleton
  List<IGsLoggerContract> get loggers => [DevLogger(logger), ProdLogger()];
}
