import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      title: 'UI COMPONENT FLUTTER',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 0, 0, 0),
        ),
        useMaterial3: true,
      ),
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
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            Text(
              'UI COMPONENT FLUTTER',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontSize: 24,

                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 30),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '📌 Basic',
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromARGB(255, 0, 6, 37),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  child: Column(
                    children: [
                      SizedBox(
                        width: 360,
                        height: 85,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.all(10),
                            side: const BorderSide(
                              color: Color.fromARGB(255, 203, 203, 203),
                              width: 2,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '📖 Text',
                                style: GoogleFonts.mavenPro(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  color: const Color.fromARGB(255, 12, 0, 0),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                ' Hiển thị thông tin bằng cách sử dụng văn bản đơn giản.',
                                style: GoogleFonts.tienne(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 360,
                        height: 85,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.all(10),
                            side: const BorderSide(
                              color: Color.fromARGB(255, 203, 203, 203),
                              width: 2,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '📖 Padding',
                                style: GoogleFonts.mavenPro(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: const Color.fromARGB(255, 12, 0, 0),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Hiển thị khoảng cách bên trong giữa các phần tử con.',
                                style: GoogleFonts.tienne(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 360,
                        height: 90,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.all(10),
                            side: const BorderSide(
                              color: Color.fromARGB(255, 203, 203, 203),
                              width: 2,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '📖 Row & Column',
                                style: GoogleFonts.mavenPro(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: const Color.fromARGB(255, 12, 0, 0),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Hiển thị children theo chiều dọc hoặc ngang.',
                                style: GoogleFonts.tienne(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
