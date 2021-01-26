import 'package:flutter/material.dart';

import 'package:hobbits_worky/view/view.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Worky Hobbit Search',
      home: RedditHobbitPosts(),
    );
  }
}