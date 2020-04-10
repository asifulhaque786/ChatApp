import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/Screens/login.dart';
import 'package:untitled/chatscreenwidgets/newchatInputbox.dart';

import 'package:untitled/chatscreenwidgets/userchat.dart';

var person12 = true;

class ChatBox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ChatBoxState();
  }
}

class ChatBoxState extends State<ChatBox> {


  Widget build(BuildContext context) {
    final drawerhead = UserAccountsDrawerHeader(
      arrowColor: Colors.deepPurple,
      decoration: BoxDecoration(color: Colors.deepPurple),
      accountName: Text("ME"),
      accountEmail: Text("$emailId"),
      currentAccountPicture: CircleAvatar(
        child: FlutterLogo(
          colors: Colors.deepPurple,
          size: 42,
        ),
        backgroundColor: Colors.white,
      ),
    );
    final draweritems = ListView(
      children: <Widget>[
        drawerhead,
        Container(
            alignment: Alignment.topLeft,
            //margin: EdgeInsets.only(left: 5, bottom: 50),
            child: RaisedButton(
              child: Container(
                  height: 70,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.call_missed_outgoing,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text("SIGN  OUT"),
                      ),
                    ],
                  )),
              color: Colors.white,
              onPressed: () {
                authenticate.signOut();
                Navigator.pop(context);
                Fluttertoast.showToast(
                    msg: "logged out",
                    backgroundColor: Colors.red,
                    textColor: Colors.white);
                Navigator.pop(context);
              },
            )),

      ],
    );
    return Scaffold(
      appBar: AppBar(
        /*leading: IconButton(
          icon: Icon(Icons.apps),
          onPressed: () {},
        ),*/
        backgroundColor: Colors.deepPurple,
        title: Text(
          "RAVEN>",
          style: TextStyle(
              color: Colors.white, fontFamily: 'Lobster', fontSize: 29),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              Fluttertoast.showToast(
                  msg: "Syncing...",
                  backgroundColor: Colors.green,
                  textColor: Colors.white);
              setState(() {
                getcurrentperson();
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[UserChat()],
      )),
      drawer: Drawer(child: draweritems),
    );
  }
}
