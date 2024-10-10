import 'package:chat_app/src/components/myalertbox.dart';
import 'package:chat_app/src/components/mydrawer.dart';
import 'package:chat_app/src/components/mytextfield.dart';
import 'package:chat_app/src/services/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/message_bubble.dart';

class Chatpage extends StatelessWidget {
  final String recieversMail;
  final String receiverId;

  late TextEditingController _controller = TextEditingController();

  Chatpage({super.key, required this.recieversMail, required this.receiverId});

  final ChatService _chatService = ChatService();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void sendMessage() async {
    if (_controller.text.isNotEmpty) {
      await _chatService.sendMessage(receiverId, _controller.text);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(recieversMail)),
        drawer: const Mydrawer(),
        body: Column(children: [
          Expanded(child: _buildMessageList()),
          _buildMessageInput()
        ]));
  }

  Widget _buildMessageList() {
    User? sender = _auth.currentUser;
    return StreamBuilder(
        stream: _chatService.getMessage(sender!.uid, receiverId),
        builder: (context, snapshot) {
          //error
          if (snapshot.hasError) {
            return const MyAlertbox();
          }
          //loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView(
                children: snapshot.data!.docs
                    .map((doc) => _buildMessageItem(doc))
                    .toList());
          }
        });
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    var data = doc.data() as Map<String, dynamic>;

    User? sender = _auth.currentUser;

    bool isCurrentUser = data['senderId'] == sender!.uid;

    return MessageBubble(
        message: data["message"], isCurrentUser: isCurrentUser);
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
              child: MyTextfield(
            _controller,
            label: "",
            hintText: "Enter your message",
            icon: false,
          )),
          IconButton(onPressed: sendMessage, icon: Icon(Icons.send))
        ],
      ),
    );
  }
}
