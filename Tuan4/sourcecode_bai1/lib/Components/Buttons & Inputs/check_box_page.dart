// lib/pages/basic/text_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class CheckBoxPage extends StatefulWidget {
  const CheckBoxPage({super.key});

  @override
  State<CheckBoxPage> createState() => _CheckBoxPageState();
}

class _CheckBoxPageState extends State<CheckBoxPage> {
  bool isChecked = false;
  bool option1 = false;
  bool option2 = true;
  bool option3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'CheckBox Widget',
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
                'Checkbox là widget cho phép người dùng chọn hoặc bỏ chọn một tùy chọn. Checkbox có hai trạng thái: checked (đã chọn) và unchecked (chưa chọn).',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 20),
              Text(
                'Các thuộc tính quan trọng:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                '''• value: Giá trị boolean (true/false)
• onChanged: Callback khi trạng thái thay đổi
• activeColor: Màu khi được chọn
• checkColor: Màu của dấu check
• tristate: Cho phép 3 trạng thái (true, false, null)''',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 20),
              Text(
                'Ví dụ về Checkbox cơ bản:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              HighlightView(
                '''bool isChecked = false;

Checkbox(
  value: isChecked,
  onChanged: (bool? value) {
    setState(() {
      isChecked = value!;
    });
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
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  Text('Agree to terms and conditions'),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Ví dụ với CheckboxListTile (dễ sử dụng hơn):',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              HighlightView(
                '''CheckboxListTile(
  title: Text('Option 1'),
  value: option1,
  onChanged: (bool? value) {
    setState(() {
      option1 = value!;
    });
  },
  secondary: Icon(Icons.star),
)''',
                language: 'dart',
                theme: githubTheme,
                padding: EdgeInsets.all(12),
                textStyle: GoogleFonts.jetBrainsMono(fontSize: 13),
              ),
              SizedBox(height: 20),
              Text('Kết quả hiển thị:'),
              SizedBox(height: 10),
              CheckboxListTile(
                title: Text('Enable notifications'),
                subtitle: Text('Receive updates about your account'),
                value: option1,
                onChanged: (bool? value) {
                  setState(() {
                    option1 = value!;
                  });
                },
                secondary: Icon(Icons.notifications),
              ),
              CheckboxListTile(
                title: Text('Dark mode'),
                subtitle: Text('Use dark theme'),
                value: option2,
                onChanged: (bool? value) {
                  setState(() {
                    option2 = value!;
                  });
                },
                secondary: Icon(Icons.dark_mode),
              ),
              CheckboxListTile(
                title: Text('Auto-save'),
                subtitle: Text('Automatically save your work'),
                value: option3,
                onChanged: (bool? value) {
                  setState(() {
                    option3 = value!;
                  });
                },
                secondary: Icon(Icons.save),
              ),
              SizedBox(height: 20),
              Text(
                'Checkbox với tùy chỉnh màu sắc:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (value) {},
                    activeColor: Colors.green,
                    checkColor: Colors.white,
                  ),
                  Text('Green checkbox'),
                  SizedBox(width: 20),
                  Checkbox(
                    value: true,
                    onChanged: (value) {},
                    activeColor: Colors.red,
                    checkColor: Colors.white,
                  ),
                  Text('Red checkbox'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
