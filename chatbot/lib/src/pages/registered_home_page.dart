import 'dart:io';

import 'package:chatbot/src/components/message_bubble.dart';
import 'package:chatbot/src/components/myalertbox.dart';
import 'package:chatbot/src/components/mytextbox.dart';
import 'package:chatbot/src/services/open_ai_api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class RegisteredHomePage extends StatefulWidget {
  RegisteredHomePage({super.key});

  @override
  State<RegisteredHomePage> createState() => _RegisteredHomePageState();
}

class _RegisteredHomePageState extends State<RegisteredHomePage> {
  final TextEditingController controller = TextEditingController();

  final List<Map<String, dynamic>> messages = [];

  final OpenAiApi api = OpenAiApi();

  void sendMessage(BuildContext context) async {
    if (controller.text.trim().isNotEmpty) {
      setState(() {
        messages.add({'text': controller.text.trim(), 'isUser': true});
      });

      try {
        var response = await api.getResponse(controller.text.trim());
        setState(() {
          messages.add({'text': response ?? "Error Occured", 'isUser': false});
        });
      } on HttpException catch (e) {
        showDialog(
            context: context,
            builder: (context) => MyAlertbox(
                  message: e.message,
                ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
      children: [
        const SizedBox(
          height: 12,
        ),
        Row(
          children: [
            MyTextfield(
              controller,
              label: "Entry",
              obscure: false,
              icon: false,
            ),
            IconButton(
              icon: Icon(Icons.arrow_circle_right_rounded),
              onPressed: () => sendMessage(context),
            )
          ],
        ),
        _buildChatWithOpenAI()
      ],
    )));
  }

  Widget _buildChatWithOpenAI() {
    return ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return MessageTile(
              text: messages[index]['text'], isUser: messages[index]['isUser']);
        });
  }
}
