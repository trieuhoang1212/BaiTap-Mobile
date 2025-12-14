import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

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
      home: const CalculatePage(),
    );
  }
}

class CalculatePage extends StatefulWidget {
  const CalculatePage({super.key});
  final String title = 'THỰC HÀNH 03';
  @override
  State<CalculatePage> createState() => _CalculatePage();
}

class _CalculatePage extends State<CalculatePage> {
  final TextEditingController _controllerA = TextEditingController();
  final TextEditingController _controllerB = TextEditingController();
  String _result = '';

  void _calculate(String operator) {
    double? a = double.tryParse(_controllerA.text);
    double? b = double.tryParse(_controllerB.text);
    if (a == null || b == null) {
      setState(() {
        _result = 'Không hợp lệ';
      });
      return;
    }
    double res;
    switch (operator) {
      case '+':
        res = a + b;
        break;
      case '-':
        res = a - b;
        break;
      case '*':
        res = a * b;
        break;
      case '/':
        if (b == 0) {
          setState(() {
            _result = 'Không thể chia cho 0';
          });
          return;
        }
        res = a / b;
        break;
      default:
        res = 0;
    }
    setState(() {
      _result = res.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 0, 60, 109),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: _controllerA,
                textAlign: TextAlign.left,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Nhập giá trị A ',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 12,
                  ),
                ),
                style: TextStyle(
                  fontSize: 12,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(
                      const Color.fromARGB(255, 0, 131, 239),
                    ),
                    foregroundColor: WidgetStatePropertyAll<Color>(
                      Colors.white,
                    ),
                  ),
                  onPressed: () => _calculate('+'),
                  child: const Text('+'),
                ),

                const SizedBox(width: 10),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(
                      const Color.fromARGB(255, 182, 0, 0),
                    ),
                    foregroundColor: WidgetStatePropertyAll<Color>(
                      Colors.white,
                    ),
                  ),
                  onPressed: () => _calculate('-'),
                  child: const Text('-'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(
                      const Color.fromARGB(255, 58, 137, 1),
                    ),
                    foregroundColor: WidgetStatePropertyAll<Color>(
                      Colors.white,
                    ),
                  ),
                  onPressed: () => _calculate('*'),
                  child: const Text('*'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _calculate('/'),
                  child: const Text('/'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                controller: _controllerB,
                textAlign: TextAlign.left,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Nhập giá trị B',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 12,
                  ),
                ),
                style: TextStyle(
                  fontSize: 12,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Kết quả: $_result',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 0, 21, 103),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
