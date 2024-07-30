import 'package:firebase_auth/firebase_auth.dart';

class SignUpFunctions {
  Future<String?> registerUser(
      {required String email, required String pwd}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pwd,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return e.message;
    } catch (e) {
      print(e);
    }
  }


}
