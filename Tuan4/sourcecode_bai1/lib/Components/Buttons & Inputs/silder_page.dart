// lib/pages/basic/text_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _currentValue = 50;
  double _volumeValue = 30;
  RangeValues _rangeValues = RangeValues(20, 80);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Slider Widget',
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
                'Slider là widget cho phép người dùng chọn một giá trị từ một phạm vi liên tục bằng cách kéo thanh trượt. Thường được sử dụng cho âm lượng, độ sáng, hoặc bất kỳ giá trị số nào.',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 20),
              Text(
                'Các thuộc tính quan trọng:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                '''• value: Giá trị hiện tại của slider
• min: Giá trị tối thiểu
• max: Giá trị tối đa
• divisions: Số bước chia (nếu muốn giá trị rời rạc)
• onChanged: Callback khi giá trị thay đổi
• activeColor: Màu phần active
• inactiveColor: Màu phần inactive''',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 20),
              Text(
                'Ví dụ về Slider cơ bản:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              HighlightView(
                '''double _currentValue = 50;

Slider(
  value: _currentValue,
  min: 0,
  max: 100,
  onChanged: (double value) {
    setState(() {
      _currentValue = value;
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
              Text(
                'Value: ${_currentValue.toStringAsFixed(1)}',
                style: GoogleFonts.tienne(fontSize: 16, color: Colors.black),
              ),
              Slider(
                value: _currentValue,
                min: 0,
                max: 100,
                onChanged: (double value) {
                  setState(() {
                    _currentValue = value;
                  });
                },
              ),
              SizedBox(height: 20),
              Text(
                'Ví dụ Slider với divisions (giá trị rời rạc):',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              HighlightView(
                '''Slider(
  value: _volumeValue,
  min: 0,
  max: 100,
  divisions: 10,
  label: _volumeValue.round().toString(),
  onChanged: (double value) {
    setState(() {
      _volumeValue = value;
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
                  Icon(Icons.volume_down),
                  Expanded(
                    child: Slider(
                      value: _volumeValue,
                      min: 0,
                      max: 100,
                      divisions: 10,
                      label: _volumeValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _volumeValue = value;
                        });
                      },
                    ),
                  ),
                  Icon(Icons.volume_up),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'RangeSlider - Chọn khoảng giá trị:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              HighlightView(
                '''RangeValues _rangeValues = RangeValues(20, 80);

RangeSlider(
  values: _rangeValues,
  min: 0,
  max: 100,
  divisions: 20,
  labels: RangeLabels(
    _rangeValues.start.round().toString(),
    _rangeValues.end.round().toString(),
  ),
  onChanged: (RangeValues values) {
    setState(() {
      _rangeValues = values;
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
              Text(
                'Range: ${_rangeValues.start.round()} - ${_rangeValues.end.round()}',
                style: GoogleFonts.tienne(fontSize: 16, color: Colors.black),
              ),
              RangeSlider(
                values: _rangeValues,
                min: 0,
                max: 100,
                divisions: 20,
                labels: RangeLabels(
                  _rangeValues.start.round().toString(),
                  _rangeValues.end.round().toString(),
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _rangeValues = values;
                  });
                },
              ),
              SizedBox(height: 20),
              Text(
                'Slider với màu tùy chỉnh:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              Slider(
                value: 70,
                min: 0,
                max: 100,
                activeColor: Colors.green,
                inactiveColor: Colors.grey[300],
                onChanged: (value) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
