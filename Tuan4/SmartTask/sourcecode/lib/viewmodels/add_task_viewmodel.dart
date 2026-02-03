import 'package:flutter/foundation.dart';
import '../models/task_model.dart';
import '../repositories/task_repository.dart';

// AddTask ViewModel - Quản lý state cho màn hình thêm task mới
class AddTaskViewModel extends ChangeNotifier {
  final TaskRepository _repository = TaskRepository();

  String _title = '';
  String _description = '';
  String _status = 'Pending';
  String _priority = 'Medium';
  String _category = 'Work';
  String _dueDate = '';

  bool _isLoading = false;
  String? _errorMessage;
  bool _isSuccess = false;

  // Getters
  String get title => _title;
  String get description => _description;
  String get status => _status;
  String get priority => _priority;
  String get category => _category;
  String get dueDate => _dueDate;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isSuccess => _isSuccess;

  // Validation
  bool get isValid => _title.trim().isNotEmpty;

  // Danh sách options
  List<String> get statusOptions => ['Pending', 'In Progress', 'Completed'];
  List<String> get priorityOptions => ['Low', 'Medium', 'High'];
  List<String> get categoryOptions => [
    'Work',
    'Personal',
    'Shopping',
    'Health',
    'Education',
    'Other',
  ];

  // Setters
  void setTitle(String value) {
    _title = value;
    notifyListeners();
  }

  void setDescription(String value) {
    _description = value;
    notifyListeners();
  }

  void setStatus(String value) {
    _status = value;
    notifyListeners();
  }

  void setPriority(String value) {
    _priority = value;
    notifyListeners();
  }

  void setCategory(String value) {
    _category = value;
    notifyListeners();
  }

  void setDueDate(String value) {
    _dueDate = value;
    notifyListeners();
  }

  // Tạo task mới
  Future<bool> createTask() async {
    if (!isValid) {
      _errorMessage = 'Vui lòng nhập tiêu đề công việc';
      notifyListeners();
      return false;
    }

    _isLoading = true;
    _errorMessage = null;
    _isSuccess = false;
    notifyListeners();

    try {
      // Tạo ID mới (trong thực tế sẽ do server generate)
      final newId = DateTime.now().millisecondsSinceEpoch;

      final task = Task(
        id: newId,
        title: _title.trim(),
        description: _description.trim(),
        status: _status,
        priority: _priority,
        category: _category,
        dueDate: _dueDate.isNotEmpty ? _dueDate : _getDefaultDueDate(),
        subtasks: [],
        attachments: [],
      );

      final createdTask = await _repository.createTask(task);

      if (createdTask != null) {
        _isSuccess = true;
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        _errorMessage = 'Không thể tạo công việc';
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errorMessage = 'Lỗi: $e';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Reset form
  void reset() {
    _title = '';
    _description = '';
    _status = 'Pending';
    _priority = 'Medium';
    _category = 'Work';
    _dueDate = '';
    _isLoading = false;
    _errorMessage = null;
    _isSuccess = false;
    notifyListeners();
  }

  // Helper - Lấy ngày mặc định (hôm nay)
  String _getDefaultDueDate() {
    final now = DateTime.now();
    return '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')} '
        '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
  }
}
