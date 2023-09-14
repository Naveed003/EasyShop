import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:easy_shop/services/auth.dart';
import 'package:easy_shop/main.dart';
import 'package:firebase_database/firebase_database.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0XFFe52165),
            Color(0xFF0D1137),
          ],
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: Body(),
      ),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  FirebaseUser user;

  var IP;

  @override
  void initState() {
    super.initState();

    AuthService().signOutGoogle();
  }

  void click() async {
    List IP_ADDRESSES = [];

    final AuthService _auth = AuthService();
    final DatabaseReference databaseReference = FirebaseDatabase.instance
        .reference()
        .child("fir-9741b-default-rtdb/IpAddress");

    databaseReference.once().then((DataSnapshot snapshot) {
      var KEYS = snapshot.value.keys;

      var VALUES = snapshot.value;

      for (var KEY in KEYS) {
        var IP = VALUES[KEY]["IP_ADDR"];
        IP_ADDRESSES.clear();
        IP_ADDRESSES.add(IP);
      }
    });
    await _auth.signInWithGoogle();
  }

  Widget googleLoginButton() {
    // ignore: deprecated_member_use
    return OutlineButton(
        onPressed: this.click,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
        splashColor: Colors.grey,
        borderSide: BorderSide(color: Colors.black),
        child: Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(image: AssetImage('assets/img/google.png'), height: 35),
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text('Sign in with Google',
                        style: TextStyle(color: Colors.black, fontSize: 25)))
              ],
            )));
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
        Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.white,
              size: 200,
            )),
        SizedBox(
          height: 30,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            "EASY SHOP",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Lobster",
                fontWeight: FontWeight.normal,
                letterSpacing: 2.0,
                fontSize: 60),
          ),
        ),
        SizedBox(
          height: 175,
        ),
        Align(alignment: Alignment.center, child: googleLoginButton()),
      ],
    );
  }
}
