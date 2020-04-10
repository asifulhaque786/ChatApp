import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled/chatscreenwidgets/ChatSniplets.dart';

class ChatList extends StatelessWidget {
  List<ChatSniplet> imported_list = [];

  ChatList(this.imported_list);

  Widget build(BuildContext context) {
    return Container(
      height: 540,
      margin: EdgeInsets.only(top: 5, left: 1, right: 1, bottom: 6),
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage("assest/pic1.png"), fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(130, 148, 251, 13),
                blurRadius: 20,
                offset: Offset(5, 5))
          ]),
      child: Stack(
        children: <Widget>[
          ListView(
              scrollDirection: Axis.vertical,
              children: (imported_list).map((aaa) {
                return Container(
                  //height: 24,
                  padding: EdgeInsets.only(left: 3),
                  child: (aaa.isMe == true)
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "${aaa.sender.toString()}",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.bold),
                            ),
                            (Text("${aaa.messagetextttt}",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black))),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("${aaa.sender.toString()}",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.deepPurple,
                                    fontWeight: FontWeight.bold)),
                            (Text("${aaa.messagetextttt}",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black))),
                          ],
                        ),
                  margin: (aaa.isMe == true)
                      ? (EdgeInsets.only(
                          top: 2, bottom: 7, right: 4, left: 170))
                      : (EdgeInsets.only(
                          top: 2, bottom: 7, right: 170, left: 4)),
                  decoration: (aaa.isMe == true)
                      ? (BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(9)))
                      : (BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(9))),
                );
              }).toList())
        ],
      ),
    );
  }
}
