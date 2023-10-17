import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearn/data/models/response.dart';
import 'package:elearn/data/models/user_model.dart';
import 'package:elearn/utils/data_constants/firestore_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupService {
  //this function will be used to register new user into database
  final fsinstance = FirebaseFirestore.instance;

//when user choose to login with email, this will check user credentials and returns response

  Future<String?> signUpWithEmail({
    required String name,
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      await user!.updateDisplayName(name);
      await user.reload();
      user = auth.currentUser;
      return 'registered';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return ('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        return ('The account already exists for that email.');
      } else {
        return e.message.toString();
      }
    }
  }

//when user choose to login with email, this will check user credentials and returns response
  Future<bool> signUpWithGoogle({required NewUser user}) async {
    try {
      await fsinstance
          .collection(usercollectRefName)
          .doc(user.email.trim())
          .set(NewUser.toJson(user));
      return true;
    } catch (e) {
      return false;
    }
  }
}
