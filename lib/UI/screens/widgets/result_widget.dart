import 'package:dictionary_app/models/dictionary_model.dart';
import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {
  const ResultWidget({Key? key, required this.resultModel}) : super(key: key);
  final DictionaryModel resultModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dictionary"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(
              "Your Word: ",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontSize: 16.0),
            ),
            Text(
              resultModel.word,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.grey[400],
              child: Column(
                children: [
                  Text(
                    "Meaning:",
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                      resultModel.definitions.first.definition! //TODO:change
                      ,
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
                    "Example:",
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                      resultModel.definitions.first.example != null
                          ? resultModel.definitions.first.example!
                          : "No Example",
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            ),
            const Spacer(),
            resultModel.definitions.first.imageUrl == null
                ? Image.asset(
                    "assets/image_not_found.png",
                    height: 120.0,
                    width: 120.0,
                  )
                : Image.network(
                    resultModel.definitions.first.imageUrl!,
                    fit: BoxFit.contain,
                    height: 150,
                    width: 150,
                  ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
