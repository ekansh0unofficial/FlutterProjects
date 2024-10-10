import 'package:chat_app/src/auth_pages/login_register_switch.dart';
import 'package:chat_app/src/pages/homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends StatelessWidget {
  //INIT AUTH
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  AuthService({super.key});

  //SIGN IN
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  //AUTHENTICATION
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: _auth.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Homepage();
            } else {
              return LoginOrRegister();
            }
          }),
    );
  }

  //SIGN UP
  Future<UserCredential> signUp(String email, String password) async {
    //creating a user
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    //adding user to the collection
    _firestore.collection("Users").doc(userCredential.user!.uid).set({
      'uid': userCredential.user!.uid,
      'email': email,
    });

    return userCredential;
  }

  //GET CURRENT USER
  Future<User?> getCurrentUser() async {
    User? user = _auth.currentUser;
    return user;
  }

  //SIGN OUT
  Future<void> signOut() {
    return _auth.signOut();
  }
}
