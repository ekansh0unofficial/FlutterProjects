import 'dart:io';

import 'package:chatbot/src/components/message_bubble.dart';
import 'package:chatbot/src/components/myalertbox.dart';
import 'package:chatbot/src/components/mytextbox.dart';
import 'package:chatbot/src/services/open_ai_api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController controller = TextEditingController();
  final List<Map<String, dynamic>> messages = [];
  final OpenAiApi api = OpenAiApi();
  bool isLoading = false; // Track loading state

  void sendMessage(BuildContext context) async {
    if (controller.text.trim().isNotEmpty) {
      setState(() {
        messages.add({'text': controller.text.trim(), 'isUser': true});
        isLoading = true; // Start loading
      });

      try {
        var response = await api.getResponse(controller.text.trim());
        setState(() {
          messages.add({'text': response ?? "Error Occurred", 'isUser': false});
        });
      } on HttpException catch (e) {
        showDialog(
          context: context,
          builder: (context) => MyAlertbox(message: e.message),
        );
      } finally {
        setState(() {
          isLoading = false; // Stop loading
        });
      }

      controller.clear(); // Clear input field
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: MyTextfield(
                    controller,
                    label: "Entry",
                    obscure: false,
                    icon: false,
                  ),
                ),
                const SizedBox(width: 8), // Add space between input and icon
                IconButton(
                  icon: const Icon(Icons.arrow_circle_right_rounded),
                  iconSize: 40, // Increase icon size
                  onPressed: () => sendMessage(context),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Expanded(
              child: isLoading
                  ? const Center(
                      child: CircularProgressIndicator()) // Loading indicator
                  : _buildChatWithOpenAI(), // Chat messages
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatWithOpenAI() {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        return MessageTile(
          text: messages[index]['text'],
          isUser: messages[index]['isUser'],
        );
      },
    );
  }
}
