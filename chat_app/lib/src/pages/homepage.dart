import 'package:chat_app/src/auth_pages/services/auth_service.dart';
import 'package:chat_app/src/components/myalertbox.dart';
import 'package:chat_app/src/components/myusertile.dart';
import 'package:chat_app/src/pages/chatpage.dart';
import 'package:chat_app/src/services/chat_service.dart';
import 'package:flutter/material.dart';

import '../components/mydrawer.dart';

class Homepage extends StatelessWidget {
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  void logout() {
    AuthService().signOut();
  }

  Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      drawer: const Mydrawer(),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return FutureBuilder(
      future: _authService.getCurrentUser(),
      builder: (context, currentUserSnapshot) {
        if (currentUserSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (currentUserSnapshot.hasError) {
          return const MyAlertbox();
        }

        final currentUserEmail = currentUserSnapshot.data?.email ?? '';

        return StreamBuilder(
          stream: _chatService.getUserStream(),
          builder: (context, snapshot) {
            //error
            if (snapshot.hasError) {
              return const MyAlertbox();
            }

            //loading
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            //return the list, excluding the current user
            final filteredUsers = snapshot.data!
                .where((user) => user['email'] != currentUserEmail)
                .toList();

            return ListView.builder(
              itemCount: filteredUsers.length,
              itemBuilder: (context, index) {
                final userData = filteredUsers[index];
                return _buildUserListItem(userData, context);
              },
            );
          },
        );
      },
    );
  }

  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    return UserTile(
        text: userData["email"],
        onTap: () =>
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Chatpage(
                recieversMail: userData["email"],
                receiverId: userData["uid"],
              );
            })));
  }
}
