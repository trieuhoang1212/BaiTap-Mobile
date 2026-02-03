import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/task_detail_viewmodel.dart';
import '../../models/task_model.dart';

// Màn hình chi tiết Task
class TaskDetailScreen extends StatefulWidget {
  final Task task;

  const TaskDetailScreen({super.key, required this.task});

  @override
  State<TaskDetailScreen> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  late TaskDetailViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = TaskDetailViewModel();
    // Fetch chi tiết từ API
    _viewModel.fetchTaskDetail(widget.task.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.blue),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'Chi tiết',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
          actions: [
            // Delete button
            Consumer<TaskDetailViewModel>(
              builder: (context, viewModel, child) {
                return IconButton(
                  icon: viewModel.isDeleting
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.delete, color: Colors.red),
                  onPressed: viewModel.isDeleting
                      ? null
                      : () => _confirmDelete(),
                );
              },
            ),
          ],
        ),
        body: Consumer<TaskDetailViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (viewModel.errorMessage != null && viewModel.task == null) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline, size: 64, color: Colors.red[300]),
                    const SizedBox(height: 16),
                    Text(viewModel.errorMessage!),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () =>
                          viewModel.fetchTaskDetail(widget.task.id),
                      child: const Text('Thử lại'),
                    ),
                  ],
                ),
              );
            }

            final task = viewModel.task ?? widget.task;
            return _buildDetailContent(task);
          },
        ),
      ),
    );
  }

  Widget _buildDetailContent(Task task) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            task.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),

          // Description
          Text(
            task.description,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey[600],
              height: 1.5,
            ),
          ),
          const SizedBox(height: 24),

          // Info Cards
          Row(
            children: [
              Expanded(
                child: _buildInfoCard(
                  'Danh mục',
                  task.category,
                  Icons.category,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildInfoCard('Trạng thái', task.status, Icons.flag),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildInfoCard(
                  'Ưu tiên',
                  task.priority,
                  Icons.priority_high,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Due Date
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.calendar_today, color: Colors.blue),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hạn hoàn thành',
                      style: TextStyle(fontSize: 12, color: Colors.blue),
                    ),
                    Text(
                      task.dueDate.isNotEmpty ? task.dueDate : 'Chưa có hạn',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Subtasks Section
          if (task.subtasks.isNotEmpty) ...[
            const Text(
              'Công việc con',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            ...task.subtasks.map((subtask) => _buildSubtaskItem(subtask)),
            const SizedBox(height: 24),
          ],

          // Attachments Section
          if (task.attachments.isNotEmpty) ...[
            const Text(
              'Tệp đính kèm',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            ...task.attachments.map(
              (attachment) => _buildAttachmentItem(attachment.fileName),
            ),
          ],
        ],
      ),
    );
  }

  // Info Card Widget
  Widget _buildInfoCard(String label, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.grey[600], size: 24),
          const SizedBox(height: 8),
          Text(label, style: TextStyle(fontSize: 11, color: Colors.grey[500])),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // Subtask Item Widget
  Widget _buildSubtaskItem(SubTask subtask) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Icon(
            subtask.isCompleted
                ? Icons.check_box
                : Icons.check_box_outline_blank,
            color: subtask.isCompleted ? Colors.green : Colors.grey,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              subtask.title,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
                decoration: subtask.isCompleted
                    ? TextDecoration.lineThrough
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Attachment Item Widget
  Widget _buildAttachmentItem(String attachment) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.attach_file, color: Colors.blue[600]),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              attachment,
              style: TextStyle(fontSize: 14, color: Colors.blue[700]),
            ),
          ),
        ],
      ),
    );
  }

  // Confirm Delete Dialog
  void _confirmDelete() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Xác nhận xóa'),
        content: const Text('Bạn có chắc chắn muốn xóa công việc này không?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Hủy'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context); // Close dialog
              final success = await _viewModel.deleteTask();
              if (success && mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Đã xóa công việc thành công'),
                    backgroundColor: Colors.green,
                  ),
                );
                Navigator.pop(context); // Go back to list
              } else if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      _viewModel.errorMessage ?? 'Không thể xóa công việc',
                    ),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: const Text('Xóa', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
