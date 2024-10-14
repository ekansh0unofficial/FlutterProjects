import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authservice {
  // Instances of FirebaseAuth and Firestore
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Login
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      _handleAuthError(e);
      rethrow;
    }
  }

  // Register
  Future<UserCredential> registerNewUser(String email, String password) async {
    try {
      var userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _firestore.collection("Users").doc(userCredential.user!.uid).set({
        "uid": userCredential.user!.uid,
        "email": userCredential.user!.email,
      });
      return userCredential;
    } on FirebaseAuthException catch (e) {
      _handleAuthError(e);
      rethrow;
    }
  }

  // Logout
  Future<void> logOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw Exception('Error logging out: ${e.toString()}');
    }
  }

  // Get current user's email
  String? getCurrentUserEmail() {
    return _auth.currentUser?.email;
  }

  // Get current user's ID
  String? getCurrentUserId() {
    return _auth.currentUser?.uid;
  }

  // Stream to monitor authentication state changes
  Stream<User?> authStateChanges() {
    return _auth.authStateChanges();
  }

  // Error handling for FirebaseAuth
  void _handleAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        throw Exception('No user found with this email.');
      case 'wrong-password':
        throw Exception('Invalid password.');
      case 'email-already-in-use':
        throw Exception('The email is already registered.');
      case 'weak-password':
        throw Exception('The password is too weak.');
      case 'invalid-email':
        throw Exception('Invalid email format.');
      default:
        throw Exception('Authentication error: ${e.message}');
    }
  }
}
