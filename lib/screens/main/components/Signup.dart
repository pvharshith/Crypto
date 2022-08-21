import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/models/user.dart';
import 'package:news/screens/main/components/Login.dart';
import 'package:news/screens/main/main_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _auth = FirebaseAuth.instance;


  final _formKey = GlobalKey<FormState>();

  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      cursorColor: Colors.black,

      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      style: TextStyle(
        fontSize: 20
      ),
      decoration: InputDecoration(
          //  prefixIcon: Icon(Icons.mail),
          // contentPadding: EdgeInsets.zero
          hintText: "Enter your email address...",
          hintStyle: TextStyle(color: Colors.black,
              fontSize: 17
          ),
          fillColor: Colors.white,
          filled: true,
          labelStyle: GoogleFonts.poppins(
            fontSize: 20,
          ),
          contentPadding: EdgeInsets.only(left: 20, right: 50),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2.5, color: Colors.black),
              borderRadius: BorderRadius.circular(10))),
    );
    SizedBox(
      height: 10,
    );
    final passwordField = TextFormField(
      cursorColor: Colors.black,

      autofocus: false,
      controller: passwordEditingController,
      obscureText: true,
      onSaved: (value) {
        passwordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      style: TextStyle(
          fontSize: 20
      ),
      decoration: InputDecoration(
          //  prefixIcon: Icon(Icons.mail),
          // contentPadding: EdgeInsets.zero
          hintText: "Enter your password...",
          hintStyle: TextStyle(color: Colors.black,
              fontSize: 17

          ),
          fillColor: Colors.white,
          filled: true,
          labelStyle: GoogleFonts.poppins(
            fontSize: 20,
          ),
          contentPadding: EdgeInsets.only(left: 20, right: 50),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2.5, color: Colors.black),
              borderRadius: BorderRadius.circular(10))),
    );
    SizedBox(
      height: 10,
    );
    final confirmPasswordField = TextFormField(
      cursorColor: Colors.black,

      autofocus: false,
      controller: confirmPasswordEditingController,
      obscureText: true,
      validator: (value) {
        if (confirmPasswordEditingController.text !=
            passwordEditingController.text) {
          return "password dosen't match";
        }
        return null;
      },
      onSaved: (value) {
        confirmPasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.done,
      style: TextStyle(
          fontSize: 20
      ),
      decoration: InputDecoration(
          //  prefixIcon: Icon(Icons.mail),
          // contentPadding: EdgeInsets.zero
          hintText: "Confirm your password...",
          hintStyle: TextStyle(
            color: Colors.black,
            fontSize: 17
          ),
          fillColor: Colors.white,
          filled: true,
          labelStyle: GoogleFonts.poppins(
            fontSize: 20,
          ),
          contentPadding: EdgeInsets.only(left: 20, right: 50),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2.5, color: Colors.black),
              borderRadius: BorderRadius.circular(10))),
    );
    SizedBox(
      height: 10,
    );
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: Colors.black,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          signUp(emailEditingController.text, passwordEditingController.text);
        },
        child: Text(
          "Sign up",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );

    return Scaffold(
      body: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.transparent,
        elevation: 50,
        child: Container(
          width: 500,
          height: 450,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,

                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  emailField,
                  SizedBox(
                    height: 20,
                  ),
                  passwordField,
                  SizedBox(
                    height: 20,
                  ),
                  confirmPasswordField,
                  SizedBox(
                    height: 20,
                  ),
                  signUpButton,
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Already have an account? ",
                        style: GoogleFonts.poppins(),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginWidget()));
                        },
                        child: Text(
                          "Log in",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 15),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Close',
                          style: TextStyle(fontSize: 15, fontFamily: 'Raleway'),
                          textAlign: TextAlign.end,
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.red,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                postDetailsToFirestore(),
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirestore() async {
    //calling firestore
    //calling user model
    //sending thses values
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();
    //writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully");
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
        (route) => false);
  }
}
