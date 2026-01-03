import 'package:git_scout/core/analytics/gs_analytics_event_model.dart';

abstract interface class IGsAnalyticsContract {
  void trackEvent(
    GsAnalyticsEventModel event, {
    Map<String, dynamic>? properties,
  });

  void onAppClosed();

  void onAppLaunched();
}
