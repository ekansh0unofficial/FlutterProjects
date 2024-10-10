import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final message;
  final bool isCurrentUser;

  const MessageBubble(
      {super.key, required this.message, required this.isCurrentUser});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:
            isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: isCurrentUser
                    ? Colors.green[500]
                    : Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Text(message,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondary,
                  fontWeight: FontWeight.w500,
                )),
          )
        ],
      ),
    );
  }
}
