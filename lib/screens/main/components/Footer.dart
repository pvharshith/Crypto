import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/constants.dart';
import 'package:news/main.dart';
import 'package:news/screens/main/main_screen.dart';

class Footer extends StatefulWidget {
  //const Footer({Key? key}) : super(key: key);

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  TextEditingController namedata = new TextEditingController();
  TextEditingController emaildata = new TextEditingController();
  TextEditingController commentdata = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 65,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [




          ],
        ),
      ),
    );
  }
}
