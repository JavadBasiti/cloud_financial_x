import 'package:flutter/material.dart';

class AccountStructureScreen extends StatelessWidget {
  const AccountStructureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        title: const Column(
          children: [
            Text('ساختار حساب‌ها', style: TextStyle(fontSize: 14)),
            Text('Account Structure', style: TextStyle(fontSize: 10)),
          ],
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF7C3AED),
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text('صفحه ساختار حساب‌ها', style: TextStyle(fontSize: 12)),
      ),
    );
  }
}
