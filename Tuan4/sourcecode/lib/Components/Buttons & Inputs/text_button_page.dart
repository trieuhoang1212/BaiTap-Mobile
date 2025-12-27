import 'package:flutter/material.dart';

class TextButtonPage extends StatelessWidget {
  const TextButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('TextButton Example')),
      body: const Center(child: Text('This is the TextButton Page')),
    );
  }
}
