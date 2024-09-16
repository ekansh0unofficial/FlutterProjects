import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learn_auth/src/components/my_textbox.dart';
import 'package:learn_auth/src/services/cloud_firestore_service.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController textController = TextEditingController();
  FireStoreService fireStoreService = FireStoreService();

  final String uid = FirebaseAuth.instance.currentUser!.uid;

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  void openNotesBox() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: MyTextfield(
              textController,
              label: "Note",
              obscure: false,
              icon: false,
            ),
            actions: [
              TextButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.black),
                ),
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  textController.clear();
                  Navigator.pop(context);
                },
              ),
              TextButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.black),
                ),
                child: const Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  // Add note to Firestore when "Save" is pressed
                  fireStoreService.addNoteForUser(uid, textController.text);
                  textController.clear();
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        foregroundColor: Colors.white,
        title: const Text("JUST ANOTHER NOTES APP"),
        actions: [
          IconButton(onPressed: signOut, icon: const Icon(Icons.logout))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: openNotesBox, // Now calls the dialog properly
        backgroundColor: Colors.black54,
        elevation: 0,
        hoverElevation: 1,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: StreamBuilder(
        stream: fireStoreService.getUserNotesStream(uid),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text("Error loading notes."));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
                child: Text("No notes available. Start writing!"));
          }

          List<DocumentSnapshot> notesList = snapshot.data!.docs;

          return ListView.builder(
            itemCount: notesList.length,
            itemBuilder: (context, index) {
              DocumentSnapshot documentSnapshot = notesList[index];
              Map<String, dynamic> data =
                  documentSnapshot.data() as Map<String, dynamic>;
              String noteText = data['note'];

              return Card(
                child: ListTile(
                  title: Text(noteText),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () => fireStoreService.updateUserNote(
                            documentSnapshot.id, textController.text, uid),
                        icon: const Icon(Icons.settings),
                      ),
                      IconButton(
                        onPressed: () => fireStoreService.deleteNote(
                            documentSnapshot.id, uid),
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
