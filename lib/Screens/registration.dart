import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:untitled/animation/FadeIn.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Registration extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RegistrationState();
  }
}

class RegistrationState extends State<Registration> {
  final firstnamecontroller = new TextEditingController();
  final lastnamecontroller = new TextEditingController();
  final passwordcontroller = new TextEditingController();
  final confirmpasswordcontroller = new TextEditingController();
  final phonenumbercontroller = new TextEditingController();
  final _authenticationuser = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(children: <Widget>[
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
                          /*left: ,
                              right: ,
                              height: ,*/
                          child: FadeIn(
                            1,
                            Container(
                              margin: EdgeInsets.only(top: 99, left: 55),
                              child: Text(
                                "REGISTER",
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
                      controller: firstnamecontroller,
                      autocorrect: true,
                      cursorColor: Colors.black,
                      enableSuggestions: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "FIRST NAME",
                        icon: Icon(Icons.assignment_ind),
                      )),
                ),
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
                      controller: lastnamecontroller,
                      cursorColor: Colors.black,
                      enableSuggestions: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "EMAIL ID",
                        icon: Icon(Icons.email),
                      )),
                ),
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
                      controller: passwordcontroller,
                      obscureText: true,
                      cursorColor: Colors.black,
                      enableSuggestions: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "ENTER PASSWORD(MIN 7 CHARACTER)",
                        icon: Icon(Icons.arrow_forward),
                      )),
                ),
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
                      controller: confirmpasswordcontroller,
                      obscureText: true,
                      autocorrect: true,
                      cursorColor: Colors.black,
                      enableSuggestions: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "CONFIRM PASSWORD",
                        icon: Icon(Icons.arrow_forward),
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
                      controller: phonenumbercontroller,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.black,
                      enableSuggestions: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "YOUR 10 DIGIT PHONE NUMBER",
                        icon: Icon(Icons.chevron_right),
                      )),
                ),
              ),
              FadeIn(
                6,
                Container(
                  margin:
                      EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(143, 148, 251, 1),
                        Color.fromRGBO(143, 148, 251, 6)
                      ])),
                  child: FlatButton(
                    onPressed: () async {
                      if (firstnamecontroller.text.isEmpty ||
                          lastnamecontroller.text.isEmpty ||
                          passwordcontroller.text.isEmpty ||
                          confirmpasswordcontroller.text.isEmpty ||
                          phonenumbercontroller.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: "Some feilds are empty",
                            backgroundColor: Colors.red,
                            textColor: Colors.white);
                      } else if (phonenumbercontroller.text.length == 10) {
                        if (passwordcontroller.text ==
                            confirmpasswordcontroller.text) {
                          if (lastnamecontroller.text.contains("@gmail.com") ==
                              true) {
                            try {
                              final newuser = await _authenticationuser
                                  .createUserWithEmailAndPassword(
                                email: lastnamecontroller.text,
                                password: passwordcontroller.text,
                              );

                              if (newuser != null) {
                                Fluttertoast.showToast(
                                    msg:
                                        "you have been registered successfully",
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white);

                                Navigator.of(context).pushNamed("page2");
                              } else {}
                            } catch (e) {
                              /*Fluttertoast.showToast(
                                msg: "there is already a user",
                                backgroundColor: Colors.green,
                                textColor: Colors.white);*/
                            }
                          } else {
                            Fluttertoast.showToast(msg: "invalid email id");
                          }
                        } else {
                          Fluttertoast.showToast(
                              msg: "password dont match",
                              backgroundColor: Colors.red,
                              textColor: Colors.white);
                        }
                      } else {
                        Fluttertoast.showToast(
                            msg: "phone no is not 10 digit",
                            backgroundColor: Colors.red,
                            textColor: Colors.white);
                      }
                    },
                    child: Text(
                      "SIGNUP",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              FadeIn(
                  7,
                  Center(
                    child: FlatButton(
                      child: Text(
                        "help?",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed("page4");
                      },
                    ),
                  ))
            ],
          ),
        ),
      ]),
    );
  }
}
