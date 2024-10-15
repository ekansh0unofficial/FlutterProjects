import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authservice {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential?> googleSignUp() async {
    final gUser = await GoogleSignIn().signIn();

    if (gUser == null) {
      return null;
    }
    final GoogleSignInAuthentication gAuth = await gUser.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);

    try {
      if (_auth.currentUser != null && _auth.currentUser!.isAnonymous) {
        return await upgradeUser(credential);
      }
      return await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }

  Future<UserCredential> anonymousLogin() {
    return _auth.signInAnonymously();
  }

  Future<UserCredential> upgradeUser(OAuthCredential credential) {
    return _auth.currentUser!.linkWithCredential(credential);
  }
}
