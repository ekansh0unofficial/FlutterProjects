// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String message;
  String receiverId; // Corrected typo
  String senderId;
  Timestamp timeStamp;

  Message({
    required this.message,
    required this.receiverId, // Corrected typo
    required this.senderId,
    required this.timeStamp,
  });

  Message copyWith({
    String? message,
    String? receiverId, // Corrected typo
    String? senderId,
    Timestamp? timeStamp,
  }) {
    return Message(
      message: message ?? this.message,
      receiverId: receiverId ?? this.receiverId,
      senderId: senderId ?? this.senderId,
      timeStamp: timeStamp ?? this.timeStamp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'receiverId': receiverId,
      'senderId': senderId,
      'timeStamp': timeStamp,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      message: map['message'] as String,
      receiverId: map['receiverId'] as String,
      senderId: map['senderId'] as String,
      timeStamp: map['timeStamp'] as Timestamp,
    );
  }
}
