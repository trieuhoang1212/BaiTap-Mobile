// lib/pages/basic/text_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class PaddingPage extends StatelessWidget {
  const PaddingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Padding Widget',
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
                'Trong Flutter, Padding là một widget được sử dụng để tạo ra khoảng trống (khoảng đệm) xung quanh một widget con (child) của nó. Điều này giúp bạn kiểm soát khoảng cách giữa widget con và các widget khác trong giao diện người dùng.',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 20),
              Text(
                'Ví dụ về cách sử dụng `Padding` kết hợp với `Card` widget, thụt lề vào 16 pixel trong Flutter:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              HighlightView(
                '''const Card(
  child: Padding(
    padding: EdgeInsets.all(16.0),
    child: Text('Hello World!'),
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
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0), // Cách đều 4 cạnh 16 đơn vị
                  child: Text('Hello Flutter!'),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Trong ví dụ trên, chúng ta tạo một `Card` với một widget `Padding` bên trong, widget `Padding` này có khoảng đệm đều 16 pixel xung quanh widget con là `Text`.Điều này giúp cho việc hiển thị văn bản "Hello Flutter!" không bị dính sát vào các cạnh của thẻ (Card), tạo nên một giao diện đẹp mắt và dễ nhìn hơn.',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                'Trong Flutter, nhiều widget (như Text, Image) không có thuộc tính padding sẵn bên trong. Do đó, để tạo khoảng cách cho chúng, bạn buộc phải bao bọc chúng bằng widget Padding.',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
