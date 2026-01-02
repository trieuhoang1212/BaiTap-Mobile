// lib/pages/basic/text_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class TextButtonPage extends StatelessWidget {
  const TextButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'TextButton Widget',
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
                'TextButton là một widget button trong Flutter hiển thị văn bản dạng phẳng (flat), thường được sử dụng cho các hành động ít quan trọng hoặc trong toolbar, dialog.',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 20),
              Text(
                'Các loại button trong Flutter:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                '''• TextButton: Button dạng text phẳng
• ElevatedButton: Button có bóng đổ, nổi bật
• OutlinedButton: Button có viền outline
• IconButton: Button chỉ hiển thị icon''',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 20),
              Text(
                'Ví dụ về TextButton cơ bản:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              HighlightView(
                '''TextButton(
  onPressed: () {
    print('TextButton pressed');
  },
  child: Text('Click Me'),
)''',
                language: 'dart',
                theme: githubTheme,
                padding: EdgeInsets.all(12),
                textStyle: GoogleFonts.jetBrainsMono(fontSize: 13),
              ),
              SizedBox(height: 20),
              Text('Kết quả hiển thị:'),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                },
                child: Text('Click Me'),
              ),
              SizedBox(height: 20),
              Text(
                'Ví dụ về TextButton với style tùy chỉnh:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              HighlightView(
                '''TextButton(
  onPressed: () {},
  style: TextButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: Colors.blue,
    padding: EdgeInsets.symmetric(
      horizontal: 30,
      vertical: 15,
    ),
    textStyle: TextStyle(fontSize: 18),
  ),
  child: Text('Custom Button'),
)''',
                language: 'dart',
                theme: githubTheme,
                padding: EdgeInsets.all(12),
                textStyle: GoogleFonts.jetBrainsMono(fontSize: 13),
              ),
              SizedBox(height: 20),
              Text('Kết quả hiển thị:'),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text('Custom Button'),
              ),
              SizedBox(height: 20),
              Text(
                'So sánh các loại button:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              TextButton(onPressed: () {}, child: Text('TextButton')),
              SizedBox(height: 10),
              ElevatedButton(onPressed: () {}, child: Text('ElevatedButton')),
              SizedBox(height: 10),
              OutlinedButton(onPressed: () {}, child: Text('OutlinedButton')),
              SizedBox(height: 10),
              IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
              SizedBox(height: 20),
              Text(
                'TextButton thường được sử dụng trong Dialog, AppBar, hoặc các nơi cần button nhẹ nhàng không quá nổi bật.',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
