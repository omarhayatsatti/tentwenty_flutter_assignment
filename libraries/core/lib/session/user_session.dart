import 'package:shared_preferences/shared_preferences.dart';

class UserSession {
  static final UserSession _instance = UserSession._internal();

  factory UserSession() => _instance;

  UserSession._internal();

  static SharedPreferences prefs;

  static Future<dynamic> _getInstance() async =>
      prefs = await SharedPreferences.getInstance();

  static Future<bool> savePreferences(String key, String data) async {
    await _getInstance();
    return prefs.setString(key, data);
  }

  static Future<String> getPreferences(String key) async {
    await _getInstance();
    return prefs.getString(key) ?? '';
  }


}



//
// class DBManager {
//
//   // Singleton pattern
//   static final DBManager _dbManager = new DBManager._internal();
//   DBManager._internal();
//   static DBManager get instance => _dbManager;
//
//   // Members
//   static Database _database;
//   final _initDBMemoizer = AsyncMemoizer<Database>();
//
//   Future<Database> get database async {
//     if (_database != null)
//       return _database;
//
//     // if _database is null we instantiate it
//     _database = await _initDBMemoizer.runOnce(() async {
//       return await _initDB();
//     });
//
//     return _database;
//   }
//
//   Future<Database> _initDB() async {
//     // .. Copy initial database (data.db) from assets file to database path
//     String databasePath = await getDatabasesPath();
//     String databaseFilePath = p.join(databasePath, 'data.db');
//
//     return await openDatabase(databaseFilePath, version: 1);
//   }
//
// }
//
