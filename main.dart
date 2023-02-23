import 'package:city_up/lifestyle_options.dart';
import 'package:city_up/local_authorities.dart';
import 'package:city_up/post_smth_new.dart';
import 'package:city_up/news_options.dart';
import 'package:city_up/city_info_options.dart';
import 'package:city_up/profile.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:city_up/camera_page.dart';

int story_posts = 0;
int total_posts = 0;
List<String> list_lifestyle = [];
List<String> list_city_info = [];
List<String> list_news = [];

void main() {
  runApp(const CityUp());
}

class CityUp extends StatelessWidget {
  const CityUp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'City Up',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: _HomePage(),
    );
  }
}

class _HomePage extends StatefulWidget {
  const _HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> {
  late String lat;
  late String long;

  Future<void> _openMap(String lat, String long) async {
    String googleURL = 'https://www.google.com/maps/@$lat,$long,14z';
    await canLaunchUrlString(googleURL)
        ? await launchUrlString(googleURL)
        : throw 'Could not launch $googleURL';
  }

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permission denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location Permission Denied Forever. Cannot request!');
    }
    return await Geolocator.getCurrentPosition();
  }

  late GoogleMapController mapController;
  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  int _counter = 0;
  void _incrementCounter() {
    // Θελω να καλω αυτη τη συναρτηση οταν παταω POST για story ειτε για article
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          'City Up',
          style: TextStyle(
              color: Colors.lightBlue,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w900,
              fontSize: 25),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.settings),
              tooltip: 'Settings',
              color: Colors.black)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        onPressed: () => {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => PostSomethingNew()))
        },
        tooltip: 'Post Something New',
        backgroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                TextButton(
                  onPressed: () => {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LifestyleOptions()))
                  },
                  child: Text('LIFESTYLE',
                      style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.lightBlue)),
                ),
                TextButton(
                  onPressed: () => {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => NewsOptions()))
                  },
                  child: Text('NEWS',
                      style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.lightBlue)),
                ),
                TextButton(
                  onPressed: () => {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CityInfoOptions()))
                  },
                  child: Text('CITY INFO',
                      style: TextStyle(color: Colors.white, fontSize: 20.0)),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.lightBlue)),
                ),
              ],
            )),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
              onPressed: () {
                _getCurrentLocation().then((value) {
                  lat = '${value.latitude}';
                  long = '${value.longitude}';
                });
              },
              child: const Text('Allow City Up to Know my Current Location')),
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: () {
                _openMap(lat, long);
              },
              child: const Text('Open My Location in Google Map')),
          const SizedBox(height: 100),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            TextButton(
                onPressed: () => {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LocalAuthorities()))
                    },
                child: Text('Local Authorities',
                    style: TextStyle(color: Colors.black)))
          ]),
          const SizedBox(height: 8),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomAppBar(
          child: Row(
            children: [
              IconButton(
                tooltip: 'Live',
                icon: Icon(Icons.live_tv, color: Colors.red, size: 33.0),
                onPressed: () => {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => CameraPage()))
                },
              ),
              Spacer(),
              IconButton(
                  onPressed: () => {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Profile()))
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
    );
  }
}
