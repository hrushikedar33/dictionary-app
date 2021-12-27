import 'package:dictionary_app/UI/bloc/dictionary_bloc.dart';
import 'package:dictionary_app/UI/screens/home_screen.dart';
import 'package:dictionary_app/repo/dict_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DictionaryApp extends StatelessWidget {
  const DictionaryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: "Dictonary App",
      home: BlocProvider(
        child: HomeScreen(),
        create: (context) => DictionaryCubit(DictionaryRepository()),
      ),
    );
  }
}
