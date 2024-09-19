import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');

  Future<void> addNoteForUser(String uid, String note) {
    return users.doc(uid).collection('notes').add({
      'note': note,
      'timestamp': Timestamp.now(),
    });
  }

  Stream<QuerySnapshot> getUserNotesStream(String uid) {
    return users
        .doc(uid)
        .collection('notes')
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  Future<void> updateUserNote(String uid, String docID, String newNote) {
    return users
        .doc(uid)
        .collection('notes')
        .doc(docID)
        .update({'note': newNote, 'timestamp': Timestamp.now()});
  }

  Future<void> deleteNote(String uid, String docID) {
    return users.doc(uid).collection('notes').doc(docID).delete();
  }
}
