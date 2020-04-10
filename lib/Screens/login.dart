import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:untitled/animation/FadeIn.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/chatscreenwidgets/newchatInputbox.dart';

bool progress = false;

void getcurrentperson() async {
  try {
    final user = await authenticate.currentUser();
    if (user != null) {
      loggedInperson = user;
      emailId = loggedInperson.email.toString().toUpperCase();
      print(loggedInperson.email);
    } else {}
  } catch (e) {
    print(e);
  }
}

class LogIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LogInState();
  }
}

class LogInState extends State<LogIn> {
  final usernamecontroller = new TextEditingController();
  final passwordcontroller2 = new TextEditingController();
  final _authenticateuser = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /*theme: ThemeData(fontFamily: 'Lobster'),*/
      home: Scaffold(
        backgroundColor: Colors.white,
        body: (progress == true)
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Container(
                        margin: EdgeInsets.all(8),
                        child: CircularProgressIndicator()),
                  ),
                  Text(
                    "LOADING....",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blue),
                  )
                ],
              )
            : ListView(children: <Widget>[
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Column(
                    children: <Widget>[
                      FadeIn(
                        1,
                        Container(
                            width: double.infinity,
                            margin: EdgeInsets.all(5),
                            height: 340,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage("assest/pic1.png"),
                                    fit: BoxFit.fill)),
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  child: FadeIn(
                                    1,
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 80, left: 100),
                                      child: Text(
                                        "LOGIN",
                                        style: TextStyle(
                                            fontFamily: 'Lobster',
                                            fontSize: 60,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )),
                      ),
                      FadeIn(
                        2,
                        Container(
                          margin: EdgeInsets.only(top: 30, left: 20, right: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(143, 148, 251, 10),
                                    blurRadius: 20,
                                    offset: Offset(10, 10))
                              ]),
                          child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              controller: usernamecontroller,
                              autocorrect: true,
                              cursorColor: Colors.black,
                              enableSuggestions: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "EMAIL ID",
                                icon: Icon(Icons.account_circle),
                              )),
                        ),
                      ),
                      FadeIn(
                        3,
                        Container(
                          margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(143, 148, 251, 10),
                                    blurRadius: 20,
                                    offset: Offset(10, 10))
                              ]),
                          child: TextField(
                              controller: passwordcontroller2,
                              cursorColor: Colors.black,
                              enableSuggestions: true,
                              obscureText: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "PASSWORD",
                                icon: Icon(Icons.lock),
                              )),
                        ),
                      ),
                      FadeIn(
                        4,
                        Container(
                          margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(143, 148, 251, 1),
                                Color.fromRGBO(143, 148, 251, 6)
                              ])),
                          child: FlatButton(
                            onPressed: () async {
                              if (passwordcontroller2.text.isEmpty ||
                                  usernamecontroller.text.isEmpty) {
                                if (passwordcontroller2.text.isEmpty == true) {
                                  Fluttertoast.showToast(msg: "feild empty");
                                }
                                if (usernamecontroller.text.isEmpty == true) {
                                  Fluttertoast.showToast(msg: "feild empty");
                                }
                              } else {
                                setState(() {
                                  progress = true;
                                });
                                try {
                                  final user2 = await _authenticateuser
                                      .signInWithEmailAndPassword(
                                    email: usernamecontroller.text,
                                    password: passwordcontroller2.text,
                                  );
                                  if (user2 != null) {
                                    Fluttertoast.showToast(
                                        msg: "you have been loged in",
                                        backgroundColor: Colors.green,
                                        textColor: Colors.white);

                                    getcurrentperson();

                                    Navigator.of(context).pushNamed("page5");
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: "invalid username/password",
                                        backgroundColor: Colors.red,
                                        textColor: Colors.white);
                                  }
                                } catch (e) {
                                  Fluttertoast.showToast(
                                      msg: "invalid username/password",
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white);
                                }
                                setState(() {
                                  progress = false;
                                });
                              }
                            },
                            child: Text(
                              "  LOGIN  ",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      FadeIn(
                        4,
                        Container(
                            margin: EdgeInsets.all(20),
                            child: FlatButton(
                              child: Text("forgot password?"),
                              onPressed: () {
                                Navigator.of(context).pushNamed("page4");
                              },
                            )),
                      ),
                    ],
                  ),
                ),
              ]),
      ),
    );
  }
}
