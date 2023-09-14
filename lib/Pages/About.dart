import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      appBar: AppBar(
        title: Text(
          "ABOUT",
          style: TextStyle(
            fontFamily: "Oswald",
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            """
Easy Shop is an application to track prices. It is designed toease the pleasure of online shopping. It tracks down the prices of amazon products regularly and informs you when the prices drop by sending a Email. Amazon users dont have to check regularly for price drops as this app will do the job
            """,
            style: TextStyle(
              fontFamily: "Oswald",
              fontSize: MediaQuery.of(context).size.width * 0.085,
              letterSpacing: 2,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
