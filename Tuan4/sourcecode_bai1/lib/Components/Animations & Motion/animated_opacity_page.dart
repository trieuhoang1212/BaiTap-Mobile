// lib/pages/basic/text_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class AnimatedOpacityPage extends StatefulWidget {
  const AnimatedOpacityPage({super.key});

  @override
  State<AnimatedOpacityPage> createState() => _AnimatedOpacityPageState();
}

class _AnimatedOpacityPageState extends State<AnimatedOpacityPage> {
  double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'AnimatedOpacity Widget',
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
                'AnimatedOpacity là widget tạo hiệu ứng fade in/fade out bằng cách thay đổi độ trong suốt (opacity) của widget con. Widget này rất hữu ích khi bạn muốn làm mờ hoặc hiện widget một cách mượt mà.',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 20),
              Text(
                'Các thuộc tính quan trọng:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                '''• opacity: Giá trị từ 0.0 (trong suốt) đến 1.0 (đục)
• duration: Thời gian animation
• curve: Đường cong animation
• child: Widget con cần animate''',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 20),
              Text(
                'Ví dụ về AnimatedOpacity:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              HighlightView(
                '''double _opacity = 1.0;

AnimatedOpacity(
  opacity: _opacity,
  duration: Duration(seconds: 1),
  child: Container(
    width: 200,
    height: 200,
    color: Colors.blue,
    child: Center(
      child: Text(
        'Fade Me',
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
              Center(
                child: AnimatedOpacity(
                  opacity: _opacity,
                  duration: Duration(seconds: 1),
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Fade Me',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _opacity = 0.0;
                        });
                      },
                      child: Text('Fade Out'),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _opacity = 1.0;
                        });
                      },
                      child: Text('Fade In'),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _opacity = 0.5;
                        });
                      },
                      child: Text('Half Opacity'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Ví dụ với Slider để điều chỉnh opacity:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                'Opacity: ${_opacity.toStringAsFixed(2)}',
                style: GoogleFonts.tienne(fontSize: 16, color: Colors.black),
              ),
              Slider(
                value: _opacity,
                min: 0.0,
                max: 1.0,
                divisions: 10,
                label: _opacity.toStringAsFixed(1),
                onChanged: (value) {
                  setState(() {
                    _opacity = value;
                  });
                },
              ),
              SizedBox(height: 20),
              Text(
                'Use cases:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                '''• Fade in/out khi load trang
• Hiện/ẩn thông báo
• Tạo hiệu ứng chuyển cảnh
• Làm mờ background khi hiện dialog
• Loading placeholder transitions''',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
