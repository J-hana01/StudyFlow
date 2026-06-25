import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/schedule.dart';

class DatabaseHelper {
  static final DatabaseHelper instance =
      DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {

    if (_database != null) {
      return _database!;
    }

    _database = await _initDB('studyflow.db');

    return _database!;
  }

  Future<Database> _initDB(
    String filePath,
  ) async {

    final dbPath = await getDatabasesPath();

    final path = join(
      dbPath,
      filePath,
    );

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(
    Database db,
    int version,
  ) async {

    await db.execute('''

CREATE TABLE schedules(

id INTEGER PRIMARY KEY AUTOINCREMENT,
studyName TEXT,
subjectNumber TEXT,
visit TEXT,
dateTime TEXT

)

''');
  }

  Future<int> insertSchedule(
    Schedule schedule,
  ) async {

    final db = await database;

    return await db.insert(
      'schedules',
      schedule.toMap(),
    );
  }

  Future<List<Schedule>> getSchedules() async {

    final db = await database;

    final maps = await db.query(
      'schedules',
      orderBy: 'dateTime',
    );

    return maps.map(
      (e) => Schedule.fromMap(e),
    ).toList();
  }

  Future<void> deleteSchedule(
    int id,
  ) async {

    final db = await database;

    await db.delete(
      'schedules',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> updateSchedule(
    Schedule schedule,
  ) async {

    final db = await database;

    return await db.update(
      'schedules',
      schedule.toMap(),
      where: 'id = ?',
      whereArgs: [schedule.id],
    );
  }
}