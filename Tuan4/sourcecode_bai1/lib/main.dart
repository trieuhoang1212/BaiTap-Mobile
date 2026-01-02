import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// Components/Basic
import 'Components/Basic/text_page.dart';
import 'Components/Basic/row_column_page.dart';
import 'Components/Basic/padding_page.dart';
import 'Components/Basic/constrained_box_page.dart';
// Components/Layout Widgets
import 'Components/Layout/custom_scroll_view_page.dart';
import 'Components/Layout/safe_area_page.dart';
import 'Components/Layout/list_view_page.dart';
// Components/Buttons & Inputs
import 'Components/Buttons & Inputs/check_box_page.dart';
import 'Components/Buttons & Inputs/silder_page.dart';
import 'Components/Buttons & Inputs/text_button_page.dart';
import 'Components/Buttons & Inputs/text_field_page.dart';
// Components/Animations & Motion
import 'Components/Animations & Motion/animated_contrainer_page.dart';
import 'Components/Animations & Motion/animated_list_page.dart';
import 'Components/Animations & Motion/animated_opacity_page.dart';
import 'Components/Animations & Motion/scale_transition_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 80),
            _buildHeader(),
            const SizedBox(height: 50),
            _buildSection(
              title: '📌 Basic',
              items: [
                (
                  '📖 Text',
                  'Hiển thị thông tin bằng cách sử dụng văn bản đơn giản.',
                  const TextPage(),
                ),
                (
                  '📖 Padding',
                  'Hiển thị khoảng cách bên trong giữa các phần tử con.',
                  const PaddingPage(),
                ),
                (
                  '📖 Row & Column',
                  'Hiển thị children theo chiều dọc hoặc ngang.',
                  const RowColumnPage(),
                ),
                (
                  '📖 ConstrainedBox',
                  'Giới hạn kích thước của child.',
                  const ConstrainedBoxPage(),
                ),
              ],
            ),
            const SizedBox(height: 30),
            _buildSection(
              title: '📌 Layout Widgets',
              items: [
                (
                  '📖 ListView',
                  'Hiển thị danh sách các phần tử cuộn được.',
                  const ListViewPage(),
                ),
                (
                  '📖 CustomScrollView',
                  'Tùy chọn cuộn linh hoạt với nhiều loại phần tử con.',
                  const CustomScrollViewPage(),
                ),
                (
                  '📖 SafeArea',
                  'Tạo ra vùng an toàn tránh các khu vực không mong muốn.',
                  const SafeAreaPage(),
                ),
              ],
            ),
            const SizedBox(height: 30),
            _buildSection(
              title: '📌 Buttons & Inputs',
              items: [
                (
                  '📖 TextButton',
                  'Nút bấm để thực hiện hành động.',
                  const TextButtonPage(),
                ),
                (
                  '📖 Checkbox',
                  'Nút chọn để bật hoặc tắt một tùy chọn.',
                  const CheckBoxPage(),
                ),
                (
                  '📖 TextField',
                  'Văn bản để nhập dữ liệu.',
                  const TextFieldPage(),
                ),
                ('📖 Slider', 'Nút trượt để chọn giá trị.', const SliderPage()),
              ],
            ),
            const SizedBox(height: 30),
            _buildSection(
              title: '📌 Animations & Motion',
              items: [
                (
                  '📖 AnimatedContainer',
                  'Hiệu ứng chuyển đổi kích thước, màu sắc, và vị trí.',
                  const AnimatedContrainerPage(),
                ),
                (
                  '📖 AnimatedOpacity',
                  'Hiệu ứng chuyển đổi độ mờ.',
                  const AnimatedOpacityPage(),
                ),
                (
                  '📖 ScaleTransition',
                  'Hiệu ứng chuyển đổi kích thước.',
                  const ScaleTransitionPage(),
                ),
                (
                  '📖 AnimatedList',
                  'Hiệu ứng danh sách động.',
                  const AnimatedListPage(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 20, 89, 146),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        'UI COMPONENT FLUTTER',
        textAlign: TextAlign.center,
        style: GoogleFonts.mavenPro(
          fontSize: 24,
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<(String, String, Widget)> items,
  }) {
    return Center(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
              color: const Color.fromARGB(225, 32, 105, 165),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              title,
              style: GoogleFonts.mavenPro(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          const SizedBox(height: 10),
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _buildCard(item.$1, item.$2, item.$3),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String title, String description, Widget detailPage) {
    return SizedBox(
      width: 360,
      child: OutlinedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => detailPage),
          );
        },
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(10),
          side: const BorderSide(
            color: Color.fromARGB(99, 25, 64, 109),
            width: 2,
          ),
          overlayColor: Colors.blue.shade100,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.mavenPro(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: const Color.fromARGB(255, 12, 0, 0),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: GoogleFonts.tienne(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
