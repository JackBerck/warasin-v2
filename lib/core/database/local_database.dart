import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDatabase {
  static final LocalDatabase instance = LocalDatabase._init();
  static Database? _database;

  LocalDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('warasin.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE medicines (
        id TEXT PRIMARY KEY,
        user_id TEXT NOT NULL,
        name TEXT NOT NULL,
        dosage TEXT,
        notes TEXT,
        synced INTEGER DEFAULT 0
      )
    ''');

    await db.execute('''
      CREATE TABLE schedules (
        id TEXT PRIMARY KEY,
        medicine_id TEXT NOT NULL,
        time TEXT NOT NULL,
        days TEXT NOT NULL,
        is_active INTEGER DEFAULT 1,
        synced INTEGER DEFAULT 0,
        FOREIGN KEY (medicine_id) REFERENCES medicines(id)
      )
    ''');

    await db.execute('''
      CREATE TABLE health_records (
        id TEXT PRIMARY KEY,
        user_id TEXT NOT NULL,
        date TEXT NOT NULL,
        blood_pressure TEXT,
        blood_sugar REAL,
        notes TEXT,
        synced INTEGER DEFAULT 0
      )
    ''');
  }
}
