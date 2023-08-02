import 'package:ethereal_seller/app_properties.dart';
import 'package:ethereal_seller/firebase_options.dart';
import 'package:ethereal_seller/screens/main/main_page.dart';
import 'package:ethereal_seller/screens/auth/forgot_password_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'register_page.dart';

class WelcomeBackPage extends StatefulWidget {
  @override
  _WelcomeBackPageState createState() => _WelcomeBackPageState();
}

class _WelcomeBackPageState extends State<WelcomeBackPage> {
  @override
  void initState() {
    initialize();
    super.initState();
  }

  Future initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';

  // TextEditingController email = TextEditingController(text: '');
  //
  // TextEditingController password = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget welcomeBack = Text(
      'Welcome to Ethereal Seller,',
      style: TextStyle(
        color: Colors.black,
        fontSize: 34.0,
        fontWeight: FontWeight.bold,
      ),
    );

    Widget subTitle = Padding(
        padding: const EdgeInsets.only(right: 56.0),
        child: Text(
          'Login to your account using\nyour Email Address',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
          ),
        ));

    Widget loginButton = Positioned(
      left: MediaQuery.of(context).size.width / 5.5,
      bottom: 40,
      child: InkWell(
        onTap: () async {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => MainPage(),
            ),
          );
          //TODO add the mail to firebase
          // try {
          //   final loggedUser = await _auth.signInWithEmailAndPassword(
          //       email: email, password: password);
          //   if (loggedUser == null) {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(
          //         builder: (_) => MainPage(),
          //       ),
          //     );
          //   } else {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(
          //         builder: (_) => RegisterPage(),
          //       ),
          //     );
          //   }
          // } catch (e) {
          //   print(e);
          // }
        },
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: 80,
          child: Center(
              child: new Text("Log In",
                  style: const TextStyle(
                      color: const Color(0xfffefefe),
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal,
                      fontSize: 20.0))),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(236, 60, 3, 1),
                  Color.fromRGBO(234, 60, 3, 1),
                  Color.fromRGBO(216, 78, 16, 1),
                ],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.16),
                offset: Offset(0, 5),
                blurRadius: 10.0,
              )
            ],
            borderRadius: BorderRadius.circular(9.0),
          ),
        ),
      ),
    );

    Widget loginForm = Container(
      height: 300,
      width: MediaQuery.of(context).size.width - 50,
      child: Stack(
        children: <Widget>[
          Container(
            height: 160,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(left: 28.0, right: 40.0),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
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
                      email = value;
                    },
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
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
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                    obscureText: true,
                  ),
                ),
              ],
            ),
          ),
          loginButton,
        ],
      ),
    );

    Widget forgotPassword = Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Forgot your password? ',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.grey,
              fontSize: 14.0,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => ForgotPasswordPage(),
                ),
              );
            },
            child: Text(
              'Reset password',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
          ),
        ],
      ),
    );

    Widget signup = Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Don\'t have an account? ',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.grey,
              fontSize: 14.0,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => RegisterPage(),
                ),
              );
            },
            child: Text(
              'Create new Account',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Spacer(flex: 3),
                welcomeBack,
                Spacer(),
                subTitle,
                Spacer(flex: 2),
                loginForm,
                Spacer(flex: 2),
                signup,
                forgotPassword
              ],
            ),
          )
        ],
      ),
    );
  }
}
