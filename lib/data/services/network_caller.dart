import 'package:firebase_auth/firebase_auth.dart';

class NetworkCaller {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> sendEmailVerification(String email) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: 'TempPass@123',
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        try {
          await _auth.signInWithEmailAndPassword(
            email: email,
            password: 'TempPass@123',
          );
        } catch (_) {
          return false;
        }
      } else {
        return false;
      }
    }

    try {
      await _auth.currentUser?.sendEmailVerification();
      await _auth.signOut();
      return true;
    } catch (e) {
      print('Verification email error: $e');
      return false;
    }
  }
}
