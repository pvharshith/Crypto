import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news/screens/main/components/Login.dart';
import 'package:news/screens/main/components/Signup.dart';
import 'package:news/servies/user.dart';
import '../../../constants.dart';
import '../../../responsive.dart';

class SiginIn extends StatefulWidget {
  const SiginIn({
    Key? key,
  }) : super(key: key);

  @override
  State<SiginIn> createState() => _SiginInState();
}

class _SiginInState extends State<SiginIn> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedinuser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedinuser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isMobile(context))
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              overlayColor: MaterialStateProperty.resolveWith(
                (states) {
                  return states.contains(MaterialState.pressed)
                      ? Colors.white10
                      : null;
                },
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginWidget()),
              );
            },
            child: Text(
              'Log in',
              style: TextStyle(
                fontSize: 18,
                fontFamily: "Raleway",
              ),
            ),
          ),
        SizedBox(width: kDefaultPadding),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => StreamBuilder<User>(
                          // stream: FirebaseAuth.instance.authStateChanges(),
                          // stream: FirebaseAuth.instance.authStateChanges(),
                          builder: (context, snapshot) {
                        return SignUp();
                      })),
            );
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding * 1.0,
              vertical:
                  kDefaultPadding / (Responsive.isDesktop(context) ? 1 : 2),
            ),
          ),
          child: Text(
            "Sign up",
            style: TextStyle(
              fontSize: 18,
              fontFamily: "Raleway",
            ),
          ),
        ),
      ],
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginWidget()));
  }
}
