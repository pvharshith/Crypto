import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFFF3B1D);
const kDarkBlackColor = Color(0xFF191919);
const kBgColor = Color(0xFFE7E7E7);
const kBodyTextColor = Color(0xFF666666);

const kDefaultPadding = 15.0;
const kMaxWidth = 1400.0;
const kDefaultDuration = Duration(milliseconds: 250);

final Future<FirebaseApp> initialization = Firebase.initializeApp();
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;
