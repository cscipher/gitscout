class GsAnalyticsEventModel {
  const GsAnalyticsEventModel({
    required this.name,
    required this.properties,
  });

  final String name;
  final Map<String, dynamic> properties;
}