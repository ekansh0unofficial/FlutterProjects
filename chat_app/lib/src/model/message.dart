import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderId;
  final String senderEmail;
  final String recieverId;
  final message;
  final Timestamp timestamp;

  Message({
    required this.message,
    required this.senderId,
    required this.senderEmail,
    required this.recieverId,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'senderId': senderId,
      'senderEmail': senderEmail,
      'recieverId': recieverId,
      'timestamp': timestamp,
    };
  }
}
