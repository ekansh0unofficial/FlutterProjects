import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  signInwithGoogle() async {
    //begins the process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    //user cancels the sign in
    if (gUser == null) return;
    //obtains the authentication details
    final GoogleSignInAuthentication gAuth = await gUser.authentication;
    //obtain the credentials of users
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    //login using firebase
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
