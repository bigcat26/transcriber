import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/recorder_viewmodel.dart';

class RecordingScreen extends StatefulWidget {
  const RecordingScreen({super.key});

  @override
  _RecordingScreenState createState() => _RecordingScreenState();
}

class _RecordingScreenState extends State<RecordingScreen> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
            title: const Text('Transcriber'),
            backgroundColor: Colors.blueGrey,
            leading: const Icon(Icons.edit),
            actions: [
              PopupMenuButton<String>(
                onSelected: (String result) {
                  final viewModel = Provider.of<RecorderViewModel>(context, listen: false);
                  switch (result) {
                    case 'New':
                      viewModel.newRecordingNote();
                      break;
                    case 'Save':
                      viewModel.saveRecodingNote();
                      break;
                    case 'Settings':
                      Navigator.pushNamed(context, '/settings');
                      break;
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'New',
                    child: Text('New document'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Save',
                    child: Text('Save document'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Settings',
                    child: Text('Settings'),
                  ),
                ],
              ),
            ]),
        floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 20.0, right: 20.0),
            child: Consumer<RecorderViewModel>(
                builder: (context, viewModel, child) {
              return FloatingActionButton(
                onPressed: viewModel.isRecording
                    ? viewModel.stopRecording
                    : viewModel.startRecording,
                foregroundColor: Colors.red,
                shape: const CircleBorder(),
                child: Icon(viewModel.isRecording ? Icons.stop : Icons.mic),
              );
            })),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1.0),
                  ),
                  child: SingleChildScrollView(
                    child: Consumer<RecorderViewModel>(
                      builder: (context, viewModel, child) {
                        return Text(viewModel.transcriptionText);
                      },
                    ),
                  ),
                ),
              ),
              // const SizedBox(height: 16),
              // ElevatedButton(
              //   onPressed: _saveText,
              //   child: const Text('Save Text'),
              // ),

              // Consumer<RecorderViewModel>(
              //   builder: (context, viewModel, child) {
              //     return Column(
              //       children: [
              //         Text('Recorded Length: ${viewModel.recordedLength}'),
              //         Slider(
              //           value: viewModel.currentPosition,
              //           max: viewModel.recordedLength,
              //           onChanged: viewModel.isRecording
              //               ? null
              //               : (value) {
              //             viewModel.seekTo(value);
              //           },
              //         ),
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             IconButton(
              //               icon: Icon(viewModel.isPlaying ? Icons.pause : Icons.play_arrow),
              //               onPressed: viewModel.isRecording
              //                   ? null
              //                   : viewModel.isPlaying
              //                   ? viewModel.pausePlayback
              //                   : viewModel.startPlayback,
              //             ),
              //             IconButton(
              //               icon: const Icon(Icons.stop),
              //               onPressed: viewModel.isRecording ? null : viewModel.stopPlayback,
              //             ),
              //           ],
              //         ),
              //       ],
              //     );
              //   },
              // ),
            ],
          ),
        ));
  }
}
