import 'package:ethereal_seller/app_properties.dart';
import 'package:ethereal_seller/screens/main/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ethereal_seller/screens/auth/confirm_otp_page.dart';
import 'forgot_password_page.dart';
import 'dart:async';
import 'dart:io';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  TextEditingController cmfPassword = TextEditingController(text: '12345678');

  @override
  Widget build(BuildContext context) {
    Widget title = Text(
      'Glad To Meet You',
      style: TextStyle(
        color: Colors.black,
        fontSize: 34.0,
        fontWeight: FontWeight.bold,
      ),
    );

    Widget subTitle = Padding(
        padding: const EdgeInsets.only(right: 56.0),
        child: Text(
          'Create your new account to get started on the ethereal Journey',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
          ),
        ));

    Widget registerButton = Positioned(
      left: MediaQuery.of(context).size.width / 5.5,
      bottom: 40,
      top: 190,
      child: InkWell(
        onTap: () async {
          try {
            final newUser = await _auth.createUserWithEmailAndPassword(
                email: email, password: password);
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => MainPage()));
          } catch (e) {
            print(e);
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => ConfirmOtpPage()));
          }
        },
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: 80,
          child: Center(
              child: new Text("Register",
                  style: const TextStyle(
                      color: const Color(0xfffefefe),
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontSize: 20.0))),
          decoration: BoxDecoration(
              gradient: mainButton,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                  offset: Offset(0, 5),
                  blurRadius: 10.0,
                )
              ],
              borderRadius: BorderRadius.circular(9.0)),
        ),
      ),
    );

    Widget registerForm = Container(
      height: 300,
      width: MediaQuery.of(context).size.width - 50,
      child: Stack(
        children: <Widget>[
          Container(
            height: 180,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 15.0, right: 12.0, top: 10.0),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        //<-- SEE HERE
                        borderSide: BorderSide(width: 3, color: Colors.white),
                      ),
                    ),
                    onChanged: (value) {
                      email = value;
                    },
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        //<-- SEE HERE
                        borderSide: BorderSide(width: 3, color: Colors.white),
                      ),
                    ),
                    onChanged: (value) {
                      password = value;
                    },
                    style: TextStyle(fontSize: 16.0),
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextField(
                    controller: cmfPassword,
                    style: TextStyle(fontSize: 16.0),
                    obscureText: true,
                  ),
                ),
              ],
            ),
          ),
          registerButton,
        ],
      ),
    );

    Widget socialRegister = Column(
      children: <Widget>[
        Text(
          'You can sign in with',
          style: TextStyle(
              fontSize: 12.0, fontStyle: FontStyle.italic, color: Colors.black),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.email),
              onPressed: () {},
              color: Colors.black,
            ),
            IconButton(
                icon: Icon(Icons.phone), onPressed: () {}, color: Colors.black),
          ],
        )
      ],
    );

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Spacer(flex: 3),
                title,
                Spacer(),
                subTitle,
                Spacer(flex: 1),
                registerForm,
                Spacer(flex: 2),
                Padding(
                    padding: EdgeInsets.only(bottom: 20), child: socialRegister)
              ],
            ),
          ),
          Positioned(
            top: 45,
            left: 5,
            child: IconButton(
              color: Colors.black,
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
