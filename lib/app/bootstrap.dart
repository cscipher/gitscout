import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:git_scout/app/app_di_initializers.dart';
import 'package:git_scout/core/db/app_db.dart';
import 'package:git_scout/core/di/di_initializer.dart';
import 'package:git_scout/core/logger/gs_logger.dart';
import 'package:injectable/injectable.dart';

void bootstrap(Widget Function() fn, {String environment = Environment.prod}) {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      _initializeDi(environment);
      await _initializeDb();

      runApp(fn());
    },
    (error, stackTrace) {
      final logger = diContainer.get<GsLogger>();
      logger.logError(
        "Error in bootstrap",
        error: error,
        stackTrace: stackTrace,
      );
    },
  );
}

void _initializeDi(String environment) {
  configureDependencies(diContainer, environment);
  initializeDiConatiners(initializers: appDiInitializers);
}

Future<void> _initializeDb() async {
  final db = diContainer.get<AppDb>();
  await db.initialize();
}
