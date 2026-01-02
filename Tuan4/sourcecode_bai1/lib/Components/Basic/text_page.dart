// lib/pages/basic/text_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class TextPage extends StatelessWidget {
  const TextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Text Widget',
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
                'Class `Text` trong Flutter là một trong những widget cơ bản và quan trọng nhất, dùng để hiển thị một chuỗi ký tự trên giao diện người dùng.',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 20),
              Text(
                'Ví dụ về cách sử dụng `Text` widget trong Flutter:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              HighlightView(
                '''Container(
  width: 100,
  decoration: BoxDecoration(border: Border.all()),
  child: const Text(
    'Hello, how are you?',
    overflow: TextOverflow.ellipsis,
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
              Container(
                width: 100,
                decoration: BoxDecoration(border: Border.all()),
                child: const Text(
                  'Hello, how are you?',
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 100,
                decoration: BoxDecoration(border: Border.all()),
                child: const Text(
                  'Hello, how are you?',
                  overflow: TextOverflow.fade,
                  softWrap: false,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Trong ví dụ trên, chúng ta tạo một `Container` với chiều rộng cố định là 100 pixel và sử dụng `Text` widget để hiển thị chuỗi "Hello, how are you?". Thuộc tính `overflow: TextOverflow.ellipsis` được sử dụng để cắt bớt văn bản nếu nó vượt quá chiều rộng của container và hiển thị dấu ba chấm (...) ở cuối. Ngoài ra, thuộc tính `softWrap: false` cho phép văn bản tự động xuống dòng nếu cần thiết.',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                'Ngoài ra thì bạn sử dụng `Text.rich` để hiển thị nhiều kiểu văn bản khác nhau trong cùng một widget.',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              HighlightView(
                '''const Text.rich(
  TextSpan(
    text: 'Hello', // default text style
    children: <TextSpan>[
      TextSpan(text: ' beautiful ', style: TextStyle(fontStyle: FontStyle.italic)),
      TextSpan(text: 'world', style: TextStyle(fontWeight: FontWeight.bold)),
    ],
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
              const Text.rich(
                TextSpan(
                  text: 'Hello', // default text style
                  children: <TextSpan>[
                    TextSpan(
                      text: ' beautiful ',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    TextSpan(
                      text: 'world',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
