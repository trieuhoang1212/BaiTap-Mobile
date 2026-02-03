import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/task_model.dart';

// API Service - Xử lý các API calls
class ApiService {
  static const String baseUrl = 'https://amock.io/api/researchUTH';

  // GET - Lấy tất cả tasks
  Future<List<Task>> getAllTasks() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/tasks'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final dynamic data = json.decode(response.body);

        // Handle different response formats
        List<dynamic> taskList;
        if (data is List) {
          taskList = data;
        } else if (data is Map && data.containsKey('data')) {
          taskList = data['data'] as List;
        } else if (data is Map && data.containsKey('tasks')) {
          taskList = data['tasks'] as List;
        } else {
          taskList = [];
        }

        return taskList.map((json) => Task.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load tasks: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching tasks: $e');
    }
  }

  // GET - Lấy chi tiết task theo ID
  Future<Task> getTaskById(int id) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/task/$id'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final dynamic data = json.decode(response.body);

        // Handle different response formats
        Map<String, dynamic> taskData;
        if (data is Map<String, dynamic>) {
          if (data.containsKey('data')) {
            taskData = data['data'];
          } else {
            taskData = data;
          }
        } else {
          throw Exception('Invalid response format');
        }

        return Task.fromJson(taskData);
      } else {
        throw Exception('Failed to load task: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching task: $e');
    }
  }

  // DELETE - Xóa task theo ID
  Future<bool> deleteTask(int id) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/task/$id'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        return true;
      } else {
        throw Exception('Failed to delete task: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error deleting task: $e');
    }
  }

  // POST - Tạo task mới (nếu API hỗ trợ)
  Future<Task?> createTask(Task task) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/tasks'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(task.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = json.decode(response.body);
        return Task.fromJson(data);
      } else {
        // API mock có thể không hỗ trợ POST, return null
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
