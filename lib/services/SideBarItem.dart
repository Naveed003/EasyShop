import 'package:easy_shop/Pages/profile.dart';
import 'package:flutter/material.dart';

class SideBarTile extends StatelessWidget {
  IconData icon;
  String text;
  Function ontap;
  var user;
  SideBarTile(this.icon, this.text, this.ontap);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: Colors.grey,
        ))),
        child: InkWell(
          splashColor: Colors.blueAccent,
          onTap: ontap,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(icon),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    text,
                    style: TextStyle(
                      fontFamily: "RobotoCondensed",
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
