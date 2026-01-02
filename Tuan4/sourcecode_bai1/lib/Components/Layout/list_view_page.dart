// lib/pages/basic/text_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'ListView Widget',
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
                'ListView là một widget quan trọng trong Flutter, được sử dụng để hiển thị danh sách các widget con có thể cuộn được. ListView rất hữu ích khi bạn có nhiều phần tử và cần hiển thị chúng trong một danh sách cuộn dọc hoặc ngang.',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 20),
              Text(
                'Các loại ListView:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                '''1. ListView(): Tạo danh sách từ list các widget
2. ListView.builder(): Tạo danh sách động, tối ưu hiệu suất
3. ListView.separated(): Tạo danh sách với separator giữa các item
4. ListView.custom(): Tạo danh sách tùy chỉnh với SliverChildDelegate''',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 20),
              Text(
                'Ví dụ về ListView cơ bản:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              HighlightView(
                '''ListView(
  children: <Widget>[
    ListTile(
      leading: Icon(Icons.map),
      title: Text('Map'),
    ),
    ListTile(
      leading: Icon(Icons.photo),
      title: Text('Album'),
    ),
    ListTile(
      leading: Icon(Icons.phone),
      title: Text('Phone'),
    ),
  ],
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
                height: 200,
                child: ListView(
                  children: <Widget>[
                    ListTile(leading: Icon(Icons.map), title: Text('Map')),
                    ListTile(leading: Icon(Icons.photo), title: Text('Album')),
                    ListTile(leading: Icon(Icons.phone), title: Text('Phone')),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Ví dụ về ListView.builder (tối ưu cho danh sách lớn):',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              HighlightView(
                '''ListView.builder(
  itemCount: 10,
  itemBuilder: (context, index) {
    return ListTile(
      leading: CircleAvatar(
        child: Text('\${index + 1}'),
      ),
      title: Text('Item \${index + 1}'),
      subtitle: Text('Subtitle for item \${index + 1}'),
    );
  },
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
                height: 300,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(child: Text('${index + 1}')),
                      title: Text('Item ${index + 1}'),
                      subtitle: Text('Subtitle for item ${index + 1}'),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Text(
                'ListView.builder chỉ render các item đang hiển thị trên màn hình, giúp tối ưu hiệu suất khi làm việc với danh sách lớn.',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
