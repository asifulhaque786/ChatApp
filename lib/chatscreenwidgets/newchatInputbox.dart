import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:untitled/userchat.dart';

final authenticate = FirebaseAuth.instance;
FirebaseUser loggedInperson;
String emailId;
final firestore = Firestore.instance;

class NewChat extends StatefulWidget {
  @override
  _NewChatState createState() => _NewChatState();
}

class _NewChatState extends State<NewChat> {
  final stringcontrollerss = new TextEditingController();

  void submit() {
    if (stringcontrollerss.text.isEmpty == true) {
      return;
    }

    final tbc = stringcontrollerss.text;
    firestore.collection('chats').add({
      'email': loggedInperson.email,
      'message': tbc,
      'timestamp': DateTime.now().millisecondsSinceEpoch
    });

    //addtx(tbc);
  }

  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Container(
        width: 298,
        margin: EdgeInsets.only(top: 12, left: 2, right: 3, bottom: 30),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Color.fromRGBO(130, 148, 251, 13),
                  blurRadius: 20,
                  offset: Offset(10, 10))
            ]),
        child: TextField(
            textCapitalization: TextCapitalization.sentences,
            onSubmitted: (_) {
              stringcontrollerss.clear();
              submit();
            },
            cursorColor: Colors.black,
            enableSuggestions: true,
            controller: stringcontrollerss,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "type here",
              icon: Icon(Icons.chevron_right),
            )),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 22),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(130, 148, 251, 3),
                      blurRadius: 10,
                      offset: Offset(10, 10))
                ]),
            child: IconButton(
              icon: Icon(Icons.ac_unit),
              onPressed: () {
                submit();
                stringcontrollerss.clear();
                // chatlistss.clear();
              },
            )),
      )
    ]);
  }
}
