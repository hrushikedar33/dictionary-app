import 'package:dictionary_app/UI/screens/widgets/result_widget.dart';
import 'package:dictionary_app/models/dictionary_model.dart';
import 'package:flutter/material.dart';

class WordSearchingWidget extends StatelessWidget {
  const WordSearchingWidget({Key? key, required this.words}) : super(key: key);
  final DictionaryModel words;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 600), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultWidget(
            resultModel: words,
          ),
        ),
      );
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dictionary"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          words.word,
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
