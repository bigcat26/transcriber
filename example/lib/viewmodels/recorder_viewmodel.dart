import 'package:flutter/material.dart';
import '../models/transcription_model.dart';

class RecorderViewModel with ChangeNotifier {
  // final AudioRecordingService _recordingService;
  // final SpeechToTextService _speechToTextService;
  bool _isRecording = false;
  TranscriptionModel _transcription = TranscriptionModel(text: 'Press record button to start recording **');

  RecorderViewModel(
      // {required AudioRecordingService recordingService,
      //   required SpeechToTextService speechToTextService}
      )
      // : _recordingService = recordingService,
      //   _speechToTextService = speechToTextService
  ;

  // 获取转录结果
  String get transcriptionText => _transcription.text;

  // 是否正在录音
  bool get isRecording => _isRecording; // _recordingService.isRecording;

  // 开始录音
  Future<void> startRecording() async {
    // await _recordingService.startRecording();
    _isRecording = true;
    notifyListeners();
  }

  // 停止录音并进行转录
  Future<void> stopRecording() async {
    // final audioData = await _recordingService.stopRecording();
    // if (audioData != null) {
    //   final text = await _speechToTextService.convertAudioToText(audioData);
    //   _transcription = TranscriptionModel(text: text);
    //   notifyListeners(); // 通知视图更新
    // }
    _isRecording = false;
    notifyListeners();
  }
}