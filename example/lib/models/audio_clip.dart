import 'dart:io';
import 'dart:typed_data';

/**
 * mono audio clip with 16kHz sample rate and 16 bits per sample
 */
class AudioClip {

  final _sampleRate = 16000;
  final _bitsPerSample = 16;

  // audio data
  final BytesBuilder _bytesBuilder = BytesBuilder();

  int get durationMs => (samples  * 1000 / _sampleRate).round();

  int get samples => _bytesBuilder.length ~/ (_bitsPerSample / 8);

  int get sampleRate => _sampleRate;

  int get bitsPerSample => _bitsPerSample;

  Uint8List get data => _bytesBuilder.takeBytes();

  AudioClip();

  append(Uint8List data) {
    _bytesBuilder.add(data);
  }

  clear() {
    _bytesBuilder.clear();
  }
}
