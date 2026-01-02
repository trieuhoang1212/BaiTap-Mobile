// lib/pages/basic/text_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class AnimatedContrainerPage extends StatefulWidget {
  const AnimatedContrainerPage({super.key});

  @override
  State<AnimatedContrainerPage> createState() => _AnimatedContrainerPageState();
}

class _AnimatedContrainerPageState extends State<AnimatedContrainerPage> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'AnimatedContainer Widget',
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
                'AnimatedContainer là phiên bản có animation của Container. Khi các thuộc tính của nó thay đổi (như width, height, color, padding, v.v.), nó sẽ tự động tạo animation mượt mà giữa giá trị cũ và mới.',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 20),
              Text(
                'Các thuộc tính có thể animate:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                '''• width, height: Kích thước
• color: Màu nền
• padding, margin: Khoảng cách
• alignment: Căn chỉnh
• decoration: BoxDecoration
• duration: Thời gian animation''',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 20),
              Text(
                'Ví dụ về AnimatedContainer:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              HighlightView(
                '''bool _isExpanded = false;

AnimatedContainer(
  duration: Duration(seconds: 1),
  width: _isExpanded ? 200 : 100,
  height: _isExpanded ? 200 : 100,
  color: _isExpanded ? Colors.blue : Colors.red,
  curve: Curves.easeInOut,
  child: Center(
    child: Text('Tap me'),
  ),
)''',
                language: 'dart',
                theme: githubTheme,
                padding: EdgeInsets.all(12),
                textStyle: GoogleFonts.jetBrainsMono(fontSize: 13),
              ),
              SizedBox(height: 20),
              Text('Kết quả hiển thị (tap để xem animation):'),
              SizedBox(height: 10),
              Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    width: _isExpanded ? 200 : 100,
                    height: _isExpanded ? 200 : 100,
                    decoration: BoxDecoration(
                      color: _isExpanded ? Colors.blue : Colors.red,
                      borderRadius: BorderRadius.circular(
                        _isExpanded ? 100 : 10,
                      ),
                    ),
                    curve: Curves.easeInOut,
                    child: Center(
                      child: Text(
                        _isExpanded ? 'Expanded' : 'Tap me',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Ví dụ với alignment animation:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  alignment: _isExpanded
                      ? Alignment.bottomRight
                      : Alignment.topLeft,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                child: Text('Toggle Animation'),
              ),
              SizedBox(height: 20),
              Text(
                'Các loại Curve phổ biến:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                '''• Curves.linear: Tốc độ đều
• Curves.easeIn: Bắt đầu chậm
• Curves.easeOut: Kết thúc chậm
• Curves.easeInOut: Chậm ở đầu và cuối
• Curves.bounceIn: Hiệu ứng nảy
• Curves.elasticOut: Hiệu ứng đàn hồi''',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
