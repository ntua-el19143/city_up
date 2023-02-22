import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:city_up/post_smth_new.dart';
import 'package:city_up/profile.dart';
import 'main.dart' as main;

class CityInfoArticles extends StatefulWidget {
  const CityInfoArticles({Key? key}) : super(key: key);

  @override
  _CityInfoArticlesState createState() => _CityInfoArticlesState();
}

class _CityInfoArticlesState extends State<CityInfoArticles> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'City Info Articles',
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
              'City Info',
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
  final _biggerFont = const TextStyle(fontSize: 18);
  @override
  Widget build(BuildContext context) {
    for (int j = main.list_city_info.length - 1; j >= 0; j--) {
      if (main.list_city_info[j] != []) {
        _suggestion.add("Article $_articleNumber : ${main.list_city_info[j]}");
        _articleNumber++;
      }
    }
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
