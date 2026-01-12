import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  // firebase remote config instance
  final _remoteConfig = FirebaseRemoteConfig.instance;
  String _buttonColorHex = "0xFF4CAF50";

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final User? _currentUser = FirebaseAuth.instance.currentUser;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadUserData();
    _setupRemoteConfig();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _dobController.dispose();
    super.dispose();
  }

  Future<void> _setupRemoteConfig() async {
    try {
      // Cấu hình thời gian fetch
      await _remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(minutes: 1),
          minimumFetchInterval: Duration.zero,
        ),
      );

      // Đặt giá trị mặc định trong code
      await _remoteConfig.setDefaults(<String, dynamic>{
        "button_color": "0xFF4CAF50",
      });

      // Tải dữ liệu từ Firebase về và kích hoạt nó
      await _remoteConfig.fetchAndActivate();

      // Lấy giá trị từ Firebase và cập nhật giao diện
      setState(() {
        _buttonColorHex = _remoteConfig.getString("button_color");
      });
    } catch (e) {
      ("Lỗi Remote Config: $e");
    }
  }

  // Load dữ liệu user từ Firestore
  Future<void> _loadUserData() async {
    if (_currentUser == null) return;

    setState(() => _isLoading = true);

    try {
      final doc = await _firestore
          .collection('users')
          .doc(_currentUser.uid)
          .get();

      if (doc.exists) {
        final data = doc.data()!;
        _nameController.text = data['name'] ?? '';
        _emailController.text = data['email'] ?? _currentUser.email ?? '';
        _dobController.text = data['dateOfBirth'] ?? '';
      } else {
        // Nếu chưa có data, tạo document mới với thông tin cơ bản
        _emailController.text = _currentUser.email ?? '';
        _nameController.text = _currentUser.displayName ?? '';
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Lỗi tải dữ liệu: $e')));
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  // Lưu dữ liệu user vào Firestore
  Future<void> _saveUserData() async {
    if (_currentUser == null) return;

    setState(() => _isLoading = true);

    try {
      await _firestore.collection('users').doc(_currentUser.uid).set({
        'name': _nameController.text.trim(),
        'email': _emailController.text.trim(),
        'dateOfBirth': _dobController.text.trim(),
        'updatedAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Đã lưu thông tin thành công!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Lỗi lưu dữ liệu: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  // Chọn ngày sinh
  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        _dobController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Nền trắng
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Nút Back tròn màu xanh
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.all(10),
                      shape: const CircleBorder(),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new_sharp,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  // Chữ "Profile" ở giữa
                  const Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue,
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ), // Widget tàng hình để cân đối layout
                ],
              ),

              const SizedBox(height: 30),

              // 2. PHẦN AVATAR (Ảnh tròn + Icon máy ảnh)
              Center(
                child: Stack(
                  children: [
                    // Ảnh đại diện
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.lightBlue, width: 2),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/avatar.jpg'),
                        ),
                      ),
                    ),
                    // Icon máy ảnh nhỏ ở góc
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(
                            255,
                            68,
                            71,
                            109,
                          ), // Màu tím than giống hình
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // 3. CÁC Ô NHẬP LIỆU (FORM)

              // Ô Name
              _buildLabel("Name"),
              _buildTextField(controller: _nameController),
              const SizedBox(height: 20),

              // Ô Email
              _buildLabel("Email"),
              _buildTextField(controller: _emailController),
              const SizedBox(height: 20),

              // Ô Date of Birth (Có icon mũi tên xuống)
              _buildLabel("Date of Birth"),
              GestureDetector(
                onTap: _selectDate,
                child: AbsorbPointer(
                  // Chặn bàn phím hiện lên khi bấm vào ngày
                  child: TextField(
                    controller: _dobController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      suffixIcon: const Icon(
                        Icons.calendar_today,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _saveUserData,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(int.parse(_buttonColorHex)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          "Save Profile",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 20),

              // NÚT BACK
              SizedBox(
                width: double.infinity, // Chiều rộng full màn hình
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue, // Màu nền
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Bo tròn góc
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Back",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Hàm phụ để tạo Label (Tiêu đề nhỏ trên mỗi ô input)
  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    );
  }

  // Hàm phụ để tạo ô nhập liệu
  Widget _buildTextField({required TextEditingController controller}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade300), // Viền xám nhạt
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.lightBlue,
          ), // Viền xanh khi bấm vào
        ),
      ),
    );
  }
}
