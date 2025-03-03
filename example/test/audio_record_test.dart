import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:record/record.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  test('Test recording from microphone', () async {
    final recorder = AudioRecorder();

    // Check and request permission
    bool hasPermission = await recorder.hasPermission();
    expect(hasPermission, true, reason: 'Microphone permission is required');

    // Start recording
    final stream = await recorder.startStream(
      const RecordConfig(
        encoder: AudioEncoder.pcm16bits,
        numChannels: 1,
        sampleRate: 16000,
        echoCancel: false,
        noiseSuppress: false,
      ),
    );

    stream.listen((event) {
      print('Recording: ${event.length}');
      // event is a Uint8List containing PCM data
      print('Recording: ${event.length} bytes');

    });

    // Wait for 5 seconds to record audio
    await Future.delayed(Duration(seconds: 5));
    await recorder.stop();

    // Stop recording
    // String? path = await record.stop();
    // expect(path, isNotNull, reason: 'Recording should have stopped and saved the file');
    //
    // // Check if the file exists
    // final file = File(path!);
    // expect(await file.exists(), true, reason: 'Recorded file should exist');
  });
}