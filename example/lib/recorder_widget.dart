import 'package:flutter/material.dart';

class RecordingScreen extends StatefulWidget {
  const RecordingScreen({super.key});

  @override
  _RecordingScreenState createState() => _RecordingScreenState();
}

class _RecordingScreenState extends State<RecordingScreen> {
  bool isRecording = false;
  final TextEditingController _textController = TextEditingController();

  void _toggleRecording() {
    setState(() {
      isRecording = !isRecording;
    });
  }

  void _saveText() {
    // Add save text logic here
    final text = _textController.text;
    print('Saved text: $text');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
            title: const Text('Transcriber'),
            backgroundColor: Colors.blueGrey,
            leading: const Icon(Icons.edit),
            actions: [
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {
                  // Add your onPressed code here!
                },
              )
            ]),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 80.0, right: 20.0),
          child: FloatingActionButton(
            onPressed: _toggleRecording,
            foregroundColor: Colors.red,
            shape: const CircleBorder(),
            child: Icon(isRecording ? Icons.stop : Icons.mic),
          ),
        ),
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
                    child: TextField(
                      controller: _textController,
                      maxLines: null,
                      readOnly: true,
                      decoration: const InputDecoration(
                          hintText:
                              'Press record button to start recording ...',
                          // border: OutlineInputBorder(),
                          border: InputBorder.none),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _saveText,
                child: const Text('Save Text'),
              ),
            ],
          ),
        ));
  }
}
