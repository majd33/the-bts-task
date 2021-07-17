import 'package:bts_task/models/post.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class PostBuilder extends StatelessWidget {
  /*final String userName;
  final String userImage;
  final String Date;
  final String image;
  final String text;
  final String likes;
  final String showCompleteText;
  final bool isSeen;*/

  final Post post;
  PostBuilder(this.post);
  @override
  Widget build(BuildContext context) {
    bool showCompleteText=true;
    DateTime now=DateTime.now();
    String formatDate=DateFormat(post.publishDate).format(now);
    return Card(
      margin: EdgeInsets.only(top: 5, bottom: 8, left: 5, right: 5),
      elevation: 3,
      child: Container(
        color: post.seen!=null?Colors.pink[50]:Colors.white,
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: CircleAvatar(
                child: Image.network(post.owner.picture),
              ),
              title: Text("${post.owner.title} ${post.owner.firstName} ${post.owner.lastName}", style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text("${formatDate}"),
            ),
            showCompleteText?Text("${post.text}",):Text( "${post.text}", overflow:TextOverflow.ellipsis, maxLines: 3,),
            SizedBox(height: 15,),
            post.image==null?SizedBox(height: 10,):Image.network("${post.image}"),
            Divider(thickness: 1,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(children: [Icon(Icons.favorite_border), SizedBox(width:5),Text("${post.likes}")],),
                Icon(Icons.comment),
                Icon(Icons.share)
              ],)
          ],
        ),
      ),
    );
  }
}
