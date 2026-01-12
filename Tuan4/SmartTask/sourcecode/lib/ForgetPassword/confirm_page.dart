import 'package:flutter/material.dart';

class ConfirmPage extends StatelessWidget {
  final String email;
  final String verificationCode;
  final String password;

  const ConfirmPage({
    super.key,
    required this.email,
    required this.verificationCode,
    required this.password,
  });

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
              width: 100,
              height: 100,
              errorBuilder: (context, error, stackTrace) =>
                  SizedBox(height: 100),
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
              'Confirm',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'We are here to help you!',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 30),

            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  _buildRow(Icons.email, email),
                  SizedBox(height: 15),
                  _buildRow(Icons.verified_user, verificationCode),
                  SizedBox(height: 15),
                  _buildRow(Icons.lock, "••••••••"),
                ],
              ),
            ),
            SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Password reset successfully!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                  // Quay về màn hình đầu tiên
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey),
        SizedBox(width: 10),
        Expanded(child: Text(text, style: TextStyle(fontSize: 16))),
      ],
    );
  }
}
