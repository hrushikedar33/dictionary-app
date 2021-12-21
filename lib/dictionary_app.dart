import 'package:dictionary_app/UI/screens/home_screen.dart';
import 'package:flutter/material.dart';

class DictionaryApp extends StatefulWidget {
  const DictionaryApp({Key? key}) : super(key: key);

  @override
  State<DictionaryApp> createState() => _DictionaryAppState();
}

class _DictionaryAppState extends State<DictionaryApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: true,
      title: "Dictonary App",
      home: HomeScreen(),
    );
  }
}
