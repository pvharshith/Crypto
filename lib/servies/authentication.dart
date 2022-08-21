import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Authentication extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  late String email;

  String get getEmail {
    return email;
  }

  Future registerWithEmailAndPassword(String email, String password) async {
    UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;

    email = user!.email!;
    print(email);
    notifyListeners();
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    UserCredential userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    User? user = userCredential.user;

    email = user!.email!;
    print(email);
    notifyListeners();
  }
}
