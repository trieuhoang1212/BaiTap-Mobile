import 'package:flutter/material.dart';
import 'new_password_page.dart';

class CodeEmailPage extends StatefulWidget {
  final String email;

  // Constructor bắt buộc phải có email
  const CodeEmailPage({super.key, required this.email});

  @override
  State<CodeEmailPage> createState() => _CodeEmailPageState();
}

class _CodeEmailPageState extends State<CodeEmailPage> {
  // Tạo 4 controller riêng biệt
  final TextEditingController _c1 = TextEditingController();
  final TextEditingController _c2 = TextEditingController();
  final TextEditingController _c3 = TextEditingController();
  final TextEditingController _c4 = TextEditingController();

  @override
  void dispose() {
    _c1.dispose();
    _c2.dispose();
    _c3.dispose();
    _c4.dispose();
    super.dispose();
  }

  String get verificationCode => _c1.text + _c2.text + _c3.text + _c4.text;

  // Widget hỗ trợ tạo ô nhập số
  Widget _buildInput(TextEditingController controller) {
    return Container(
      width: 50,
      height: 50,
      margin: EdgeInsets.all(5),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          counterText: "",
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {
          if (value.isNotEmpty) FocusScope.of(context).nextFocus();
          if (value.isEmpty) FocusScope.of(context).previousFocus();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.blue),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Image(
              image: AssetImage('assets/images/logo_uth.png'),
              width: 150,
              height: 150,
              errorBuilder: (context, error, stackTrace) =>
                  SizedBox(height: 150),
            ),
            Text(
              'Smart Tasks',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 50),
            Text(
              'Check your email',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Enter the code sent to ${widget.email}',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 30),

            // 4 ô nhập mã
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildInput(_c1),
                _buildInput(_c2),
                _buildInput(_c3),
                _buildInput(_c4),
              ],
            ),

            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (verificationCode.length == 4) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewPasswordPage(
                        email: widget.email,
                        verificationCode: verificationCode,
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please enter full 4-digit code")),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Next',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
