import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ignore: must_be_immutable
class Profile extends StatefulWidget {
  FirebaseUser user;

  Profile(UserDetails) {
    this.user = UserDetails;
  }
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var Name = widget.user.displayName.toString().toUpperCase();
    var Email = widget.user.email.toString();

    return new Scaffold(
      backgroundColor: Colors.blue[800],
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(widget.user.photoUrl),
              ),
            ),
            Divider(
              color: Colors.white,
              height: 100,
              thickness: 1.5,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "NAME",
                style: TextStyle(
                  fontFamily: "Oswald",
                  letterSpacing: 2.0,
                  fontSize: 25,
                  color: Colors.grey[900],
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                Name,
                style: TextStyle(
                  fontFamily: "Oswald",
                  letterSpacing: 2.0,
                  fontSize: 25,
                  color: Colors.amberAccent,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Email Address",
                style: TextStyle(
                  fontFamily: "Oswald",
                  letterSpacing: 2.0,
                  fontSize: 25,
                  color: Colors.grey[900],
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                Email,
                style: TextStyle(
                  fontFamily: "Oswald",
                  letterSpacing: 2.0,
                  fontSize: 25,
                  color: Colors.amberAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
