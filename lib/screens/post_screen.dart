import 'package:bts_task/services/post_service.dart';
import 'package:flutter/material.dart';
import 'package:bts_task/models/post.dart';
import 'package:bts_task/widgets/post_builder.dart';

class PostScreen extends StatefulWidget {
  final Post post;
  PostScreen(this.post);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("title"),),
      body: SingleChildScrollView(child: PostBuilder(widget.post)),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.visibility),
        onPressed: ()async{
          if(widget.post.seen==null) {
            PostData ref = PostData();
            await ref.addToPost(widget.post.id, "seen");
          }
          print("${widget.post.seen}");
        },
      ),
    );
  }
}
