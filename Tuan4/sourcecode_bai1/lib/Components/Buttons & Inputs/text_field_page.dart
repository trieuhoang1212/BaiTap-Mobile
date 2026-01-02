// lib/pages/basic/text_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class TextFieldPage extends StatefulWidget {
  const TextFieldPage({super.key});

  @override
  State<TextFieldPage> createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'TextField Widget',
          style: GoogleFonts.mavenPro(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 48, 103),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                'TextField là widget cho phép người dùng nhập văn bản thông qua bàn phím. Đây là một trong những widget quan trọng nhất trong việc tạo form và nhận input từ người dùng.',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 20),
              Text(
                'Các thuộc tính quan trọng:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                '''• controller: Điều khiển và lấy giá trị text
• decoration: Trang trí TextField (label, hint, border, v.v.)
• keyboardType: Loại bàn phím hiển thị
• obscureText: Ẩn text (dùng cho password)
• maxLines: Số dòng tối đa''',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 20),
              Text(
                'Ví dụ về TextField cơ bản:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              HighlightView(
                '''TextField(
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Username',
    hintText: 'Enter your username',
  ),
)''',
                language: 'dart',
                theme: githubTheme,
                padding: EdgeInsets.all(12),
                textStyle: GoogleFonts.jetBrainsMono(fontSize: 13),
              ),
              SizedBox(height: 20),
              Text('Kết quả hiển thị:'),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                  hintText: 'Enter your username',
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Ví dụ TextField với icon và helper text:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              HighlightView(
                '''TextField(
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Email',
    prefixIcon: Icon(Icons.email),
    suffixIcon: Icon(Icons.check_circle),
    helperText: 'Enter a valid email address',
  ),
  keyboardType: TextInputType.emailAddress,
)''',
                language: 'dart',
                theme: githubTheme,
                padding: EdgeInsets.all(12),
                textStyle: GoogleFonts.jetBrainsMono(fontSize: 13),
              ),
              SizedBox(height: 20),
              Text('Kết quả hiển thị:'),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  suffixIcon: Icon(Icons.check_circle),
                  helperText: 'Enter a valid email address',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20),
              Text(
                'Ví dụ TextField cho password:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              HighlightView(
                '''TextField(
  obscureText: true,
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Password',
    prefixIcon: Icon(Icons.lock),
  ),
)''',
                language: 'dart',
                theme: githubTheme,
                padding: EdgeInsets.all(12),
                textStyle: GoogleFonts.jetBrainsMono(fontSize: 13),
              ),
              SizedBox(height: 20),
              Text('Kết quả hiển thị:'),
              SizedBox(height: 10),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Sử dụng TextEditingController để lấy và kiểm soát giá trị:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Type something',
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Your input'),
                      content: Text(_controller.text),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                },
                child: Text('Show Input'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
