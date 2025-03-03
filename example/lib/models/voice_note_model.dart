import 'dart:typed_data';

class VoiceNoteModel {
  String _text;

  // audio data
  final BytesBuilder _bytesBuilder = BytesBuilder();

  VoiceNoteModel([this._text = ""]);

  // getter for audio data samples length
  int get audioDataSamplesLength => _bytesBuilder.length;

  // getter for text
  String get text => _text;

  appendVoice(Uint8List data) {
    _bytesBuilder.add(data);
  }

  appendText(String text) {
    _text += text;
  }
}
