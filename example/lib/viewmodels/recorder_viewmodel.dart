import 'package:flutter/material.dart';
import '../models/voice_note_model.dart';
import '../services/audio_recording_service.dart';

class RecorderViewModel with ChangeNotifier {
  final AudioRecordingService _recordingService;
  // final SpeechToTextService _speechToTextService;
  bool _isRecording = false;

  // Duration _recordingDuration = Duration.zero;

  // 录音长度
  // Duration get recordingDuration => _recordingDuration;

  VoiceNoteModel _transcription = VoiceNoteModel('Press record button to start recording **');

  RecorderViewModel(
      {required AudioRecordingService recordingService})
      : _recordingService = recordingService;

  // 获取转录结果
  String get transcriptionText => _transcription.text;

  // 是否正在录音
  bool get isRecording => _recordingService.isRecording;

  // 开始录音
  Future<void> startRecording() async {
    await _recordingService.startRecording();
    notifyListeners();
  }

  // 停止录音并进行转录
  Future<void> stopRecording() async {
    await _recordingService.stopRecording();
    // if (audioData != null) {
    //   final text = await _speechToTextService.convertAudioToText(audioData);
    //   _transcription = TranscriptionModel(text: text);
    //   notifyListeners(); // 通知视图更新
    // }
    notifyListeners();
  }

  Future<void> newRecordingNote() async {
    _transcription = VoiceNoteModel();
    notifyListeners();
  }

  Future<void> saveRecodingNote() async {

  }

}