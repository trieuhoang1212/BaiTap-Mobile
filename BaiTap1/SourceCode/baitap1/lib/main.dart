import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bài Tập 1',
      theme: ThemeData(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(2), // khoảng cách giữa border và khung avt
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color.fromARGB(255, 89, 0, 0), // Màu viền
                  width: 5, // Độ dày viền
                ),
              ),
              child: CircleAvatar(
                radius: 150,
                backgroundImage: AssetImage('assets/images/avt.png'),
              ),
            ),
            SizedBox(height: 50),
            Text(
              'Nguyễn Hoàng Triều',
              style: TextStyle(
                color: Color.fromARGB(255, 89, 0, 0),
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              'Cần Thơ - Việt Nam',
              style: TextStyle(
                color: Color.fromARGB(255, 36, 0, 0),
                fontSize: 24,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
