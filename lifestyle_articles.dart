import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lifestyle Articles',
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Lifestyle',
                style: TextStyle(
                    color: Colors.lightBlue, fontWeight: FontWeight.bold)),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Center(
            child: RandomWords(),
          )),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  @override
  State<StatefulWidget> createState() => RandomWordState();
}

class RandomWordState extends State<RandomWords> {
  final _suggestion = <String>[];
  int _articleNumber = 1;
  final _saved = <String>[];
  final _biggerFont = const TextStyle(fontSize: 18);
  @override
  Widget build(BuildContext context) {
    final String = lorem(paragraphs: 4, words: 200);
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, index) {
          if (index.isOdd) return Divider();

          final i = index ~/ 2;

          if (i >= _suggestion.length) {
            _suggestion.add(
                "Article $_articleNumber: ${lorem(paragraphs: 2, words: 200)}");
            _articleNumber++;
            ;
          }

          return ListTile(
            title: Text(
              _suggestion[i],
              style: _biggerFont,
            ),
          );
        });
  }
}
