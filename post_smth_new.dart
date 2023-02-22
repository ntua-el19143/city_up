import 'package:city_up/camera_page.dart';
import 'package:city_up/write_something.dart';
import 'package:flutter/material.dart';

class PostSomethingNew extends StatefulWidget {
  const PostSomethingNew({Key? key}) : super(key: key);

  @override
  _PostSomethingNewState createState() => _PostSomethingNewState();
}

class _PostSomethingNewState extends State<PostSomethingNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            title: const Text(
              'Post Something New',
              style: TextStyle(
                  color: Colors.lightBlue,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w900),
            )),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              TextButton(
                  onPressed: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CameraPage()))
                      },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.grey)),
                  child: const Text('Story',
                      style: TextStyle(color: Colors.black, fontSize: 20.0))),
              const SizedBox(height: 25),
              TextButton(
                  onPressed: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => WriteSomething()))
                      },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.grey)),
                  child: const Text('Article',
                      style: TextStyle(color: Colors.black, fontSize: 20.0))),
            ])));
  }
}
