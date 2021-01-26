
import 'package:hobbits_worky/bloc/reddit_bloc.dart';

import 'package:flutter/material.dart';

class RedditHobbitPosts extends StatefulWidget {
  @override
  _RedditWaitScreen createState() => _RedditWaitScreen();
}
class _RedditWaitScreen extends State<RedditHobbitPosts> {
  RedditBloc _bloc;
  @override
  void initState() {
    super.initState();
    _bloc = RedditBloc();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff335c0a),
        elevation: 0.0,
        title: Text(
          'Hobbits',
          style: TextStyle(
            fontSize: 28,
          ),
        ),
      ),
    );
  }

}
