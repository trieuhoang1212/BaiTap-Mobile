import '../models/task_model.dart';
import '../services/api_service.dart';
import '../services/database_service.dart';

// Repository Pattern - Kết hợp API và Local Database
// Ưu tiên lấy dữ liệu từ API, nếu không có mạng thì lấy từ local
class TaskRepository {
  final ApiService _apiService = ApiService();
  final DatabaseService _databaseService = DatabaseService();

  // Lấy tất cả tasks
  // Thử lấy từ API trước, nếu thất bại thì lấy từ local
  Future<List<Task>> getAllTasks() async {
    try {
      // Thử lấy từ API
      final tasks = await _apiService.getAllTasks();

      // Sync vào local database
      await _databaseService.insertAllTasks(tasks);

      return tasks;
    } catch (e) {
      // Nếu API fail, lấy từ local database (offline mode)
      print('API failed, loading from local database: $e');
      return await _databaseService.getAllTasks();
    }
  }

  // Lấy chi tiết task theo ID
  Future<Task?> getTaskById(int id) async {
    try {
      // Thử lấy từ API
      final task = await _apiService.getTaskById(id);

      // Cập nhật vào local database
      await _databaseService.insertTask(task);

      return task;
    } catch (e) {
      // Nếu API fail, lấy từ local database
      print('API failed, loading from local database: $e');
      return await _databaseService.getTaskById(id);
    }
  }

  // Xóa task
  Future<bool> deleteTask(int id) async {
    try {
      // Xóa trên API
      final success = await _apiService.deleteTask(id);

      if (success) {
        // Xóa trong local database
        await _databaseService.deleteTask(id);
      }

      return success;
    } catch (e) {
      // Nếu API fail, vẫn xóa trong local (sẽ sync sau)
      print('API failed, deleting from local database: $e');
      await _databaseService.deleteTask(id);
      return true;
    }
  }

  // Thêm task mới
  Future<Task?> createTask(Task task) async {
    try {
      // Thử tạo trên API
      final createdTask = await _apiService.createTask(task);

      if (createdTask != null) {
        // Lưu vào local database
        await _databaseService.insertTask(createdTask);
        return createdTask;
      } else {
        // API không hỗ trợ, chỉ lưu local
        await _databaseService.insertTask(task);
        return task;
      }
    } catch (e) {
      // Nếu API fail, chỉ lưu local
      print('API failed, saving to local database: $e');
      await _databaseService.insertTask(task);
      return task;
    }
  }

  // Lấy tasks từ local database (offline mode)
  Future<List<Task>> getLocalTasks() async {
    return await _databaseService.getAllTasks();
  }

  // Cập nhật task
  Future<bool> updateTask(Task task) async {
    try {
      // Cập nhật trong local database
      await _databaseService.updateTask(task);
      return true;
    } catch (e) {
      print('Error updating task: $e');
      return false;
    }
  }
}
