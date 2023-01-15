import 'package:flutter/material.dart';
import 'package:city_up/profile.dart';
import 'package:city_up/post_smth_new.dart';


class NewsOptions extends StatefulWidget{
  const NewsOptions({Key? key}) : super(key:key);



  @override
  _NewsOptionsState createState() => _NewsOptionsState();
}

class _NewsOptionsState extends State<NewsOptions>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      title: const Text('News', style: TextStyle(color:Colors.lightBlue, fontStyle: FontStyle.italic, fontWeight: FontWeight.w900, fontSize: 25),
    ),),
     body: Center(child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      SizedBox(
        height: 100,
        child:
         ElevatedButton(
          onPressed: () {},
          child: Text('View', style: TextStyle(fontSize: 18)),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.blue,
            backgroundColor: Colors.grey,
            side: const BorderSide(color: Colors.blue, width: 2),
            shape: CircleBorder(),
            padding: EdgeInsets.all(24),
            ),),),
          const SizedBox(height: 100),
          SizedBox(height: 50, width: 100, child: TextButton(onPressed: () {},style: ButtonStyle(side: MaterialStateProperty.all(BorderSide(width: 2,color: Colors.blue)) ,backgroundColor: MaterialStateProperty.all(Colors.grey), ),child: const Text('Read', style: TextStyle(color:Colors.blue, fontSize: 20.0))),)

    ]
    
   )),
   floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, color: Colors.black,),
          onPressed: () => {Navigator.of(context).push(MaterialPageRoute(
            builder: (context)=> PostSomethingNew()))
            },
          tooltip:  'Post Something New',
          backgroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
   bottomNavigationBar: SizedBox(
        height: 80,
      child: BottomAppBar(
         child: Row(
           children: [
              IconButton(tooltip: 'Live',icon: Icon(Icons.live_tv, color: Colors.red, size:33.0), onPressed: () {}),
              Spacer(),
              IconButton(onPressed: () =>{Navigator.of(context).push(MaterialPageRoute(
            builder: (context)=> Profile()))} ,
              tooltip: 'Profile',icon: Icon(Icons.man, size:33.0,)),
      ],
    ),
  ),),
   );
}
}
