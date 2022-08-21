import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/models/user.dart';
import 'package:news/screens/main/components/Contact%20us.dart';
import 'package:news/screens/main/components/Login.dart';
import 'package:news/screens/main/components/Signup.dart';
import 'package:news/screens/main/main_screen.dart';

import '../../../constants.dart';

class Header extends StatefulWidget {
  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  User? user = FirebaseAuth.instance.currentUser;

  UserModel loggedInUser = UserModel();

  @override
  // void initState() {
  //   super.initState();
  //   FirebaseFirestore.instance
  //       .collection("users")
  //       .doc(user!.uid)
  //       .get()
  //       .then((value) {
  //     this.loggedInUser = UserModel.fromMap(value.data());
  //     setState(() {});
  //   });
  // }

  //final MenuController _controller = Get.put(MenuController());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: kDarkBlackColor,
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              // constraints: BoxConstraints(maxWidth: kMaxWidth),
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Crypto.',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 23,
                          fontFamily: "Raleway",
                        ),
                      ),
                      Spacer(),
                      Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginWidget()),
                              );
                            },
                            child: Text("Login",
                                style: GoogleFonts.poppins(
                                    fontSize: 18, color: Colors.white)),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUp()));
                              },
                              child: Text(
                                "Signup",
                                style: GoogleFonts.poppins(
                                    fontSize: 18, color: Colors.white),
                              )),
                        ],
                      ),
                      Column(
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ContactPage()));
                              },
                              child: Text(
                                "Contact us",
                                style: GoogleFonts.poppins(
                                    fontSize: 18, color: Colors.white),
                              )),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            ActionChip(
                                label: Text(
                                  "Logout",
                                  style: GoogleFonts.poppins(fontSize: 18),
                                ),
                                onPressed: () {
                                  logout(context);
                                })
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => MainScreen()));
  }
}
