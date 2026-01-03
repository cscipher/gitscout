import 'package:git_scout/core/db/app_db.dart';
import 'package:git_scout/core/db/hive_db/hive_constants.dart';
import 'package:hive_ce/hive_ce.dart';

class HiveDb implements AppDb {
  late final Box<dynamic> _db;

  @override
  Future<void> initialize() async {
    _db = await Hive.openBox<dynamic>(HiveConstants.dbName);
  }

  @override
  Future<void> saveToDb(String key, dynamic value) async {
    await _db.put(key, value);
  }

  @override
  dynamic getFromDb(String key) {
    return _db.get(key);
  }

  @override
  Future<void> deleteFromDb(String key) async {
    await _db.delete(key);
  }

  @override
  Future<void> close() async {
    await _db.close();
  }
}
