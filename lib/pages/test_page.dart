import 'package:flutter/material.dart';
import 'package:Parkinson/pages/test_option.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choisissez un Test'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          TestOption(
            imagePath: 'assets/images/8.png',
            testName: 'des huits',
          ),
          TestOption(
            imagePath: 'assets/images/eclipse.png',
            testName: 'eclipse',
          ),
          TestOption(
            imagePath: 'assets/images/l.png',
            testName: 'l successive',
          ),
          TestOption(
            imagePath: 'assets/images/lolo.png',
            testName: 'lolo',
          ),
          TestOption(
            imagePath: 'assets/images/spiral.png',
            testName: 'spiral',
          ),
        ],
      ),
    );
  }
}
