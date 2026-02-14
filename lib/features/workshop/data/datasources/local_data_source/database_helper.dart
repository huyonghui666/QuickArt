import 'package:path/path.dart';
import 'package:quick_art/features/workshop/domain/entities/workshop_task.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sqflite/sqflite.dart';

/// 本地工作室数据库
class DatabaseHelper {
  /// 构造
  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;
  /// 数据库实例
  Future<Database> get database async {
    if (_database != null) return _database!;
    try {
      _database = await _initDatabase();
      return _database!;
    } catch (e, stackTrace) {
       await Sentry.captureException(
        e,
        stackTrace: stackTrace,
        withScope: (scope) {
          scope..setTag('feature', 'database')
          ..level = SentryLevel.fatal;
        },
      );
      rethrow;
    }
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'workshop_tasks.db');

    return openDatabase(
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
  /// 插入生成任务
  Future<void> insertTask(WorkshopTask task) async {
    final db = await database;
    await db.insert(
      'workshop_tasks',
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  /// 更新
  Future<void> updateTask(WorkshopTask task) async {
    final db = await database;
    await db.update(
      'workshop_tasks',
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  /// 用于仅更新部分字段，例如任务完成后更新状态和URL
  Future<void> updateTaskStatus(
    String id,
    WorkshopTaskStatus status, {
    String? url,
    String? thumbnailUrl,
    String? errorMessage,
  }) async {
    final db = await database;
    final values = <String, dynamic>{'status': status.name};
    if (url != null) values['url'] = url;
    if (thumbnailUrl != null) values['thumbnail_url'] = thumbnailUrl;
    if (errorMessage != null) values['error_message'] = errorMessage;

    await db.update('workshop_tasks', values, where: 'id = ?', whereArgs: [id]);
  }
  /// 获取所有生成任务
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
  /// 通过id获取某个任务
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
