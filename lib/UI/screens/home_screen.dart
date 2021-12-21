import 'dart:convert';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String _apiUrl = "https://owlbot.info/api/v4/dictionary/";
  final String? _token = dotenv.env['token'];

  stt.SpeechToText _speech = SpeechToText();
  bool _isListening = false;
  String _text = 'dog';

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          listenFor: const Duration(milliseconds: 1000),
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            print('$_text');
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  void searchText() async {
    Response _response = await get(Uri.parse(_apiUrl + _text.toString()),
        headers: {"Authorization": "Token " + _token!});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PingoLEarn-Round 1"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: _isListening
                  ? Column(
                      children: [
                        Text(
                          "Your Word: ",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 16.0),
                        ),
                        Text(
                          "Word",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          color: Colors.grey[400],
                          child: Column(
                            children: [
                              Text(
                                "Meaning",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ",
                                  style: Theme.of(context).textTheme.bodyText1),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          color: Colors.grey[400],
                          child: Column(
                            children: [
                              Text(
                                "Example",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                  "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ",
                                  style: Theme.of(context).textTheme.bodyText1),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Image.asset(
                          "assets/image_not_found.png",
                          height: 120.0,
                          width: 120.0,
                        ),
                        const Spacer(),
                      ],
                    )
                  : Text(
                      "Press the button to start the\nspaking $_text",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: AvatarGlow(
                  animate: _isListening,
                  glowColor: Colors.grey,
                  endRadius: 80.0,
                  duration: const Duration(milliseconds: 2000),
                  repeatPauseDuration: const Duration(milliseconds: 100),
                  repeat: true,
                  child: FloatingActionButton(
                    onPressed: _listen,
                    tooltip: 'Listen',
                    child: Icon(_isListening ? Icons.mic : Icons.mic_none),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
