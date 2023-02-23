import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:city_up/profile.dart';
import 'package:city_up/post_smth_new.dart';
import 'main.dart' as main;

class NewsArticles extends StatefulWidget {
  const NewsArticles({Key? key}) : super(key: key);

  @override
  _NewsArticlesState createState() => _NewsArticlesState();
}

class _NewsArticlesState extends State<NewsArticles> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Articles',
      home: Scaffold(
          appBar: AppBar(
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black54,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            title: const Text(
              'News',
              style: TextStyle(
                  color: Colors.lightBlue,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w900,
                  fontSize: 25),
            ),
          ),
          bottomNavigationBar: SizedBox(
            height: 80,
            child: BottomAppBar(
              child: Row(
                children: [
                  IconButton(
                      tooltip: 'Live',
                      icon: Icon(Icons.live_tv, color: Colors.red, size: 33.0),
                      onPressed: () {}),
                  Spacer(),
                  IconButton(
                      onPressed: () => {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Profile()))
                          },
                      tooltip: 'Profile',
                      icon: Icon(
                        Icons.man,
                        size: 33.0,
                      )),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: () => {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PostSomethingNew()))
            },
            tooltip: 'Post Something New',
            backgroundColor: Colors.white,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
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
    for (int j = main.list_news.length - 1; j >= 0; j--) {
      if (main.list_news[j] != []) {
        _suggestions.add("Article $_articleNumber : ${main.list_news[j]}");
        _articleNumber++;
      }
    }
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
