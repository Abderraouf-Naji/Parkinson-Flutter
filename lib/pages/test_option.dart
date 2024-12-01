import 'package:flutter/material.dart';
import 'drawing_page.dart';

class TestOption extends StatelessWidget {
  final String imagePath;
  final String testName;

  const TestOption(
      {super.key, required this.imagePath, required this.testName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DrawingPage(
                testName: testName,
                testImagePath: imagePath,
              ),
            ));
      },
      child: Card(
        child: Column(
          children: [
            Image.asset(imagePath),
            Text(testName),
          ],
        ),
      ),
    );
  }
}
