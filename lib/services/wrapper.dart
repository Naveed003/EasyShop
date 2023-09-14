import 'package:easy_shop/Pages/login.dart';
import 'package:easy_shop/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          FirebaseUser user = snapshot.data;
          if (user == null) {
            return LoginPage();ai
          }

          final DatabaseReference databaseReference = FirebaseDatabase.instance
              .reference()
              .child("fir-9741b-default-rtdb/IpAddress");
          List IP_ADDRESSES = [];
          var a = databaseReference.once().then((DataSnapshot snapshot) {
            var KEYS = snapshot.value.keys;

            var VALUES = snapshot.value;

            for (var KEY in KEYS) {
              var IP = VALUES[KEY]["IP_ADDR"];
              IP_ADDRESSES.clear();
              IP_ADDRESSES.add(IP);
            }
          });
          return HomePage(user, "92.97.132.245");
        } else {
          return Scaffold();
        }
      },
    );
  }
}
