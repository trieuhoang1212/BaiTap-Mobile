import 'package:flutter/foundation.dart';
import '../models/task_model.dart';
import '../repositories/task_repository.dart';

// TaskDetail ViewModel - Quản lý state cho màn hình chi tiết task
class TaskDetailViewModel extends ChangeNotifier {
  final TaskRepository _repository = TaskRepository();

  Task? _task;
  bool _isLoading = false;
  String? _errorMessage;
  bool _isDeleting = false;

  // Getters
  Task? get task => _task;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isDeleting => _isDeleting;

  // Lấy chi tiết task theo ID
  Future<void> fetchTaskDetail(int id) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _task = await _repository.getTaskById(id);
      if (_task == null) {
        _errorMessage = 'Không tìm thấy công việc';
      }
    } catch (e) {
      _errorMessage = 'Không thể tải chi tiết công việc: $e';
      _task = null;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Xóa task
  Future<bool> deleteTask() async {
    if (_task == null) return false;

    _isDeleting = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final success = await _repository.deleteTask(_task!.id);
      _isDeleting = false;
      notifyListeners();
      return success;
    } catch (e) {
      _errorMessage = 'Không thể xóa công việc: $e';
      _isDeleting = false;
      notifyListeners();
      return false;
    }
  }

  // Set task trực tiếp (khi đã có từ list)
  void setTask(Task task) {
    _task = task;
    notifyListeners();
  }

  // Clear task
  void clear() {
    _task = null;
    _errorMessage = null;
    notifyListeners();
  }
}
