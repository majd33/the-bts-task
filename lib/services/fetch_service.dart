import 'dart:convert';

import 'package:bts_task/models/post.dart';
import 'package:bts_task/models/posts.dart';
import 'package:bts_task/models/user.dart';
import 'package:http/http.dart' as http;

class FetchData{
  var apiUrl =Uri.parse("https://dummyapi.io/data/api/post");

  Future<List<Post>> FetchPosts() async{

    http.Response res = await http.get(apiUrl, headers:{'app-id':'60f028fa3fd67f5e03c0fbb0'});

    //60f028fa3fd67f5e03c0fbb0
    if(res.statusCode==200){
      var jsonData= jsonDecode(res.body);
      print("${jsonData}");
      Posts posts=Posts.fromJson(jsonData);
      return List.generate(posts.postsList.length, (index) => Post.fromJson(posts.postsList[index]));
    }
    else{
      print("Faild");
    }

  }


}