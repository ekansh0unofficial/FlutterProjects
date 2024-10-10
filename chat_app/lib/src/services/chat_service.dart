import 'package:chat_app/src/model/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
  //get instance of the firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //get user stream

  /*
    List<Map<String , dynamic >>
    {
      'email':
      'id' : 
    }
  */
  Stream<List<Map<String, dynamic>>> getUserStream() {
    //convert the map of maps to list of maps
    return _firestore.collection("Users").snapshots().map((snapshot) {
      //makes the map of user
      return snapshot.docs.map((doc) {
        final user = doc.data();
        return user;
      }).toList();
    });
  }

  //send messages
  Future<void> sendMessage(String recieverId, message) async {
    //getting current user info
    final String currentUserId = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;

    //timestamp for each message
    final Timestamp timestamp = Timestamp.now();

    //creating a new message
    Message newMessage = Message(
        message: message,
        senderId: currentUserId,
        senderEmail: currentUserEmail,
        recieverId: recieverId,
        timestamp: timestamp);

    //a unique room id
    List<String> ids = [currentUserId, recieverId];
    ids.sort(); // this assures that same room is assigned to both users

    String chatRoomId = ids.join("_");

    //add new message to database
    await _firestore
        .collection("chatrooms")
        .doc(chatRoomId)
        .collection("messages")
        .add(newMessage.toMap());
  }

  // get messages
  Stream<QuerySnapshot> getMessage(String userId, otherUserId) {
    List<String> ids = [userId, otherUserId];
    ids.sort();
    var chatroomId = ids.join("_");
    return _firestore
        .collection("chatrooms")
        .doc(chatroomId)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
