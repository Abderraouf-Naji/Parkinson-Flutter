import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:signature/signature.dart';

class DrawingPage extends StatefulWidget {
  final String testName;
  final String testImagePath;

  const DrawingPage(
      {Key? key, required this.testName, required this.testImagePath});

  @override
  DrawingPageState createState() => DrawingPageState();
}

class DrawingPageState extends State<DrawingPage> {
  String? specificResult;
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );
  List<List<Map<String, dynamic>>> drawingsData = [];
  List<List<Map<String, dynamic>>> timedrawingsData = [];

  bool isDrawing = false;
  Timer? drawingTimer;
  int drawingCounter = 0;
  DateTime? startTime;
  late String docId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dessinez ${widget.testName}'),
      ),
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
              ),
              child: Listener(
                onPointerDown: (PointerDownEvent event) {
                  setState(() {
                    isDrawing = true;
                  });
                  _startDrawingTimer();
                },
                onPointerUp: (PointerUpEvent event) {
                  setState(() {
                    isDrawing = false;
                  });
                  _stopDrawingTimer();
                  drawingCounter++;
                },
                child: Column(
                  children: [
                    Image.asset(
                      widget.testImagePath,
                      height: 100,
                    ),
                    Signature(
                      controller: _controller,
                      height: 300,
                      backgroundColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    _saveAndCompareSignature();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  icon: Icon(Icons.compare),
                  label: Text('Comparer'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    _resetSignature();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  icon: Icon(Icons.refresh),
                  label: Text('Réinitialiser'),
                ),
              ],
            ),
            SizedBox(height: 20),
            specificResult != null
                ? Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 30, 31, 32),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      specificResult!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  void _startDrawingTimer() {
    drawingsData.add([]);
    startTime = DateTime.now();
    timedrawingsData.add([]);

    drawingTimer = Timer.periodic(Duration(milliseconds: 1), (timer) {
      drawingsData.last.add({
        'x': _controller.points.last.offset.dx,
        'y': _controller.points.last.offset.dy,
        'n': drawingCounter,
      });
    });
  }

  void _stopDrawingTimer() {
    if (timedrawingsData.isNotEmpty) {
      timedrawingsData.last.add({
        'n': drawingCounter,
        'time': DateTime.now().difference(startTime!).inMilliseconds,
      });
    }
    drawingTimer?.cancel();
  }

  void _saveAndCompareSignature() async {
    _saveSignature();
    await compareImages();
  }

  void _saveSignature() async {
    try {
      _stopDrawingTimer();

      final Uint8List? signatureData = await _controller.toPngBytes();

      if (signatureData == null) {
        return;
      }
      List<Map<String, dynamic>> flattenedDrawingsData =
          drawingsData.expand((list) => list).toList();

      List<Map<String, dynamic>> flattenedtimeDrawingsData =
          timedrawingsData.expand((list) => list).toList();

      final String base64Signature = base64Encode(signatureData);

      Map<String, dynamic> dataToSave = {
        'signature_data': base64Signature,
        'drawings_data': flattenedDrawingsData,
        'drawing_counter': drawingCounter,
        'drawing_time': flattenedtimeDrawingsData,
        'timestamp': FieldValue.serverTimestamp(),
        'test_name': widget.testName,
        'prediction_result': null,
      };

      DocumentReference docRef = await FirebaseFirestore.instance
          .collection('signatures')
          .add(dataToSave);
      docId = docRef.id;

      print('ID du document ajouté : $docId');

      print('Signature saved successfully');
    } catch (e) {
      print('Error of saving signature: $e');
    }
  }

  Future<void> compareImages() async {
    DocumentReference specificDocRef =
        FirebaseFirestore.instance.collection('signatures').doc(docId);
    try {
      DocumentSnapshot docSnapshot = await specificDocRef.get();
      if (docSnapshot.exists) {
        Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
        setState(() {
          specificResult = data['prediction_result'];
        });
      } else {
        setState(() {
          specificResult = null;
        });
      }
    } catch (e) {
      print('Erreur lors de la récupération des données depuis Firebase: $e');
    }
  }

  void _resetSignature() {
    _controller.clear();
    setState(() {
      specificResult = null;
    });
  }
}
