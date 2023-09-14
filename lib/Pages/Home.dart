import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:easy_shop/services/API.dart";
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  FirebaseUser user;

  var IP;

  Home(UserDetails, ip) {
    this.user = UserDetails;
    this.IP = ip;
  }

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var listt;
  var _data;
  var lists;
  var _t;

  List IP_ADDRESSES = [];
  void api(url) async {
    if (mounted) {
      _data = await GetData(url);
      if (mounted) {
        setState(() {
          listt = _data;
        });
      }
    }
  }

  var _dataa;
  var _list;
  Future<String> apiAdd(url) async {
    if (mounted) {
      _dataa = await GetData(url);
      return _dataa;
    }
  }

  Future<String> msg(BuildContext context, MESSAGE) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            content: Text(
              MESSAGE,
              style: TextStyle(
                fontFamily: "Oswald",
                fontSize: 20,
                letterSpacing: 2,
              ),
            ),
            actions: [
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                child: Text("OK"),
                color: Colors.blue,
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  TextEditingController DIALOGUECONTROLLER = TextEditingController();

  Future<String> CreateAdd(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: Text("Paste URL of Product"),
            content: TextField(
                enableInteractiveSelection: true,
                autofocus: true,
                controller: DIALOGUECONTROLLER,
                decoration: InputDecoration(
                  labelText: "URL",
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[900],
                  ),
                )),
            actions: [
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                child: Text("Add"),
                color: Colors.blue,
                onPressed: () async {
                  if (mounted) {
                    setState(() {
                      this._t = DIALOGUECONTROLLER.text.toString();
                    });
                  }

                  Navigator.pop(context);
                  DIALOGUECONTROLLER.clear();
                  if (this._t.contains("https://") &&
                          this._t.contains("https://www.amazon.in/") ||
                      this._t.contains("https://www.amazon.com.br/") ||
                      this._t.contains("https://www.amazon.ca/") ||
                      this._t.contains("https://www.amazon.com.mx/") ||
                      this._t.contains("https://www.amazon.com/") ||
                      this._t.contains("https://www.amazon.sg/") ||
                      this._t.contains("https://www.amazon..com.tr/") ||
                      this._t.contains("https://www.amazon.ae/") ||
                      this._t.contains("https://www.amazon.fr/") ||
                      this._t.contains("https://www.amazon.nl/") ||
                      this._t.contains("https://www.amazon.es/") ||
                      this._t.contains("https://www.amazon.co.uk/") ||
                      this._t.contains("https://www.amazon.com.au/")) {
                    if (this._t.contains("/dp/")) {
                      var URL = "https://" +
                          widget.IP.toString() +
                          ":8098/Add/" +
                          widget.user.uid.toString() +
                          "/" +
                          this._t.toString();
                      await apiAdd(URL);
                      Refresh();
                      msg(_scaffoldKey.currentContext, _dataa)
                          .then((value) => null);
                    } else {
                      _dataa = "INVALID URL";
                      msg(context, _dataa).then((value) => null);
                    }
                  } else {
                    _dataa = "INVALID URL";
                    msg(context, _dataa).then((value) => null);
                  }
                },
              )
            ],
          );
        });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<List> Refresh() async {
    await Future.delayed(Duration(seconds: 2));
    var url = "https://" +
        widget.IP.toString() +
        ":8098/fetch/" +
        widget.user.uid.toString() +
        "/" +
        widget.user.displayName.toString() +
        "/" +
        widget.user.email.toString();

    api(url);
    if (mounted) {
      setState(() {
        listt = _data;
      });
    }
    return listt;
  }

  var url;
  @override
  void initState() {
    var url = "https://" +
        widget.IP.toString() +
        ":8098/fetch/" +
        widget.user.uid.toString() +
        "/" +
        widget.user.displayName.toString() +
        "/" +
        widget.user.email.toString();

    var dat = api(url);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (listt != null) {
      return new Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "WELCOME\n" +
                          widget.user.displayName.toString().toUpperCase(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "BodoniModa",
                          fontSize: 20),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 300,
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(widget.user.photoUrl),
                    ),
                  ],
                ),
                Divider(
                  height: 20,
                  color: Colors.white,
                ),
                new Expanded(
                  child: RefreshIndicator(
                    onRefresh: Refresh,
                    child: ListView.builder(
                      itemCount: listt?.length,
                      itemBuilder: (context, index) {
                        var initial = listt[index][1].toString();
                        var current = listt[index][2].toString();
                        var store = listt[index][5];

                        var subtitlee =
                            "\nStore: $store\nInital Price: $initial\nCurrent Price: $current";

                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 1.0, horizontal: 1),
                          child: Card(
                            color: Colors.transparent,
                            child: ListTile(
                              /*trailing: isLiked
                                      ? RawMaterialButton(
                                          onPressed: _onPressed(),
                                          child: Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          ),
                                        )
                                      : RawMaterialButton(
                                          onPressed: _onPressed(),
                                          child: Icon(
                                            Icons.favorite_border,
                                          ),
                                        ),*/
                              leading: CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    NetworkImage(listt[index][3], scale: 3),
                              ),
                              subtitle: Text(
                                subtitlee,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              ),
                              onTap: () async {
                                String open = listt[index][4];
                                if (await canLaunch(open))
                                  await launch(open);
                                else
                                  throw 'Could not launch ' +
                                      this.url.toString();
                              },
                              title: Text(
                                listt[index][0],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "RobotoCondensed",
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: Padding(
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.add,
                color: Colors.black,
              ),
              onPressed: () {
                CreateAdd(context).then((value) {});
              },
            ),
            padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
          ));
    } else {
      return new Scaffold(
          key: UniqueKey(),
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Column(
              key: UniqueKey(),
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "WELCOME\n" + widget.user.displayName.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "BodoniModa",
                          fontSize: 20),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 300,
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(widget.user.photoUrl),
                    ),
                  ],
                ),
                Divider(
                  height: 20,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          floatingActionButton: Padding(
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.add,
                color: Colors.black,
              ),
              onPressed: () {
                CreateAdd(context).then((value) {
                  var url = DIALOGUECONTROLLER.text.toString();
                  DIALOGUECONTROLLER.clear();
                });
              },
            ),
            padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
          ));
    }
  }
}
