// lib/pages/basic/text_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class SafeAreaPage extends StatelessWidget {
  const SafeAreaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'SafeArea Widget',
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
                'SafeArea là một widget trong Flutter giúp đảm bảo rằng nội dung của ứng dụng không bị che khuất bởi các phần cứng của thiết bị như camera, notch, thanh trạng thái, hoặc các nút điều hướng.',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 20),
              Text(
                'Các thuộc tính của SafeArea:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                '''• left: Tránh vùng bên trái (mặc định: true)
• top: Tránh vùng trên cùng (mặc định: true)
• right: Tránh vùng bên phải (mặc định: true)
• bottom: Tránh vùng dưới cùng (mặc định: true)
• minimum: Padding tối thiểu''',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 20),
              Text(
                'Ví dụ cơ bản về SafeArea:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              HighlightView(
                '''SafeArea(
  child: Container(
    color: Colors.blue,
    child: Center(
      child: Text(
        'Nội dung an toàn',
        style: TextStyle(color: Colors.white, fontSize: 24),
      ),
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
              SizedBox(
                height: 150,
                child: SafeArea(
                  child: Container(
                    color: Colors.blue,
                    child: Center(
                      child: Text(
                        'Nội dung an toàn',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Ví dụ với tùy chọn chỉ áp dụng cho top và bottom:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              HighlightView(
                '''SafeArea(
  left: false,
  right: false,
  child: Container(
    color: Colors.green,
    child: Center(
      child: Text(
        'Safe top & bottom only',
        style: TextStyle(color: Colors.white),
      ),
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
              SizedBox(
                height: 150,
                child: SafeArea(
                  left: false,
                  right: false,
                  child: Container(
                    color: Colors.green,
                    child: Center(
                      child: Text(
                        'Safe top & bottom only',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'SafeArea đặc biệt hữu ích khi phát triển ứng dụng cho nhiều loại thiết bị với các kích thước màn hình và notch khác nhau như iPhone X trở lên, hoặc các thiết bị Android hiện đại.',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
