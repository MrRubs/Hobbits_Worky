//Classes generated based on the Reddit Json Response General > Data > Children > Data > Title
//Extracting only the Title of each post and returning it as a Data Type

class RedditResponse{
  var data;
  RedditResponse({this.data});

   factory RedditResponse.fromJson(Map<String, dynamic> json){
    return RedditResponse(
      data : Data.fromJson(json['data'])
    );    
  }
}

class Data{
  List<Children> childrens;
  Data({this.childrens});

  factory Data.fromJson(Map<String, dynamic> json){
    var list = json['children'] as List;
    List<Children> childrenList = list.map((i) => Children.fromJson(i)).toList();
    return Data(
      childrens: childrenList
      );
  }
}

class Children{
  DataTitle dataTitle;
  Children({this.dataTitle});

  factory Children.fromJson(Map<String, dynamic> json){
    return Children(
      dataTitle: DataTitle.fromJson(json['data'])
      );
  }
}

class DataTitle{
  String title;
  DataTitle({this.title});

  factory DataTitle.fromJson(Map<String, dynamic> json){
    return DataTitle(
      title: json['title']
    );
  }
}