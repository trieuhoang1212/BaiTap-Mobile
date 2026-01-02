// lib/pages/basic/text_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class ScaleTransitionPage extends StatefulWidget {
  const ScaleTransitionPage({super.key});

  @override
  State<ScaleTransitionPage> createState() => _ScaleTransitionPageState();
}

class _ScaleTransitionPageState extends State<ScaleTransitionPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0.5,
      end: 1.5,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'ScaleTransition Widget',
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
                'ScaleTransition là widget tạo hiệu ứng phóng to/thu nhỏ cho widget con. Widget này cần một AnimationController để điều khiển animation và thường được sử dụng trong các hiệu ứng zoom, pulse, hoặc entrance animations.',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 20),
              Text(
                'Các thành phần cần thiết:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                '''• AnimationController: Điều khiển animation
• Animation<double>: Giá trị scale từ 0.0 đến n
• Tween: Định nghĩa range của scale
• Curve: Đường cong animation
• SingleTickerProviderStateMixin: Cung cấp vsync''',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 20),
              Text(
                'Ví dụ về ScaleTransition:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              HighlightView(
                '''class _MyWidgetState extends State<MyWidget> 
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    
    _animation = Tween<double>(
      begin: 0.5, 
      end: 1.5
    ).animate(_controller);
    
    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Container(
        width: 100,
        height: 100,
        color: Colors.blue,
      ),
    );
  }
}''',
                language: 'dart',
                theme: githubTheme,
                padding: EdgeInsets.all(12),
                textStyle: GoogleFonts.jetBrainsMono(fontSize: 13),
              ),
              SizedBox(height: 20),
              Text('Kết quả hiển thị:'),
              SizedBox(height: 10),
              Center(
                child: ScaleTransition(
                  scale: _animation,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.favorite, color: Colors.white, size: 50),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => _controller.forward(),
                    child: Text('Scale Up'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () => _controller.reverse(),
                    child: Text('Scale Down'),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => _controller.repeat(reverse: true),
                    child: Text('Repeat'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () => _controller.stop(),
                    child: Text('Stop'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Các Curve phổ biến cho ScaleTransition:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                '''• Curves.bounceOut: Hiệu ứng nảy
• Curves.elasticOut: Hiệu ứng đàn hồi
• Curves.easeInOut: Mượt mà
• Curves.fastOutSlowIn: Nhanh ra, chậm vào
• Curves.decelerate: Giảm dần''',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 20),
              Text(
                'Use cases:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                '''• Button press animation
• Loading indicators
• Attention grabbers (pulse effect)
• Dialog entrance/exit
• Icon reactions (like, favorite)
• Zoom effects''',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
