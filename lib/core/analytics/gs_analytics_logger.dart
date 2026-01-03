import 'package:git_scout/core/analytics/gs_analytics_contract.dart';
import 'package:git_scout/core/analytics/gs_analytics_event_model.dart';
import 'package:injectable/injectable.dart';

@Environment(Environment.prod)
@lazySingleton
class GsAnalyticsLogger {
  const GsAnalyticsLogger._(this._modules);

  final List<IGsAnalyticsContract> _modules;

  void trackEvent(
    GsAnalyticsEventModel event, {
    Map<String, dynamic>? properties,
  }) {
    for (final module in _modules) {
      module.trackEvent(event, properties: properties);
    }
  }

  void onAppClosed() {
    for (final module in _modules) {
      module.onAppClosed();
    }
  }

  void onAppLaunched() {
    for (final module in _modules) {
      module.onAppLaunched();
    }
  }
}
