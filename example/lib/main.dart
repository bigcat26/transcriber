import 'package:flutter/material.dart';
import 'package:fonnx_example/pyannote_widget.dart';
import 'package:fonnx_example/recorder_widget.dart';
import 'package:fonnx_example/silero_vad_widget.dart';
import 'package:fonnx_example/stt_demo_widget.dart';
import 'package:fonnx_example/whisper_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  Widget buildDemo() {
    return const Padding(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SttDemoWidget(),
          SizedBox(height: 16),
          SileroVadWidget(),
          SizedBox(height: 16),
          PyannoteWidget(),
          SizedBox(height: 16),
          WhisperWidget(),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: RecordingScreen());
  }
}
