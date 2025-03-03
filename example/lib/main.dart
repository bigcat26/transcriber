import 'package:flutter/material.dart';
import 'package:fonnx_example/services/audio_recording_service.dart';
import 'package:fonnx_example/viewmodels/recorder_viewmodel.dart';
import 'package:fonnx_example/views/pages/settings_page.dart';
import 'package:fonnx_example/views/widgets/pyannote_widget.dart';
import 'package:fonnx_example/views/pages/recorder_page.dart';
import 'package:fonnx_example/views/widgets/silero_vad_widget.dart';
import 'package:provider/provider.dart';
// import 'package:fonnx_example/stt_demo_widget.dart';
// import 'package:fonnx_example/whisper_widget.dart';

void main() {
  final audioRecordingService = AudioRecordingService();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RecorderViewModel(recordingService: audioRecordingService)),
      ],
      child: const MyApp(),
    ),
  );
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

    // Widget buildDemo() {
  //   return const Padding(
  //     padding: EdgeInsets.only(left: 16, right: 16),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         SttDemoWidget(),
  //         SizedBox(height: 16),
  //         SileroVadWidget(),
  //         SizedBox(height: 16),
  //         PyannoteWidget(),
  //         SizedBox(height: 16),
  //         WhisperWidget(),
  //         SizedBox(height: 16),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transcriber',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => RecordingScreen(),
        '/settings': (context) => SettingsPage(),
      },
        // home: RecordingScreen());
    );
  }
}
