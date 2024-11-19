import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../model/message.dart';
import '../../services/chatservice.dart';
import '../global_components/myalertbox.dart';

class MessageOptionsButton extends StatelessWidget {
  final Message message;

  MessageOptionsButton({super.key, required this.message});
  final Chatservice _chat = Chatservice();

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.keyboard_arrow_down_sharp,
          color: Colors.white70, size: 16),
      onSelected: (String value) {
        if (value == 'delete') {
          _deleteMessage(context);
        } else if (value == 'info') {
          _showMessageInfo(context);
        }
      },
      itemBuilder: (BuildContext context) {
        return [
          const PopupMenuItem<String>(
            value: 'delete',
            child: Text('Delete Message'),
          ),
          const PopupMenuItem<String>(
            value: 'info',
            child: Text('Message Info'),
          ),
        ];
      },
    );
  }

  void _deleteMessage(BuildContext context) {
    _chat.deleteCurrentMessage(message.timeStamp, message.receiverId);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Message Deleted')),
    );
  }

  void _showMessageInfo(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => MyAlertbox(
              iconColor: Colors.amber,
              title: "Info",
              icon: Icons.notifications,
              message: "time : ${_formatTimestamp(message.timeStamp)} ",
            ));
  }

  String _formatTimestamp(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    return "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
  }
}
