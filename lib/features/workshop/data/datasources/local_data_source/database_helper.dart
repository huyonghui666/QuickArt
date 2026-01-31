import 'package:path/path.dart';
import 'package:quick_art/features/workshop/domain/entities/workshop_task.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'workshop_tasks.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE workshop_tasks(
            id TEXT PRIMARY KEY,
            type TEXT,
            status TEXT,
            url TEXT,
            thumbnail_url TEXT,
            error_message TEXT,
            created_at INTEGER
          )
        ''');
      },
    );
  }

  Future<void> insertTask(WorkshopTask task) async {
    final db = await database;
    await db.insert(
      'workshop_tasks',
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateTask(WorkshopTask task) async {
    final db = await database;
    await db.update(
      'workshop_tasks',
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  // 用于仅更新部分字段，例如任务完成后更新状态和URL
  Future<void> updateTaskStatus(
    String id,
    WorkshopTaskStatus status, {
    String? url,
    String? thumbnailUrl,
    String? errorMessage,
  }) async {
    final db = await database;
    final Map<String, dynamic> values = {'status': status.name};
    if (url != null) values['url'] = url;
    if (thumbnailUrl != null) values['thumbnail_url'] = thumbnailUrl;
    if (errorMessage != null) values['error_message'] = errorMessage;

    await db.update('workshop_tasks', values, where: 'id = ?', whereArgs: [id]);
  }

  Future<List<WorkshopTask>> getTasks() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'workshop_tasks',
      orderBy: 'created_at DESC',
    );

    return List.generate(maps.length, (i) {
      return WorkshopTask.fromMap(maps[i]);
    });
  }

  Future<WorkshopTask?> getTaskById(String id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'workshop_tasks',
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return WorkshopTask.fromMap(maps.first);
    }
    return null;
  }
}
