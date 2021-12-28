import 'package:avatar_glow/avatar_glow.dart';
import 'package:dictionary_app/UI/bloc/dictionary_bloc.dart';
import 'package:dictionary_app/UI/screens/widgets/initial_widget.dart';
import 'package:dictionary_app/UI/screens/widgets/word_searching_widget.dart';
import 'package:dictionary_app/services/speech_to_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  getErrorWidget(message) {
    return Center(
      child: Text(message),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<DictionaryCubit>();
    bool isListening = false;
    String _textTest = "start";

    return BlocListener(
      listener: (context, state) {
        if (state is ResultState && state.words != null) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => WordSearchingWidget(
                  words: state.words,
                ),
              ));
        }
      },
      bloc: cubit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Dictionary"),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.only(
              top: 10.0, left: 20.0, right: 20.0, bottom: 140.0),
          child: cubit.state is InitialState
              ? const InitialWidget()
              : cubit.state is InitialState
                  ? isListening = true
                  : cubit.state is WordSearchingState
                      ? const Center(child: CircularProgressIndicator())
                      : cubit.state is ErrorState
                          ? getErrorWidget("message")
                          : Container(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: AvatarGlow(
          animate: isListening,
          glowColor: Colors.grey,
          endRadius: 80.0,
          duration: const Duration(milliseconds: 2000),
          repeatPauseDuration: const Duration(milliseconds: 100),
          repeat: true,
          child: FloatingActionButton(
            onPressed: () {
              Speechtotext.startRecording(onResult: (_textTest) {
                _textTest = _textTest;
                cubit.hint.text = _textTest;
                cubit.getWordSearched();
              }, onListening: (_isListening) {
                _isListening = _isListening;
              });
            },
            tooltip: 'Listen',
            child: Icon(isListening ? Icons.mic : Icons.mic_none),
          ),
        ),
      ),
    );
  }
}
