import 'package:dictionary_app/models/dictionary_model.dart';
import 'package:dictionary_app/repo/dict_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DictionaryCubit extends Cubit<DictionaryState> {
  final DictionaryRepository _dictionaryRepository;

  DictionaryCubit(this._dictionaryRepository) : super(InitialState());

  final hint = TextEditingController();

  Future getWordSearched() async {
    emit(WordSearchingState());

    try {
      final words = await _dictionaryRepository
          .getWordsFromDict(hint.text.toString()); //TODO:this

      if (words == null) {
        emit(ErrorState("No words found"));
      } else {
        emit(ResultState(words));
        emit(InitialState());
      }
    } on Exception catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}

abstract class DictionaryState {}

class InitialState extends DictionaryState {}

class WordSearchingState extends DictionaryState {}

class ResultState extends DictionaryState {
  final DictionaryModel words; //TODO: list

  ResultState(this.words);
}

class ErrorState extends DictionaryState {
  final message;
  ErrorState(this.message);
}
