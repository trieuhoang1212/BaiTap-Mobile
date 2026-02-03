// Task Model - Định nghĩa cấu trúc dữ liệu Task
class Task {
  final int id;
  final String title;
  final String description;
  final String status;
  final String priority;
  final String category;
  final String dueDate;
  final List<SubTask> subtasks;
  final List<Attachment> attachments;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.priority,
    required this.category,
    required this.dueDate,
    this.subtasks = const [],
    this.attachments = const [],
  });

  // Parse từ JSON (API response)
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      status: json['status'] ?? 'Pending',
      priority: json['priority'] ?? 'Medium',
      category: json['category'] ?? 'Work',
      dueDate: json['dueDate'] ?? '',
      subtasks: json['subtasks'] != null
          ? (json['subtasks'] as List).map((s) => SubTask.fromJson(s)).toList()
          : [],
      attachments: json['attachments'] != null
          ? (json['attachments'] as List)
                .map((a) => Attachment.fromJson(a))
                .toList()
          : [],
    );
  }

  // Convert sang JSON (để gửi API hoặc lưu local)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'status': status,
      'priority': priority,
      'category': category,
      'dueDate': dueDate,
      'subtasks': subtasks.map((s) => s.toJson()).toList(),
      'attachments': attachments.map((a) => a.toJson()).toList(),
    };
  }

  // Convert sang Map để lưu vào SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'status': status,
      'priority': priority,
      'category': category,
      'dueDate': dueDate,
      'subtasks': subtasks.map((s) => s.toJson()).toList().toString(),
      'attachments': attachments.map((a) => a.toJson()).toList().toString(),
    };
  }

  // Parse từ SQLite Map
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      status: map['status'] ?? 'Pending',
      priority: map['priority'] ?? 'Medium',
      category: map['category'] ?? 'Work',
      dueDate: map['dueDate'] ?? '',
      subtasks: [],
      attachments: [],
    );
  }

  // Copy with method để tạo bản sao với thay đổi
  Task copyWith({
    int? id,
    String? title,
    String? description,
    String? status,
    String? priority,
    String? category,
    String? dueDate,
    List<SubTask>? subtasks,
    List<Attachment>? attachments,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
      priority: priority ?? this.priority,
      category: category ?? this.category,
      dueDate: dueDate ?? this.dueDate,
      subtasks: subtasks ?? this.subtasks,
      attachments: attachments ?? this.attachments,
    );
  }
}

// Attachment Model
class Attachment {
  final int id;
  final String fileName;
  final String fileUrl;

  Attachment({required this.id, required this.fileName, required this.fileUrl});

  factory Attachment.fromJson(Map<String, dynamic> json) {
    return Attachment(
      id: json['id'] ?? 0,
      fileName: json['fileName'] ?? '',
      fileUrl: json['fileUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'fileName': fileName, 'fileUrl': fileUrl};
  }
}

// SubTask Model
class SubTask {
  final int id;
  final String title;
  final bool isCompleted;

  SubTask({required this.id, required this.title, this.isCompleted = false});

  factory SubTask.fromJson(Map<String, dynamic> json) {
    return SubTask(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      isCompleted: json['isCompleted'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'isCompleted': isCompleted};
  }
}
