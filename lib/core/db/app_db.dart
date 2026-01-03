abstract class AppDb {
  Future<void> initialize();

  Future<void> close();

  Future<void> saveToDb(String key, dynamic value);

  dynamic getFromDb(String key);

  Future<void> deleteFromDb(String key);
}
