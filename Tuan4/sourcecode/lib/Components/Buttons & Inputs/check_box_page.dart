import 'package:flutter/material.dart';

class CheckBoxPage extends StatelessWidget {
  const CheckBoxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('CheckBox Example')),
      body: const Center(child: Text('This is the CheckBox Page')),
    );
  }
}
