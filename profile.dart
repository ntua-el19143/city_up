import 'package:flutter/material.dart';
import 'main.dart' as main;

class Profile extends StatefulWidget{
  const Profile({Key? key}) : super(key:key);



  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile>{
  var ap = main.article_posts;
  var sp = main.story_posts;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(backgroundColor: Colors.white, 
      foregroundColor: Colors.black,
       actions: [
        IconButton(
         onPressed: () {},
         icon: Icon(Icons.settings),
         tooltip: 'Settings',
         color: Colors.black)
      ]),
      body: Column(
        children: <Widget>[
          Center(child: Column( children: const <Widget>[Icon(Icons.man, size: 50),SizedBox(height:8), Text('My Profile')])),
          const SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [TextButton(onPressed: () {}, child: const Text('user name: ', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900)))]),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [TextButton(onPressed: () {}, child: Text('story posts: $sp', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900)))]),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [TextButton(onPressed: () {}, child: Text('article posts: $ap', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900)))])

        ]
      )
    );
  }
}