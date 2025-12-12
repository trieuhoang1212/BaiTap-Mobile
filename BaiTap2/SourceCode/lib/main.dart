import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Thực hành 02',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const NumberList(),
    );
  }
}

class NumberList extends StatefulWidget {
  const NumberList({super.key});

  @override
  State<NumberList> createState() => _NumberListState();
}

class _NumberListState extends State<NumberList> {
  final TextEditingController controller = TextEditingController();
  List<int> numberList = [];

  void createList() {
    FocusScope.of(context).unfocus();
    final input = controller.text.trim();
    final number = int.tryParse(input);

    if (number == null || number <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng nhập số nguyên dương hợp lệ!'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    setState(() {
      numberList = List.generate(number, (index) => index + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'THỰC HÀNH SỐ 2',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Căn giữa row
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.left, // Căn giữa chữ khi nhập
                      decoration: const InputDecoration(
                        hintText: 'Nhập vào số lượng',
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 15,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      style: TextStyle(
                        fontSize: 12,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: createList,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 18,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Tạo',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // 3. Thay Expanded bằng Flexible để danh sách không chiếm hết màn hình
              // Nếu danh sách ngắn, nó nằm giữa. Nếu dài, nó tự cuộn.
              Flexible(
                child: ListView.builder(
                  // 4. Quan trọng: shrinkWrap giúp list co lại vừa đúng số phần tử
                  shrinkWrap: true,
                  itemCount: numberList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Center(
                        // Căn giữa nút bấm
                        child: SizedBox(
                          width: double
                              .infinity, // Nút bấm kéo dài bằng ô nhập liệu
                          child: ElevatedButton(
                            onPressed: () {
                              print('Đã chọn số ${numberList[index]}');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFE74C3C),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 15),
                            ),
                            child: Text(
                              '${numberList[index]}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
