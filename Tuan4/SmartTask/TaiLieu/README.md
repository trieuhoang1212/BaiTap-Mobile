# **SmartTask - Ứng Dụng Quản Lý Công Việc**

## **Mô Tả**

**SmartTask** là ứng dụng quản lý công việc được xây dựng bằng Flutter, áp dụng kiến trúc **MVVM (Model-View-ViewModel)** kết hợp với **Provider** để quản lý state. Ứng dụng tích hợp **Firebase Authentication** để xác thực người dùng và gọi **REST API** để lấy dữ liệu công việc.

## **Mục Tiêu**

- Hiểu và áp dụng kiến trúc **MVVM** trong Flutter
- Sử dụng **Provider** để quản lý state
- Tích hợp **Firebase Auth** (đăng nhập Google, Email/Password)
- Gọi **REST API** để CRUD dữ liệu
- Xây dựng giao diện người dùng thân thiện

## **Cấu Trúc Thư Mục**

```
lib/
├── main.dart                 # Entry point
├── models/                   # Data models
│   └── task_model.dart
├── viewmodels/               # Business logic
│   ├── task_list_viewmodel.dart
│   ├── task_detail_viewmodel.dart
│   └── add_task_viewmodel.dart
├── views/tasks/              # UI screens
│   ├── task_list_screen.dart
│   ├── task_detail_screen.dart
│   └── add_task_screen.dart
├── services/                 # API services
│   └── api_service.dart
├── repositories/             # Data repositories
│   └── task_repository.dart
└── FlowLogin/                # Authentication
    ├── login_page.dart
    └── profile_page.dart
```

---

## **Các Hàm Chính**

### 1. **TaskListViewModel** ([task_list_viewmodel.dart](lib/viewmodels/task_list_viewmodel.dart))

| Hàm                        | Mô tả                               |
| -------------------------- | ----------------------------------- |
| `fetchTasks()`             | Lấy danh sách công việc từ API      |
| `deleteTask(id)`           | Xóa công việc theo ID               |
| `toggleTaskComplete(task)` | Đánh dấu hoàn thành/chưa hoàn thành |
| `refresh()`                | Làm mới danh sách                   |

### 2. **ApiService** ([api_service.dart](lib/services/api_service.dart))

| Hàm                | Mô tả                   |
| ------------------ | ----------------------- |
| `getAllTasks()`    | GET - Lấy tất cả tasks  |
| `getTaskById(id)`  | GET - Lấy chi tiết task |
| `createTask(task)` | POST - Tạo task mới     |
| `deleteTask(id)`   | DELETE - Xóa task       |

### 3. **Task Model** ([task_model.dart](lib/models/task_model.dart))

| Thuộc tính    | Kiểu   | Mô tả                                      |
| ------------- | ------ | ------------------------------------------ |
| `id`          | int    | ID công việc                               |
| `title`       | String | Tiêu đề                                    |
| `description` | String | Mô tả                                      |
| `status`      | String | Trạng thái (Pending/In Progress/Completed) |
| `priority`    | String | Độ ưu tiên (Low/Medium/High)               |
| `category`    | String | Danh mục                                   |
| `dueDate`     | String | Hạn hoàn thành                             |
| `subtasks`    | List   | Công việc con                              |
| `attachments` | List   | Tệp đính kèm                               |

---

## **Màn Hình Ứng Dụng**

### 1. **Màn hình Đăng nhập**

- Đăng nhập bằng Google
- Đăng nhập bằng Email/Password
- Tích hợp Firebase Authentication

![Login](assets/images/chinh.png)

### 2. **Màn hình Danh sách công việc**

- Hiển thị danh sách tasks từ API
- Đánh dấu hoàn thành bằng checkbox
- Pull to refresh
- Màu sắc theo độ ưu tiên

![List](assets/images/list.png)

### 3. **Màn hình Chi tiết công việc**

- Hiển thị đầy đủ thông tin task
- Danh sách công việc con (subtasks)
- Tệp đính kèm (attachments)
- Nút xóa công việc

![Detail](assets/images/list-bf.png)

### 4. **Màn hình Thêm công việc**

- Form nhập thông tin task
- Chọn danh mục, trạng thái, độ ưu tiên
- Chọn ngày hạn hoàn thành

![Add](assets/images/new_list.png)

---

## **Kết Quả Đạt Được**

 Áp dụng thành công kiến trúc **MVVM**  
 Quản lý state với **Provider**  
 Tích hợp **Firebase Authentication**  
 Gọi **REST API** thành công  
 Giao diện đa ngôn ngữ (Tiếng Việt)  
 Xử lý lỗi và hiển thị loading state

---

## **API Endpoint**

```
Base URL: https://amock.io/api/researchUTH

GET    /tasks      - Lấy danh sách tasks
GET    /task/{id}  - Lấy chi tiết task
POST   /tasks      - Tạo task mới
DELETE /task/{id}  - Xóa task
```

---

## **Công Nghệ Sử Dụng**

- **Flutter** - Framework UI
- **Provider** - State Management
- **Firebase Auth** - Xác thực người dùng
- **HTTP** - Gọi REST API
- **SQLite** - Lưu trữ local (offline mode)
