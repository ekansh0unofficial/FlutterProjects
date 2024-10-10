import 'package:chat_app/src/auth_pages/services/auth_service.dart';
import 'package:chat_app/src/pages/homepage.dart';
import 'package:chat_app/src/pages/settingspage.dart';
import 'package:flutter/material.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
    AuthService auth = AuthService();
    return Drawer(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const DrawerHeader(
                  child: Center(
                child: Icon(
                  Icons.message,
                  size: 100,
                ),
              )),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("HOME"),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Homepage())),
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("SETTINGS"),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Settingspage())),
              ),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("LOGOUT"),
            onTap: auth.signOut,
          )
        ],
      ),
    ));
  }
}
