import 'dart:io';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:easy_shop/services/auth.dart';
import 'Pages/About.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Pages/login.dart';
import 'Pages/Home.dart';
import 'Pages/search.dart';
import 'Pages/profile.dart';
import 'Pages/Contact.dart';
import 'services/Https.dart';
import 'services/SideBarItem.dart';
import "services/API.dart";
import 'package:easy_shop/services/wrapper.dart';
import 'package:rate_my_app/rate_my_app.dart';

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  ((X509Certificate cert, String host, int port) => true);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Wrapper(),
  ));
}

class HomePage extends StatefulWidget {
  var UserDetails;
  var IP;
  HomePage(user, ip) {
    this.UserDetails = user;
    this.IP = ip;
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _auth = AuthService();
  int _currentindex = 0;
  @override
  Widget build(BuildContext context) {
    void onTapBar(int index) {
      setState(() {
        _currentindex = index;
      });
    }

    var UserDetails = widget.UserDetails;
    var IP = widget.IP;
    final List<Widget> _children = [
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0XFFe52165),
              Color(0xFF0D1137),
            ],
          ),
        ),
        child: Home(UserDetails, IP),
      ),
    ];
    final List<Widget> _Titles = [
      Row(
        children: [
          Text(
            "EASY SHOP",
            style: TextStyle(
              fontFamily: "Lobster",
              color: Colors.white,
              letterSpacing: 2,
              fontSize: 40,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.shopping_cart_outlined,
            color: Colors.white,
            size: 40,
          ),
        ],
      ),
      Text(
        "SEARCH",
        style: TextStyle(
          fontFamily: "Oswald",
          color: Colors.white,
          letterSpacing: 2,
        ),
      ),
      Text(
        "PROFILE",
        style: TextStyle(
          fontFamily: "Oswald",
          color: Colors.white,
          letterSpacing: 2,
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0D1137),
        centerTitle: true,
        title: _Titles[_currentindex],
      ),
      body: _children[0],
      /*bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        height: 65,
        color: Colors.white,
        backgroundColor: Colors.blue[800],
        onTap: onTapBar,
        items: <Widget>[
          Icon(
            Icons.home_outlined,
            color: Colors.black,
          ),
          Icon(
            Icons.search_outlined,
            color: Colors.black,
          ),
          Icon(
            Icons.person,
            color: Colors.black,
          ),
        ],
      ),*/
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0XFFe52165),
                      Color(0xFF0D1137),

                      /*
                      Colors.indigo,
                      Colors.blue[600],
                      Colors.blue[700],
                      Colors.blue[800],
                      Colors.blue[900],
                      */
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black,
                            width: 3,
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          size: MediaQuery.of(context).size.width * 0.30,
                        ),
                      ),
                    ),
                    Text(
                      "EASY SHOP",
                      style: TextStyle(
                        fontFamily: "Lobster",
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.11,
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SideBarTile(Icons.message, "CONTACT US", () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ContactPage(widget.IP)));
            }),
            /*SideBarTile(Icons.info_outline, "ABOUT", () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => About()));
            }),*/
            SideBarTile(Icons.logout, "SIGNOUT", () async {
              await _auth.signOut();
              print("signout");
            }),
            SideBarTile(Icons.exit_to_app, "EXIT", () => SystemNavigator.pop()),
          ],
        ),
      ),
    );
  }
}
