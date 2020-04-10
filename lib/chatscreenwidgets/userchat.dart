import 'package:flutter/material.dart';
import 'package:untitled/chatscreenwidgets/chatlist.dart';
import 'package:untitled/chatscreenwidgets/ChatSniplets.dart';
import 'package:untitled/chatscreenwidgets/newchatInputbox.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

List<ChatSniplet> chatlistss = [
  ChatSniplet(messagetextttt: "WELCOME TO RAVEN MESSAGING APP BY ASIF")
];

class UserChat extends StatefulWidget {
  @override
  _UserChatState createState() => _UserChatState();
}

class _UserChatState extends State<UserChat> {
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        StreamBuilder<QuerySnapshot>(
            stream: firestore
                .collection('chats')
                .orderBy(
                  "timestamp",
                )
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              chatlistss.clear();
              final messages = snapshot.data.documents;
              for (var message in messages) {
                final messageText = message.data['message'];
                final senders = message.data['email'];
                final currentUser = loggedInperson.email;
                final newtx = ChatSniplet(
                    messagetextttt: messageText,
                    isMe: currentUser == senders,
                    sender: senders);

                chatlistss.add(newtx);
              }
              return ChatList(chatlistss);
            }),
        NewChat(),
      ],
    );
  }
}
