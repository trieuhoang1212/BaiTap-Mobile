import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/task_list_viewmodel.dart';
import '../../models/task_model.dart';
import 'task_detail_screen.dart';
import 'add_task_screen.dart';

// Màn hình danh sách Tasks
class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch tasks khi màn hình được tạo
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TaskListViewModel>().fetchTasks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Danh sách',
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle, color: Colors.blue, size: 28),
            onPressed: () => _navigateToAddTask(),
          ),
        ],
      ),
      body: Consumer<TaskListViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (viewModel.errorMessage != null) {
            return _buildErrorView(viewModel.errorMessage!);
          }

          if (viewModel.isEmpty) {
            return _buildEmptyView();
          }

          return _buildTaskList(viewModel.tasks);
        },
      ),
    );
  }

  // Empty View - Khi không có tasks
  Widget _buildEmptyView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/empty_tasks.png',
            width: 150,
            height: 150,
            errorBuilder: (context, error, stackTrace) {
              return Icon(
                Icons.assignment_outlined,
                size: 100,
                color: Colors.grey[400],
              );
            },
          ),
          const SizedBox(height: 20),
          const Text(
            'Chưa có công việc!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Hãy thêm công việc để bắt đầu',
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => _navigateToAddTask(),
            icon: const Icon(Icons.add),
            label: const Text('Thêm công việc'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Error View
  Widget _buildErrorView(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: Colors.red[300]),
          const SizedBox(height: 16),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.red),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => context.read<TaskListViewModel>().refresh(),
            child: const Text('Thử lại'),
          ),
        ],
      ),
    );
  }

  // Task List View
  Widget _buildTaskList(List<Task> tasks) {
    return RefreshIndicator(
      onRefresh: () => context.read<TaskListViewModel>().refresh(),
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return _buildTaskCard(tasks[index]);
        },
      ),
    );
  }

  // Task Card Widget
  Widget _buildTaskCard(Task task) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: _getCardColor(task.priority),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => _navigateToDetail(task),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Checkbox - có thể nhấn để toggle complete
                GestureDetector(
                  onTap: () => _toggleTaskComplete(task),
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: task.status == 'Completed'
                            ? Colors.green
                            : Colors.grey,
                        width: 2,
                      ),
                      color: task.status == 'Completed'
                          ? Colors.green
                          : Colors.transparent,
                    ),
                    child: task.status == 'Completed'
                        ? const Icon(Icons.check, size: 16, color: Colors.white)
                        : null,
                  ),
                ),
                const SizedBox(width: 12),
                // Task Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          decoration: task.status == 'Completed'
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        task.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          _buildStatusBadge(task.status),
                          const Spacer(),
                          Text(
                            task.dueDate,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Status Badge
  Widget _buildStatusBadge(String status) {
    Color bgColor;
    Color textColor;

    switch (status.toLowerCase()) {
      case 'completed':
        bgColor = Colors.green.withOpacity(0.2);
        textColor = Colors.green;
        break;
      case 'in progress':
        bgColor = Colors.blue.withOpacity(0.2);
        textColor = Colors.blue;
        break;
      default:
        bgColor = Colors.orange.withOpacity(0.2);
        textColor = Colors.orange;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        'Trạng thái: $status',
        style: TextStyle(
          fontSize: 11,
          color: textColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  // Get card color based on priority
  Color _getCardColor(String priority) {
    switch (priority.toLowerCase()) {
      case 'high':
        return const Color(0xFFFFE5E5); // Light red
      case 'medium':
        return const Color(0xFFFFF9E5); // Light yellow
      case 'low':
        return const Color(0xFFE5FFE5); // Light green
      default:
        return Colors.white;
    }
  }

  // Navigate to Detail Screen
  void _navigateToDetail(Task task) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TaskDetailScreen(task: task)),
    ).then((_) {
      // Refresh list khi quay lại
      context.read<TaskListViewModel>().refresh();
    });
  }

  // Navigate to Add Task Screen
  void _navigateToAddTask() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddTaskScreen()),
    ).then((_) {
      // Refresh list khi quay lại
      context.read<TaskListViewModel>().refresh();
    });
  }

  // Toggle task complete status
  void _toggleTaskComplete(Task task) async {
    final viewModel = context.read<TaskListViewModel>();
    final success = await viewModel.toggleTaskComplete(task);
    if (!success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Không thể cập nhật trạng thái'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
