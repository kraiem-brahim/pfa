import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pfa/models/user_model.dart';
import 'package:pfa/pages/Home.dart';
import 'login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _auth = FirebaseAuth.instance;

  final formkey = GlobalKey<FormState>();
  final FirstName = new TextEditingController();
  final LastName = new TextEditingController();
  final email = new TextEditingController();
  final password = new TextEditingController();
  final confpassword = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final FirstName_field = TextFormField(
      autofocus: false,
      controller: FirstName,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("Please Enter your name");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter a valid name");
        }
        return null;
      },
      onSaved: (value) {
        FirstName.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_box),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "FirstName",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
    final LastName_field = TextFormField(
      autofocus: false,
      controller: LastName,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{2,}$');
        if (value!.isEmpty) {
          return ("Please Enter your lastname");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter a valid last name");
        }
        return null;
      },
      onSaved: (value) {
        LastName.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_box_rounded),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "LastName",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
    final email_field = TextFormField(
      autofocus: false,
      controller: email,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        email.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
    final password_field = TextFormField(
      autofocus: false,
      controller: password,
      obscureText: true,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Please Enter your password");
        }
        if (!regex.hasMatch(value)) {
          return ("Please Enter a valid password");
        }
      },
      onSaved: (value) {
        password.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.password_rounded),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
    final confpassword_field = TextFormField(
      autofocus: false,
      controller: confpassword,
      obscureText: true,
      validator: (value) {
        if (confpassword.text != password.text) {
          return ("Password don't match");
        }
        return null;
      },
      onSaved: (value) {
        confpassword.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.password),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "confirm Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
    final signup_buttun = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(50),
      color: Color(0xff4d79ff),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          singUp(email.text, password.text);
        },
        child: Text(
          "SignUp",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(35.0),
            color: Colors.white,
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 200,
                    child: Image.asset(
                      "assets/logo.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  FirstName_field,
                  SizedBox(
                    height: 25,
                  ),
                  LastName_field,
                  SizedBox(
                    height: 20,
                  ),
                  email_field,
                  SizedBox(
                    height: 20,
                  ),
                  password_field,
                  SizedBox(
                    height: 20,
                  ),
                  confpassword_field,
                  SizedBox(
                    height: 20,
                  ),
                  signup_buttun,
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Do you have an account?"),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: Text(
                          "LogIn",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.blue.shade300),
                        ),
                      )
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

  void singUp(String mail, String pass) async {
    if (formkey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: mail, password: pass)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }

  postDetailsToFirestore() async {
    //calling firestore
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    Usermodel usermodel = new Usermodel();
    usermodel.email = user!.email;
    usermodel.uid = user.uid;
    usermodel.name = FirstName.text;
    usermodel.lastname = LastName.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(usermodel.toMap());
    Fluttertoast.showToast(
      msg: "account created",
      gravity: ToastGravity.BOTTOM,
    );
    Navigator.pushAndRemoveUntil((this.context),
        MaterialPageRoute(builder: (context) => Home()), (route) => false);
  }
}
