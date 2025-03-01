import 'package:flutter_test/flutter_test.dart';
import 'package:fonnx/models/sileroVad/silero_vad.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:path/path.dart' as path;
import 'dart:io';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    // PathProviderPlatform.instance = MethodChannelPathProvider();
  });

  group('SileroVadWidget Tests', () {
    test('Verification Test', () async {
      final modelPath = await getModelPath('silero_vad.onnx');
      final silero = SileroVad.load(modelPath);
      final wavFile = await rootBundle.load('assets/audio_sample_16khz.wav');
      final result = await silero.doInference(wavFile.buffer.asUint8List());

      final acceptableAnswers = {
        0.4739372134208679, // macOS MBP M2 10 Feb 2024
        0.4739373028278351, // Android Pixel Fold 10 Feb 2024
        0.4739360809326172, // Web 15 Feb 2024
      };

      expect(result.length, 3);
      expect(acceptableAnswers.contains(result['output'].first), true);
    });

    test('Performance Test', () async {
      final modelPath = await getModelPath('silero_vad.onnx');
      final sileroVad = SileroVad.load(modelPath);
      final result = await testPerformance(sileroVad);

      expect(double.tryParse(result), isNotNull);
    });
  });
}

Future<String> getModelPath(String modelFilenameWithExtension) async {
  final assetCacheDirectory = await path_provider.getApplicationSupportDirectory();
  final modelPath = path.join(assetCacheDirectory.path, modelFilenameWithExtension);

  File file = File(modelPath);
  bool fileExists = await file.exists();
  final fileLength = fileExists ? await file.length() : 0;

  final assetPath = 'assets/models/sileroVad/${path.basename(modelFilenameWithExtension)}';
  final assetByteData = await rootBundle.load(assetPath);
  final assetLength = assetByteData.lengthInBytes;
  final fileSameSize = fileLength == assetLength;
  if (!fileExists || !fileSameSize) {
    List<int> bytes = assetByteData.buffer.asUint8List(
      assetByteData.offsetInBytes,
      assetByteData.lengthInBytes,
    );
    if (!fileExists) {
      await file.create(recursive: true);
    }
    await file.writeAsBytes(bytes, flush: true);
  }

  return modelPath;
}

Future<String> testPerformance(SileroVad sileroVad) async {
  final vadPerfWavFile = await rootBundle.load('assets/audio_sample_16khz.wav');
  final bytes = vadPerfWavFile.buffer.asUint8List();
  const iterations = 3;
  final Stopwatch sw = Stopwatch();
  for (var i = 0; i < iterations; i++) {
    if (i == 1) {
      sw.start();
    }
    await sileroVad.doInference(bytes);
  }
  sw.stop();
  final average = sw.elapsedMilliseconds.toDouble() / (iterations - 1).toDouble();
  const fileDurationMs = 5000;
  final speedMultiplier = fileDurationMs.toDouble() / average;
  return speedMultiplier.toStringAsFixed(2);
}