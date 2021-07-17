import 'package:bts_task/models/post.dart';
import 'package:bts_task/services/fetch_service.dart';
import 'package:flutter/material.dart';
import 'package:bts_task/screens/post_screen.dart';
import 'package:bts_task/widgets/post_builder.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  FetchData fetchData;

  @override
  void initState() {

    fetchData=FetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          actions: [
            Flexible(
                child: IconButton(
                  icon: Icon(
                    Icons.search,
                    size: 35,
                  ),
                  onPressed: () {},
                ))
          ],
        ),
        body: FutureBuilder(
            initialData: [],
            future: fetchData.FetchPosts(),
            builder: (context, snapshot)
            {
              if(snapshot.connectionState==ConnectionState.waiting)
                return Center(child: CircularProgressIndicator());
              if(snapshot.hasError)
                return Center(child: Text("Faild"));
              else
                return Container(
              color: Colors.pink[100],
              child: ListView.builder(
                itemCount: snapshot.data.length??0,
                itemBuilder: (context, index) {
                  Post post=snapshot.data[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PostScreen(post))).then((value) {
                        setState(() {});
                      });
                    },
                    child: PostBuilder(post));},
              ));},
        ));
  }
}
