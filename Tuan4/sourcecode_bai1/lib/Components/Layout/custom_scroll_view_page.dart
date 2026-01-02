// lib/pages/basic/text_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class CustomScrollViewPage extends StatelessWidget {
  const CustomScrollViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'CustomScrollView Widget',
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
                'CustomScrollView là một widget trong Flutter cho phép bạn tạo các hiệu ứng cuộn phức tạp bằng cách kết hợp nhiều loại sliver widgets khác nhau như SliverList, SliverGrid, SliverAppBar, v.v.',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 20),
              Text(
                'Các Sliver widget phổ biến:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                '''• SliverAppBar: AppBar có thể cuộn và thu gọn
• SliverList: Danh sách có thể cuộn
• SliverGrid: Lưới có thể cuộn
• SliverToBoxAdapter: Wrap widget thông thường
• SliverPadding: Thêm padding cho sliver''',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 20),
              Text(
                'Ví dụ về CustomScrollView với SliverAppBar và SliverList:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              HighlightView(
                '''CustomScrollView(
  slivers: <Widget>[
    SliverAppBar(
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text('SliverAppBar'),
        background: Image.network(
          'https://picsum.photos/200',
          fit: BoxFit.cover,
        ),
      ),
    ),
    SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => ListTile(
          title: Text('Item \$index'),
        ),
        childCount: 20,
      ),
    ),
  ],
)''',
                language: 'dart',
                theme: githubTheme,
                padding: EdgeInsets.all(12),
                textStyle: GoogleFonts.jetBrainsMono(fontSize: 13),
              ),
              SizedBox(height: 20),
              Text(
                'Ví dụ đơn giản với SliverToBoxAdapter:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              HighlightView(
                '''CustomScrollView(
  slivers: [
    SliverToBoxAdapter(
      child: Container(
        height: 100,
        color: Colors.blue,
        child: Center(
          child: Text('Header'),
        ),
      ),
    ),
    SliverList(
      delegate: SliverChildListDelegate([
        ListTile(title: Text('Item 1')),
        ListTile(title: Text('Item 2')),
        ListTile(title: Text('Item 3')),
      ]),
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
                height: 300,
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(
                        height: 100,
                        color: Colors.blue,
                        child: Center(
                          child: Text(
                            'Header',
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate([
                        ListTile(title: Text('Item 1')),
                        ListTile(title: Text('Item 2')),
                        ListTile(title: Text('Item 3')),
                        ListTile(title: Text('Item 4')),
                        ListTile(title: Text('Item 5')),
                      ]),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'CustomScrollView rất hữu ích khi bạn cần tạo các layout phức tạp với nhiều phần có thể cuộn khác nhau, như kết hợp header có thể thu gọn với danh sách hoặc lưới.',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
