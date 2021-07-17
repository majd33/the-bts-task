import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:bts_task/models/post.dart';

class Posts {
  final List<Object> postsList;

  Posts({@required this.postsList});

  factory Posts.fromJson(Map<String, Object> jsonData){
    return Posts(postsList: jsonData['data']);
  }

}

