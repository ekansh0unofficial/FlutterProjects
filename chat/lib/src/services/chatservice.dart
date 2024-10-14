import 'package:cloud_firestore/cloud_firestore.dart';

import '../auth_pages/authservice.dart';
import '../model/message.dart';

class Chatservice {
  //init firestore
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Authservice _authservice = Authservice();

  //fetch the current active user list
  Stream<List<Map<String, dynamic>>> getUsersStream() {
    String currentUserId = _authservice.getCurrentUserId()!;

    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.where((doc) => doc.id != currentUserId).map((doc) {
        final user = doc.data();
        return user;
      }).toList();
    });
  }

  //create a room
  String createNewRoom(String receiverId) {
    String senderId = _authservice.getCurrentUserId()!;
    List<String> ids = [senderId, receiverId]..sort();

    final chatRoomId = "${ids[0]}_${ids[1]}";
    return chatRoomId;
  }

  //send message
  Future<void> sendMessage(String receiverId, String message) async {
    if (message.trim().isEmpty) {
      return;
    }
    final map = Message(
            message: message,
            receiverId: receiverId,
            senderId: _authservice.getCurrentUserId()!,
            timeStamp: Timestamp.now())
        .toMap();
    String chatId = createNewRoom(receiverId);
    await _firestore
        .collection("chat")
        .doc(chatId)
        .collection("messages")
        .add(map);
  }

  //recieve message
  Stream<List<Message>> recieveMessageList(String receiverId) {
    String chatId = createNewRoom(receiverId);
    return _firestore
        .collection("chat")
        .doc(chatId)
        .collection("messages")
        .orderBy("timeStamp", descending: false)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Message.fromMap(doc.data());
      }).toList();
    });
  }

  deleteCurrentMessage(Timestamp timestamp, String recieverId) async {
    String chatRoomId = createNewRoom(recieverId);
    try {
      final result = await _firestore
          .collection('chat')
          .doc(chatRoomId)
          .collection('messages')
          .where("timeStamp", isEqualTo: timestamp)
          .get();
      for (var doc in result.docs) {
        doc.reference.delete();
      }
    } catch (e) {
      print("Error deleting message: $e");
      throw Exception("Failed to delete the message");
    }
  }
}
