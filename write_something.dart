import 'package:city_up/main.dart';
import 'package:flutter/material.dart';

class WriteSomething extends StatefulWidget {
  const WriteSomething({Key? key}) : super(key: key);

  @override
  _WriteSomethingState createState() => _WriteSomethingState();
}

class _WriteSomethingState extends State<WriteSomething> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'New Post',
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
            title: const Text('Write Something',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  style: TextStyle(fontSize: 20),
                  maxLines: 8,
                  textAlignVertical: TextAlignVertical.top,
                ),
                SizedBox(height: 20, width: 20),
                ElevatedButton(
                  child: Text("Post Lifestyle"),
                  onPressed: () {
                    setState(() {
                      list_lifestyle.add(_controller.text);
                      _controller.clear();
                    });
                  },
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  child: Text("Post News"),
                  onPressed: () {
                    setState(() {
                      list_news.add(_controller.text);
                      _controller.clear();
                    });
                  },
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  child: Text("Post City Info"),
                  onPressed: () {
                    setState(() {
                      list_city_info.add(_controller.text);
                      _controller.clear();
                    });
                  },
                )
              ],
            ),
          ),
        ));
  }
}
