import 'dart:convert' ;
import 'dart:developer';
import 'reddit_response.dart';



void filterPosts(Data posts) {

  List<Post> _postOfFrodo = [];
  List<Post> _postOfBilbo = [];
  List<Post> _postOfSam = [];
  List<Post> _postOfMerry = [];
  List<Post> _postOfPippin = [];
  List<Post> _postOfGollum = [];
  //Check each post for the Regular Expression of each hobbir
  //E.G.    r' \b frodo \b ' The \b is for searching only those RegEx, ignoring results such as same as true for Sam  
  //Don´t Use else if, in case there are 2 or more hobbits on a Title.
  for(int i = 0; i<posts.childrens.length; i++){
    if ((posts.childrens[i].dataTitle.title).contains(new RegExp(r'\bfrodo\b', caseSensitive: false))){
      _postOfFrodo.add(Post(posts.childrens[i].dataTitle.title));
    } 
    if ((posts.childrens[i].dataTitle.title).contains(new RegExp(r'\bbilbo\b', caseSensitive: false))){
      _postOfBilbo.add(Post(posts.childrens[i].dataTitle.title));
    } 
    if ((posts.childrens[i].dataTitle.title).contains(new RegExp(r'\bsam\b|\bsamsagaz\b|\bsamwise\b', caseSensitive: false))){
      _postOfSam.add(Post(posts.childrens[i].dataTitle.title));
    } 
    if ((posts.childrens[i].dataTitle.title).contains(new RegExp(r'\bmerry\b|\bmeriadoc\b', caseSensitive: false))){
      _postOfMerry.add(Post(posts.childrens[i].dataTitle.title));
    } 
    if ((posts.childrens[i].dataTitle.title).contains(new RegExp(r'\bpippin|peregrin\b', caseSensitive: false))){
      _postOfPippin.add(Post(posts.childrens[i].dataTitle.title));
    } 
    if ((posts.childrens[i].dataTitle.title).contains(new RegExp(r'\bgollum|smeagol\b', caseSensitive: false))){
      _postOfGollum.add(Post(posts.childrens[i].dataTitle.title));
    } 
  }

  jsonTest(_postOfFrodo, _postOfBilbo, _postOfSam, _postOfMerry, _postOfPippin, _postOfGollum);

 
}

//Function that call all the posts List and assign it to the Json structure
void jsonTest(dynamic postFrodo, postBilbo, postSam, postMerry, postPippin, postGollum){
  String title = 'Hobbit Posts From Reddit';
  String description = 'r/lotr Top 100 of all Time posts filtered to return only posts from Hobbits';

  List<Hobbit> hobbits = [
    Hobbit('Frodo', postFrodo), Hobbit('Bilbo', postBilbo),
    Hobbit('Sam', postSam),Hobbit('Merry', postMerry),
    Hobbit('Pippin', postPippin), Hobbit('Gollum', postGollum)];

  RedditToJSON redditToJSON = RedditToJSON(title, description, hobbits);
  String jsonRTJ = jsonEncode(redditToJSON);

  log(jsonRTJ);
}



class RedditToJSON {
  String title;
  String description;
  List<Hobbit> hobbits;

  RedditToJSON(this.title, this.description, [this.hobbits]);

  Map toJson(){
    List<Map> hobbits =
    this.hobbits != null ? this.hobbits.map((e) => e.toJson()).toList() : null;
  
    return {
      'title' : title,
      'description' : description,
      'hobbits' : hobbits
    };
  }

}

class Hobbit { 
  String name;
  List<Post> listPosts;

  Hobbit(this.name, [this.listPosts]);
  Map toJson(){
    List<Map> listPosts =
    this.listPosts != null ? this.listPosts.map((e) => e.toJson()).toList() : null;
  
    return {
      'name' : name,
      'posts' : listPosts
    };
  }
}

class Post {
  String redditPost;

  Post(this.redditPost);

  Map toJson() => {
    'redditPost' : redditPost
  };
}

