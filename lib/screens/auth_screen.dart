
import 'package:bts_task/widgets/auth_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationScreen extends StatefulWidget{
  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final _auth = FirebaseAuth.instance;

  bool _isLoad=false;

  Future _submetForm(String email, String password , BuildContext mycontext )async{

    UserCredential _authResult;
    try{

      setState(() {
        _isLoad=true;
      });

        _authResult= await _auth.createUserWithEmailAndPassword(email: email, password: password);
        await FirebaseFirestore.instance.collection('users').doc(_authResult.user.uid)
            .set({'email':email, 'password':password,});


    }on FirebaseAuthException catch(e){
      String msg="error Occurred";
      if(e.code=='weak-password'){
        msg='password is too weak';
      }else if(e.code=='email-already-in-use'){
        msg='The account already exists for this email';
      }

      Scaffold.of(mycontext).showSnackBar(SnackBar(content: Text(msg)));

      setState(() {
        _isLoad=false;
      });
    }catch(e){
      print(e);
      setState(() {
        _isLoad=false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.deepPurpleAccent,
      body: AuthenticationForm(_submetForm, _isLoad),);}}
