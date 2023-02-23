import 'dart:math';
import 'package:flutter/material.dart';

class InfiniteImageScroll extends StatefulWidget {
  @override
  _InfiniteImageScrollState createState() => _InfiniteImageScrollState();
}

class _InfiniteImageScrollState extends State<InfiniteImageScroll> {
  final List<String> _imageUrls = [
    "images/image1.jpg",
    "images/image2.jpg",
    "images/image3.gif",
    "images/image4.png",
  ];

  final Random _random = Random();
  final ScrollController _scrollController = ScrollController();

  List<String> _images = [];

  @override
  void initState() {
    super.initState();
    _addImages();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _addImages();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Infinite Image Scroll"),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemBuilder: (BuildContext context, int index) {
          /* if (index >= _images.length) {
            int imageIndex = index % _images.length;
            return Image.network(
              _images[imageIndex],
              fit: BoxFit.cover,
            );
          } */
          return Image.network(
            _images[index],
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }

  void _addImages() {
    setState(() {
      _images.addAll(List.generate(
          5, (index) => _imageUrls[_random.nextInt(_imageUrls.length)]));
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
