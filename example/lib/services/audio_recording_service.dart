import 'dart:typed_data';

import 'package:record/record.dart';

class AudioRecordingService {
  final int numChannels;
  final int sampleRate;
  final List<void Function(Uint8List)> _listeners = [];
  final recorder = AudioRecorder();

  // stream holder
  Stream<Uint8List>? _stream = null;

  bool get isRecording => _stream != null;

  AudioRecordingService({this.numChannels = 1, this.sampleRate = 16000});

  Future<void> startRecording() async {
    // Check and request permission
    bool hasPermission = await recorder.hasPermission();
    if (!hasPermission) {
      throw 'Denied permission to record audio.';
    }

    // Start recording
    _stream = await recorder.startStream(
      RecordConfig(
        encoder: AudioEncoder.pcm16bits,
        numChannels: numChannels,
        sampleRate: sampleRate,
        echoCancel: false,
        noiseSuppress: false,
      ),
    );

    _stream!.listen((event) {
      print('Recording: ${event.length} bytes');
      _notifyListeners(event);
    });
  }

  Future<void> stopRecording() async {
    if (_stream != null) {
      await recorder.stop();
      _stream = null;
    }
  }

  void addListener(void Function(Uint8List) listener) {
    _listeners.add(listener);
  }

  void removeListener(void Function(Uint8List) listener) {
    _listeners.remove(listener);
  }

  void _notifyListeners(Uint8List data) {
    for (var listener in _listeners) {
      listener(data);
    }
  }
}