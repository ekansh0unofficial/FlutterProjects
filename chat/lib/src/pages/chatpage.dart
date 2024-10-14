import 'package:flutter/material.dart';

import '../components/global_components/mytextbox.dart';
import '../components/message_components/message_tile.dart';
import '../model/message.dart';
import '../services/chatservice.dart';

class Chatpage extends StatelessWidget {
  Chatpage({super.key, required this.receiverId, required this.receiverEmail});

  final String receiverId;
  final String receiverEmail;
  final Chatservice _chatservice = Chatservice();
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          receiverEmail,
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Expanded to display the list of messages
            Expanded(
              child: StreamBuilder<List<Message>>(
                stream: _chatservice.recieveMessageList(receiverId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('Error loading messages'),
                    );
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final message = snapshot.data![index];
                      return MessageTile(message: message);
                    },
                  );
                },
              ),
            ),
            // Text input for sending new messages
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Row(
                children: [
                  Expanded(
                    child: MyTextfield(
                      _controller,
                      label: "",
                      hintText: "Enter Text",
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (_controller.text.trim().isNotEmpty) {
                        _chatservice.sendMessage(
                          receiverId,
                          _controller.text.trim(),
                        );
                        _controller.clear(); // Clear input after sending
                      }
                    },
                    icon: const Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
