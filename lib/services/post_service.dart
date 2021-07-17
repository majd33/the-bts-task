import 'dart:convert';

import 'package:http/http.dart' as http;

class PostData{

  Future<http.Response> addToPost(String postId, String value ) async{

    var apiUrl =Uri.parse("https://dummyapi.io/data/api/post/${postId}");
    //60efe1700cbdb72b589e3694
    var res =await http.post(apiUrl, headers:{'app-id':'60f028fa3fd67f5e03c0fbb0'}, body: jsonEncode({"seen" : value}));
    print("${res.statusCode}");
    //return http.post(apiUrl, headers:{'app-id':'60f028fa3fd67f5e03c0fbb0'}, body: jsonEncode({"seen" : value})));



  }


}