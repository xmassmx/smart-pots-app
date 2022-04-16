import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthenticationHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;

  //SIGN UP METHOD
  Future signUp({email, password}) async {
    print(email);
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }


  Future addUser({Name}) async{
    FirebaseFirestore.instance.collection('Users').doc(_auth.currentUser?.uid).set({
      'Name':Name
    });
  }
  //SIGN IN METHOD
  Future signIn({ email, password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email.trim(), password: password.trim());
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //SIGN OUT METHOD
  Future signOut() async {
    await _auth.signOut();

    print('signout');
  }
}