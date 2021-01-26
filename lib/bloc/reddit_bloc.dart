import 'dart:async';
import 'package:hobbits_worky/bloc/reddit_response.dart';
import 'package:hobbits_worky/api/api_base_helper.dart';
import 'hobbit_filter.dart';

//Get the Reddit response
class RedditFetchPost {
ApiBaseHelper _helper = ApiBaseHelper();
Future<Data> fetchPosts() async {
    final response = await _helper.get();

    return RedditResponse.fromJson(response).data;
  }
}

//Get the JSON file and send it to reddit_response.dart to get the Posts Titles
class RedditBloc {
  RedditFetchPost _redditPosts;

  RedditBloc() {
    _redditPosts = RedditFetchPost();
    fetchPosts();
  }

  fetchPosts() async {
    //Try to get the Posts in a Data Type. Data Includes the Children > Posts > Title. Check reddit_response.dart for the structure
    try {
      Data posts = await _redditPosts.fetchPosts();

      //Send the Data to filter the hobbits and get the final JSON Response
      filterPosts(posts);
    }
    catch (Exception) {
      print("Bad Response: $Exception");
    }
   }
}