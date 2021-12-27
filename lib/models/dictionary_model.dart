import 'dart:convert';

DictionaryModel dictionaryModelFromJson(String str) =>
    DictionaryModel.fromJson(json.decode(str));

String dictionaryModelToJson(DictionaryModel data) =>
    json.encode(data.toJson());

class DictionaryModel {
  DictionaryModel({
    required this.word,
    required this.pronunciation,
    required this.definitions,
  });

  String word;
  String? pronunciation;
  List<Definition> definitions;

  factory DictionaryModel.fromJson(Map<String, dynamic> json) =>
      DictionaryModel(
        word: json["word"],
        pronunciation: json["pronunciation"],
        definitions: List<Definition>.from(
            json["definitions"].map((x) => Definition.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "word": word,
        "pronunciation": pronunciation,
        "definitions": List<dynamic>.from(definitions.map((x) => x.toJson())),
      };
}

class Definition {
  Definition({
    this.type,
    this.definition,
    this.example,
    this.imageUrl,
    this.emoji,
  });

  String? type;
  String? definition;
  String? example;
  String? imageUrl;
  String? emoji;

  factory Definition.fromJson(Map<String, dynamic> json) => Definition(
        type: json["type"],
        definition: json["definition"],
        example: json["example"],
        imageUrl: json["image_url"],
        emoji: json["emoji"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "definition": definition,
        "example": example,
        "image_url": imageUrl,
        "emoji": emoji,
      };
}
