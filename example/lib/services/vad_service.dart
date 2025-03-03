import 'dart:async';
import 'dart:typed_data';

import 'package:fonnx/models/sileroVad/silero_vad.dart';

class VadService {
  final String vadModelPath;
  SileroVad? _vad;

  // bool _initialized = false;
  // bool _stopped = false;
  // double? lastVadProbability;

  VadService(this.vadModelPath);

  Future<void> initialize() async {
    if (_vad != null) {
      _vad = SileroVad.load(vadModelPath);
    }
    // Initialize VAD if needed
    // _initialized = true;
    // _stopped = false;
  }

  Future<void> cleanup() async {
    // Cleanup resources if needed
    // _initialized = false;
    // _stopped = true;
  }

  Future<double> processPcmData(Uint8List pcmData) async {
    if (_vad == null) {
      throw Exception('VAD service not initialized');
    }

    // audioBuffer = Uint8List.fromList(audioBuffer + event);
    // const maxVadFrameSizeInBytes = kSampleRate *
    //     kMaxVadFrameMs *
    //     kChannels *
    //     (kBitsPerSample / 8) ~/
    //     1000;
    // final remainder = audioBuffer.length % maxVadFrameSizeInBytes;
    // final vadBufferLength = audioBuffer.length - remainder;
    // final vadBuffer = audioBuffer.sublist(0, vadBufferLength);
    // _vadBufferQueue.add(vadBuffer);
    // audioBuffer = audioBuffer.sublist(vadBufferLength);
    //
    // final vadResult = await vad.doInference(pcmData);
    // lastVadProbability = (vadResult['output'] as Float32List).first;
    // return lastVadProbability!;
    return 0.0;
  }
}