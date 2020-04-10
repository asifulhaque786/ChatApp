import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Screens/StartingPage.dart';
import 'package:untitled/Screens/help.dart';
import 'package:untitled/Screens/login.dart';
import 'package:untitled/Screens/registration.dart';
import 'package:untitled/Screens/chatbox.dart';

void main() =>
    runApp(MaterialApp(
      home: StartingPage(),
      routes: <String, WidgetBuilder>{
        "page2": (BuildContext context) => LogIn(),
        "page3": (BuildContext context) => Registration(),
        "page4": (BuildContext context) => Help(),
        "page5": (BuildContext context) => ChatBox(),
      },
      debugShowCheckedModeBanner: false,
    ));


