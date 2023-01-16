import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

void main() {
  runApp(const News_Articles());
}

class News_Articles extends StatelessWidget {
  const News_Articles({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Articles',
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('News',
                style: TextStyle(
                    color: Colors.lightBlue, fontWeight: FontWeight.bold)),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Center(
            child: Randomwords_(),
          )),
    );
  }
}

class Randomwords_ extends StatefulWidget {
  const Randomwords_({super.key});

  @override
  State<StatefulWidget> createState() => Randomwords_state();
}

class Randomwords_state extends State<Randomwords_> {
  final _suggestions = <String>[];
  int _articleNumber = 1;
  final _biggerFont = const TextStyle(fontSize: 18);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, index) {
          if (index.isOdd) return Divider();

          final i = index ~/ 2;

          if (i >= _suggestions.length) {
            _suggestions.add(
                "Article $_articleNumber: ${lorem(paragraphs: 2, words: 200)}");
            _articleNumber++;
            ;
          }

          return ListTile(
            title: Text(
              _suggestions[i],
              style: _biggerFont,
            ),
          );
        });
  }
}
