// lib/pages/basic/text_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class RowColumnPage extends StatelessWidget {
  const RowColumnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Row and Column Widgets',
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
                'Class `Row` và `Column` trong Flutter là hai trong những widget cơ bản và quan trọng nhất, dùng để bố trí các widget con theo hàng ngang hoặc cột dọc trên giao diện người dùng.',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text(
                '''1. Row (Hàng ngang)
  Row sắp xếp các widget con (children) theo một hàng ngang từ trái sang phải (hoặc ngược lại tùy vào hướng ngôn ngữ).
  Trục chính (Main Axis): Ngang.
  Trục phụ (Cross Axis): Dọc.''',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 20),
              Text(
                '''2. Column (Cột dọc)
  Column sắp xếp các widget con (children) theo một cột dọc từ trên xuống dưới.
  Trục chính (Main Axis): Dọc.
  Trục phụ (Cross Axis): Ngang.''',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 20),
              Text(
                'Ví dụ về cách sử dụng `Row` và `Column` widget trong Flutter:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 20),
              Text(
                '1. Ví dụ về Row:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              HighlightView(
                '''const Row(
  children: <Widget>[
    Expanded(
      child: Text('Deliver features faster', textAlign: TextAlign.center),
    ),
    Expanded(
      child: Text('Craft beautiful UIs', textAlign: TextAlign.center),
    ),
    Expanded(
      child: FittedBox(
        child: FlutterLogo(),
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
              Text('Kết quả hiển thị:'),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Deliver features faster',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Craft beautiful UIs',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(child: FittedBox(child: FlutterLogo())),
                ],
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
                'Lỗi khi sử dụng Row là khi nội dụng quá dài sẽ gây ra lỗi viền tràn (overflow). Để khắc phục lỗi này, bạn có thể sử dụng widget `Expanded` hoặc `Flexible` để cho phép các widget con trong Row co giãn và chiếm không gian một cách linh hoạt.',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 50),
              const Row(
                children: <Widget>[
                  FlutterLogo(),
                  Text(
                    "Flutter's hot reload helps you quickly and easily experiment, build UIs, add features, and fix bug faster. Experience sub-second reload times, without losing state, on emulators, simulators, and hardware for iOS and Android.",
                  ),
                  Icon(Icons.sentiment_very_satisfied),
                ],
              ),
              SizedBox(height: 50),
              HighlightView(
                '''const Row(
  children: <Widget>[
    FlutterLogo(),
    Expanded( // Sử dụng Expanded để tránh lỗi overflow
      child: Text("Flutter's hot reload helps you quickly and easily experiment, build UIs, add features, and fix bug faster. Experience sub-second reload times, without losing state, on emulators, simulators, and hardware for iOS and Android."),
    ),
    Icon(Icons.sentiment_very_satisfied),
  ],
)''',
                language: 'dart',
                theme: githubTheme,
                padding: EdgeInsets.all(12),
                textStyle: GoogleFonts.jetBrainsMono(fontSize: 13),
              ),
              SizedBox(height: 20),
              Text(
                'Kết quả hiển thị:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              const Row(
                children: <Widget>[
                  FlutterLogo(),
                  Expanded(
                    child: Text(
                      "Flutter's hot reload helps you quickly and easily experiment, build UIs, add features, and fix bug faster. Experience sub-second reload times, without losing state, on emulators, simulators, and hardware for iOS and Android.",
                    ),
                  ),
                  Icon(Icons.sentiment_very_satisfied),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Ngoài ra còn có `textDirection: TextDirection.rtl,` dùng để thay đổi hướng văn bản từ phải sang trái:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 20),
              const Row(
                textDirection: TextDirection.rtl,
                children: <Widget>[
                  FlutterLogo(),
                  Expanded(
                    child: Text(
                      "Flutter's hot reload helps you quickly and easily experiment, build UIs, add features, and fix bug faster. Experience sub-second reload times, without losing state, on emulators, simulators, and hardware for iOS and Android.",
                    ),
                  ),
                  Icon(Icons.sentiment_very_satisfied),
                ],
              ),
              SizedBox(height: 20),
              Text(
                '2. Ví dụ về Column:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              HighlightView(
                '''const Column(
  children: <Widget>[
    Text('Deliver features faster'),
    Text('Craft beautiful UIs'),
    Expanded(
      child: FittedBox(
        child: FlutterLogo(),
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
                'Kết quả hiển thị:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 200,
                child: Column(
                  children: <Widget>[
                    Text('Deliver features faster'),
                    Text('Craft beautiful UIs'),
                    Expanded(child: FittedBox(child: FlutterLogo())),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Ví dụ trên minh họa `Column` với ba widget con được sắp xếp theo cột dọc. Widget `FlutterLogo` được bao bọc trong `Expanded` và `FittedBox` để nó có thể mở rộng và điều chỉnh kích thước phù hợp với không gian còn lại trong cột. Ngoài ra còn có thể sử dụng thuộc tính `mainAxisAlignment` và `crossAxisAlignment` để điều chỉnh cách căn chỉnh các widget con trong `Column` theo trục chính và trục phụ.',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              SizedBox(height: 20),
              Text(
                'Kết quả hiển thị:',
                style: GoogleFonts.tienne(fontSize: 13, color: Colors.black),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text('We move under cover and we move as one'),
                  const Text(
                    'Through the night, we have one shot to live another day',
                  ),
                  const Text('We cannot let a stray gunshot give us away'),
                  const Text(
                    'We will fight up close, seize the moment and stay in it',
                  ),
                  const Text(
                    "It's either that or meet the business end of a bayonet",
                  ),
                  const Text("The code word is 'Rochambeau,' dig me?"),
                  Text(
                    'Rochambeau!',
                    style: DefaultTextStyle.of(
                      context,
                    ).style.apply(fontSizeFactor: 2.0),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
