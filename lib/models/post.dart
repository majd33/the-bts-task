import 'package:flutter/material.dart';
import 'package:bts_task/models/user.dart';

class Post {
  final String appId;
  final String id;
  final String text;
  final String image;
  final String link;
  final int likes;
  final String publishDate;
  final List<Object> tags;
  final User owner;
  final String seen;

  Post({@required this.appId,
    @required this.id,
    @required this.text,
    @required this.image,
    @required this.link,
    @required this.likes,
    @required this.publishDate,
    @required this.tags,
    @required this.owner,
    this.seen
  });

  factory Post.fromJson(Map<String, Object> jsonData){
    return Post(
      id: jsonData['id'],
      appId: jsonData['appId'],
      text: jsonData['text'],
        image: jsonData['image'],
        link: jsonData['link'],
        likes: jsonData['likes'],
        publishDate: jsonData['publishData'],
        tags: jsonData['tags'],
        owner: User.fromJson(jsonData['owner']),
        seen: jsonData['seen']??null,
    );
  }

}
