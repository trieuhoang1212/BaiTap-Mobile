import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/task_model.dart';

// Database Service - Xử lý local storage với SQLite
class DatabaseService {
  static Database? _database;
  static const String tableName = 'tasks';

  // Singleton pattern
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Khởi tạo database
  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'smarttask.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  // Tạo table
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableName(
        id INTEGER PRIMARY KEY,
        title TEXT NOT NULL,
        description TEXT,
        status TEXT,
        priority TEXT,
        category TEXT,
        dueDate TEXT,
        subtasks TEXT,
        attachments TEXT
      )
    ''');
  }

  // INSERT - Thêm task mới
  Future<int> insertTask(Task task) async {
    final db = await database;
    return await db.insert(
      tableName,
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // INSERT ALL - Thêm nhiều tasks (sync từ API)
  Future<void> insertAllTasks(List<Task> tasks) async {
    final db = await database;
    final batch = db.batch();

    for (var task in tasks) {
      batch.insert(
        tableName,
        task.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    await batch.commit(noResult: true);
  }

  // SELECT ALL - Lấy tất cả tasks
  Future<List<Task>> getAllTasks() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);
    return List.generate(maps.length, (i) => Task.fromMap(maps[i]));
  }

  // SELECT BY ID - Lấy task theo ID
  Future<Task?> getTaskById(int id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Task.fromMap(maps.first);
    }
    return null;
  }

  // UPDATE - Cập nhật task
  Future<int> updateTask(Task task) async {
    final db = await database;
    return await db.update(
      tableName,
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  // DELETE - Xóa task
  Future<int> deleteTask(int id) async {
    final db = await database;
    return await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }

  // DELETE ALL - Xóa tất cả tasks
  Future<int> deleteAllTasks() async {
    final db = await database;
    return await db.delete(tableName);
  }

  // Đóng database
  Future<void> close() async {
    final db = await database;
    await db.close();
  }
}
