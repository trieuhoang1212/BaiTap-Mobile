import 'package:flutter/foundation.dart';
import '../models/task_model.dart';
import '../services/api_service.dart';

// TaskList ViewModel - Quản lý state cho màn hình danh sách tasks
class TaskListViewModel extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<Task> _tasks = [];
  bool _isLoading = false;
  String? _errorMessage;

  // Getters
  List<Task> get tasks => _tasks;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isEmpty => _tasks.isEmpty;

  // Lấy danh sách tasks trực tiếp từ API
  Future<void> fetchTasks() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _tasks = await _apiService.getAllTasks();
      _errorMessage = null;
    } catch (e) {
      _errorMessage = 'Không thể tải danh sách công việc: $e';
      _tasks = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Xóa task trực tiếp từ API
  Future<bool> deleteTask(int id) async {
    try {
      final success = await _apiService.deleteTask(id);
      if (success) {
        _tasks.removeWhere((task) => task.id == id);
        notifyListeners();
      }
      return success;
    } catch (e) {
      _errorMessage = 'Không thể xóa công việc: $e';
      notifyListeners();
      return false;
    }
  }

  // Refresh danh sách
  Future<void> refresh() async {
    await fetchTasks();
  }

  // Toggle trạng thái hoàn thành task (cập nhật local)
  Future<bool> toggleTaskComplete(Task task) async {
    try {
      final newStatus = task.status == 'Completed' ? 'Pending' : 'Completed';
      final updatedTask = task.copyWith(status: newStatus);

      // Cập nhật trong danh sách local
      final index = _tasks.indexWhere((t) => t.id == task.id);
      if (index != -1) {
        _tasks[index] = updatedTask;
        notifyListeners();
      }
      return true;
    } catch (e) {
      _errorMessage = 'Không thể cập nhật trạng thái: $e';
      notifyListeners();
      return false;
    }
  }
}
