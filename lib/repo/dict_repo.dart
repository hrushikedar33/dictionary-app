import 'dart:io';
import 'package:dictionary_app/models/dictionary_model.dart';
import 'package:dictionary_app/services/dictionary_api.dart';

class DictionaryRepository {
  Future<DictionaryModel?> getWordsFromDict(String word) async {
    //TODO: Check list
    try {
      final response = await DictionaryApi.getRequest("$word");

      if (response.statusCode == 200) {
        final result = dictionaryModelFromJson(response.body);
        return result;
      } else {
        return null;
      }
    } on SocketException catch (e) {
      throw e;
    } on HttpException catch (e) {
      throw e;
    } on FormatException catch (e) {
      throw e;
    }
  }
}
