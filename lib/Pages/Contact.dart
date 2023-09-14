import 'package:flutter/material.dart';
import "package:easy_shop/services/API.dart";

class ContactPage extends StatefulWidget {
  final TextEditingController FirstNameController = TextEditingController();
  final TextEditingController LastNameController = TextEditingController();
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController MessageController = TextEditingController();
  var FirstName;
  var LastName;
  var Email;
  var Message;
  var IP;
  ContactPage(ip) {
    this.IP = ip;
  }
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  var _data;

  void api(url) async {
    _data = await GetData(url);
  }

  @override
  Widget build(BuildContext context) {
    var screenwidth = MediaQuery.of(context).size.width;
    var screenheight = MediaQuery.of(context).size.height;

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
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              "CONTACT US",
              style: TextStyle(
                fontFamily: "Oswald",
                letterSpacing: 2,
              ),
            ),
            centerTitle: true,
            backgroundColor: Color(0xFF0D1137),
          ),
          body: Padding(
            padding: const EdgeInsets.all(11.0),
            child: ListView(
              children: [
                SizedBox(
                  height: screenheight * 0.02,
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[350],
                      ),
                      width: screenwidth / 2.5,
                      child: TextField(
                        controller: widget.FirstNameController,
                        decoration: InputDecoration.collapsed(
                          border: InputBorder.none,
                          hintText: "FIRST NAME",
                          hintStyle: TextStyle(
                            fontFamily: "Oswald",
                            letterSpacing: 2,
                          ),
                        ),
                        maxLines: 1,
                        autofocus: false,
                      ),
                    ),
                    SizedBox(
                      width: screenwidth / 7,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[350],
                      ),
                      width: screenwidth / 2.5,
                      child: TextField(
                        controller: widget.LastNameController,
                        decoration: InputDecoration.collapsed(
                          border: InputBorder.none,
                          hintText: "LAST NAME",
                          hintStyle: TextStyle(
                            fontFamily: "Oswald",
                            letterSpacing: 2,
                          ),
                        ),
                        maxLines: 1,
                        autofocus: false,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: screenheight / 30,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[350],
                  ),
                  child: TextField(
                    controller: widget.EmailController,
                    decoration: InputDecoration.collapsed(
                      border: InputBorder.none,
                      hintText: "EMAIL ID",
                      hintStyle: TextStyle(
                        fontFamily: "Oswald",
                        letterSpacing: 2,
                      ),
                    ),
                    maxLines: 1,
                    autofocus: false,
                  ),
                ),
                SizedBox(
                  height: screenheight / 18,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[350],
                  ),
                  child: TextField(
                    controller: widget.MessageController,
                    maxLines: (screenheight / 50).toInt(),
                    decoration: InputDecoration.collapsed(
                      border: InputBorder.none,
                      hintText: "MESSAGE",
                      hintStyle: TextStyle(
                        fontFamily: "Oswald",
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenheight / 30,
                ),
                Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          child: Text(
                            "SUBMIT",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: "Oswald",
                              letterSpacing: 2,
                            ),
                          ),
                          color: Colors.redAccent,
                          onPressed: () {
                            widget.FirstName =
                                widget.FirstNameController.text.toString() +
                                    "/";
                            widget.LastName =
                                widget.LastNameController.text.toString() + "/";
                            widget.Email =
                                widget.EmailController.text.toString() + "/";
                            widget.Message =
                                widget.MessageController.text.toString();

                            var url = "https://" +
                                widget.IP.toString() +
                                ":8098/Contact/" +
                                widget.FirstName +
                                widget.LastName +
                                widget.Email +
                                widget.Message;

                            api(url);
                            Navigator.pop(context);

                            widget.FirstName = "";
                            widget.LastName = "";
                            widget.Email = "";

                            widget.Message = "";
                            widget.MessageController.clear();
                            widget.EmailController.clear();
                            widget.FirstNameController.clear();
                            widget.LastNameController.clear();
                          }),
                    ))
              ],
            ),
          )),
    );
  }
}
