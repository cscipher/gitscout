import 'package:git_scout/core/analytics/gs_analytics_contract.dart';
import 'package:injectable/injectable.dart';

@module
abstract class GsAnalyticsModule {
  @lazySingleton
  List<IGsAnalyticsContract> get contracts => [];
}
