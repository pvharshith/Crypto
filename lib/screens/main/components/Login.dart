import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/screens/main/components/Signup.dart';
import 'package:news/screens/main/main_screen.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool _obscuretext = true;
  final _formkey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      cursorColor: Colors.black,
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please enter your email");
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      style: TextStyle(fontSize: 20),
      decoration: InputDecoration(
          //  prefixIcon: Icon(Icons.mail),
          // contentPadding: EdgeInsets.zero
          hintText: "Enter your email address...",
          hintStyle: TextStyle(color: Colors.black, fontSize: 17),
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
      obscureText: _obscuretext,
      controller: passwordController,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter valid password(min. 6 character)");
        }
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      style: TextStyle(fontSize: 20),
      decoration: InputDecoration(
          //  prefixIcon: Icon(Icons.mail),
          // contentPadding: EdgeInsets.zero
          hintText: "Enter your password...",
          hintStyle: TextStyle(color: Colors.black, fontSize: 17),
          fillColor: Colors.white,
          filled: true,
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
    Spacer();
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: Colors.black,
      child: MaterialButton(
        onPressed: () {
          signIn(emailController.text, passwordController.text);
        },
        child: Text(
          "Login",
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
        elevation: 50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.transparent,
        child: Container(
          width: 500,
          height: 350,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                    //width: 100,
                  ),
                  emailField,
                  SizedBox(
                    height: 20,
                  ),
                  passwordField,
                  SizedBox(
                    height: 20,
                  ),
                  loginButton,
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "New to CRYPTO? ",
                        style: GoogleFonts.poppins(),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp()));
                        },
                        child: Text(
                          "Sign up",
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

  void signIn(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Log in Successful"),
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => MainScreen()))
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}
