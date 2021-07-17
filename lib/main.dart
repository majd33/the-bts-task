import 'package:bts_task/screens/home_screen.dart';
import 'package:bts_task/screens/auth_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (mycontext, snapshot){
        if(snapshot.hasData) return HomeScreen();
        else return AuthenticationScreen();
      },),
    );
  }
}

