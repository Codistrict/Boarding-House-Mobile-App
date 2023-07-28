import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextScannerView extends StatelessWidget {
  const TextScannerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Result"),
      ),
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: Text(Get.parameters['text']!),
      ),
    );
  }
}
