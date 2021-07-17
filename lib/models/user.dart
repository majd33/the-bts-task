import 'package:flutter/material.dart';

class User {
  final String id;
  final String title;
  final String firstName;
  final String lastName;
  final String picture;

  User(
      {@required this.id,
        @required this.title,
        @required this.firstName,
        @required this.lastName,
        @required this.picture});

  factory User.fromJson(Map<String, dynamic> jsonData) {
    return User(
        id: jsonData['id'],
        title: jsonData['title'],
        firstName: jsonData['firstName'],
        lastName: jsonData['lastName'],
        picture: jsonData['picture']);
  }
}
