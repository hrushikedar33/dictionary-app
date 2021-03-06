import 'package:flutter/cupertino.dart';
import 'package:speech_to_text/speech_to_text.dart';

class Speechtotext {
  static final _speech = SpeechToText();

  static Future<bool> startRecording({
    required Function(String text) onResult,
    required ValueChanged<bool> onListening,
  }) async {
    if (_speech.isListening) {
      _speech.stop();
      return true;
    }

    final isAvailable = await _speech.initialize(
        onStatus: (status) => onListening(_speech.isListening),
        onError: (errorNotification) => print('Error: $errorNotification'));

    if (isAvailable) {
      _speech.listen(
        onResult: (result) => onResult(result.recognizedWords),
        listenFor: const Duration(seconds: 10),
      );
    }

    return isAvailable;
  }
}
