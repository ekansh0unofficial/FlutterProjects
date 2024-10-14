import 'package:flutter/material.dart';

import '../components/global_components/mydrawer.dart';
import '../services/chatservice.dart';
import 'chatpage.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  final Chatservice _chatservice = Chatservice();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("H O M E P A G E"),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      drawer: Mydrawer(),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: _chatservice.getUsersStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No users available.'),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final user = snapshot.data![index];
              return _buildUserItem(user, context);
            },
          );
        },
      ),
    );
  }

  Widget _buildUserItem(Map<String, dynamic> user, BuildContext context) {
    final email = user["email"] ?? "Unknown";
    final uid = user["uid"] ?? "";

    return GestureDetector(
      onTap: () {
        if (uid.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Chatpage(
                receiverEmail: email,
                receiverId: uid,
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Invalid user details.')),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          email,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
