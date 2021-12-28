import 'package:dictionary_app/UI/screens/home_screen.dart';
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ListTile(
                      tileColor: Theme.of(context).backgroundColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      title: Text(
                        "Your Word: ",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 16.0),
                      ),
                      subtitle: Text(
                        resultModel.word,
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            fontSize: 25.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const VerticalDivider(),
                  Expanded(
                    child: ListTile(
                      tileColor: Theme.of(context).backgroundColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      title: Text(
                        "Type",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 16.0),
                      ),
                      subtitle: Text(
                        resultModel.definitions.first.type!,
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            fontSize: 25.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(),
              ListTile(
                tileColor: Theme.of(context).backgroundColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                title: Text(
                  "Pronunciation:",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 16.0),
                ),
                subtitle: Text(
                    resultModel.pronunciation != null
                        ? resultModel.pronunciation!
                        : resultModel.word,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(fontSize: 20.0, fontWeight: FontWeight.bold)),
              ),
              const Divider(),
              ListTile(
                tileColor: Colors.grey[400],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                title: Text(
                  "Meaning:",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                    resultModel.definitions.first.definition! //TODO:change
                    ,
                    style: Theme.of(context).textTheme.bodyText1),
              ),
              const Divider(),
              ListTile(
                tileColor: Colors.grey[400],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                title: Text(
                  "Example:",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                    resultModel.definitions.first.example != null
                        ? resultModel.definitions.first.example!
                        : "No Example",
                    style: Theme.of(context).textTheme.bodyText1),
              ),
              const Divider(),
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
            ],
          ),
        ),
      ),
    );
  }
}
