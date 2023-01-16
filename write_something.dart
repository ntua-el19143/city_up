import 'package:flutter/material.dart';

void main() {
  runApp(WriteSomethingPage());
}

class WriteSomethingPage extends StatelessWidget {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'New Post',
        home: Scaffold(
          appBar: AppBar(
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
                  child: Text("Post"),
                  onPressed: () {
                    // Do nothing
                  },
                )
              ],
            ),
          ),
        ));
  }
}
