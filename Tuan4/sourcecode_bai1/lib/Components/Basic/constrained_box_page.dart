// lib/pages/basic/text_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class ConstrainedBoxPage extends StatelessWidget {
  const ConstrainedBoxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'ConstrainedBox Widget',
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
                'ConstrainedBox trong Flutter là một widget dùng để áp dụng các ràng buộc (constraints) bổ sung lên widget con của nó. Điều này cho phép bạn kiểm soát kích thước tối thiểu và tối đa của widget con.',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 20),
              Text(
                'Các thuộc tính constraints chính:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                '''• minWidth: Chiều rộng tối thiểu
• maxWidth: Chiều rộng tối đa
• minHeight: Chiều cao tối thiểu
• maxHeight: Chiều cao tối đa''',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 20),
              Text(
                'Ví dụ về cách sử dụng `ConstrainedBox` với chiều rộng tối thiểu:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              HighlightView(
                '''ConstrainedBox(
  constraints: BoxConstraints(
    minWidth: 200,
    minHeight: 100,
  ),
  child: Container(
    color: Colors.blue,
    child: Text('Hello Flutter'),
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
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: 200, minHeight: 100),
                child: Container(
                  color: Colors.blue,
                  child: Text(
                    'Hello Flutter',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Ví dụ với chiều rộng và chiều cao tối đa:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              HighlightView(
                '''ConstrainedBox(
  constraints: BoxConstraints(
    maxWidth: 150,
    maxHeight: 100,
  ),
  child: Container(
    color: Colors.green,
    child: Text(
      'This is a very long text that will be constrained',
      style: TextStyle(color: Colors.white),
    ),
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
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 150, maxHeight: 100),
                child: Container(
                  color: Colors.green,
                  child: Text(
                    'This is a very long text that will be constrained',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'ConstrainedBox rất hữu ích khi bạn muốn đảm bảo rằng widget không nhỏ hơn hoặc lớn hơn một kích thước nhất định, giúp tạo giao diện responsive và nhất quán.',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
