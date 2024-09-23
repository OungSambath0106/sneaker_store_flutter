import 'package:flutter/material.dart';

class ScanQrcodeScreen extends StatefulWidget {
  const ScanQrcodeScreen({super.key});

  @override
  State<ScanQrcodeScreen> createState() => _ScanQrcodeScreenState();
}

class _ScanQrcodeScreenState extends State<ScanQrcodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Qrcode'),
      ),
      body: ListView(),
    );
  }
}
