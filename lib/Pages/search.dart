import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'dart:core';
import 'package:easy_shop/services/API.dart';

// ignore: must_be_immutable
class Search extends StatefulWidget {
  FirebaseUser user;
  var IP;

  Search(UserDetails, ip) {
    this.user = UserDetails;
    this.IP = ip;
  }
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blue[800],
    );
  }
}
