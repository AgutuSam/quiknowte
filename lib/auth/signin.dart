import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiknowte/auth/auth.dart';
import 'package:quiknowte/auth/signup.dart';
import 'package:toast/toast.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

class SigninPage extends StatefulWidget {
  SigninPage({this.auth, this.onSignedIn});
  final BaseAuth auth;
  final VoidCallback onSignedIn;
  @override
  State<StatefulWidget> createState() {
    return _SigninPageState();
  }
}

class _SigninPageState extends State<SigninPage> {
  final _formKey = GlobalKey<FormState>();
  final _prformKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  final passwordResetEmail = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 700,
            child: RotatedBox(
              quarterTurns: 2,
              child: WaveWidget(
                config: CustomConfig(
                  gradients: [
                    [Colors.black, Colors.black87],
                    [Colors.blue.shade300, Colors.blue.shade500],
                  ],
                  durations: [19440, 10800],
                  heightPercentages: [0.20, 0.25],
                  blur: MaskFilter.blur(BlurStyle.solid, 10),
                  gradientBegin: Alignment.bottomLeft,
                  gradientEnd: Alignment.topRight,
                ),
                waveAmplitude: 0,
                size: Size(
                  double.infinity,
                  double.infinity,
                ),
              ),
            ),
          ),
          ListView(
            children: <Widget>[
              Form(
                key: _formKey,
                child: Container(
                  height: 450,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Signin",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                              fontSize: 28.0)),
                      Card(
                        margin: EdgeInsets.only(left: 30, right: 30, top: 30),
                        elevation: 11,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        child: TextFormField(
                          controller: email,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Email cannot be Null!';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.blue.shade400,
                              ),
                              suffixIcon: Icon(
                                Icons.check_circle,
                                color: Colors.blue.shade400,
                              ),
                              hintText: "Email",
                              hintStyle: TextStyle(color: Colors.blue.shade400),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40.0)),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 16.0)),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                        elevation: 11,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        child: TextFormField(
                          controller: password,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'password cannot be Null!';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.blue.shade400,
                              ),
                              hintText: "Password",
                              hintStyle: TextStyle(
                                color: Colors.blue.shade400,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40.0)),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 16.0)),
                          obscureText: true,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(30.0),
                        child: RaisedButton(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          color: Colors.indigo,
                          onPressed: () => signin(email.text, password.text),
                          elevation: 11,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40.0))),
                          child: Text("Signin",
                              style: TextStyle(color: Colors.white70)),
                        ),
                      ),
                      FlatButton(
                          onPressed: () => forgotPassword(),
                          child: Text("Forgot your password?",
                              style: TextStyle(color: Colors.white)))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text("or, connect with"),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ButtonTheme(
                          minWidth: width * 0.4,
                          child: OutlineButton.icon(
                            onPressed: () => signInWithGoogle(),
                            borderSide: BorderSide(color: Colors.red),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            icon: Icon(
                              FontAwesomeIcons.google,
                              color: Colors.red,
                            ),
                            label: Text(
                              "Google",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ),
                        // SizedBox(width: 10.0),
                        ButtonTheme(
                          minWidth: width * 0.4,
                          child: OutlineButton.icon(
                            onPressed: () => signInWithFacebook(),
                            borderSide: BorderSide(color: Colors.indigo),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            icon: Icon(
                              FontAwesomeIcons.facebookF,
                              color: Colors.indigo,
                            ),
                            label: Text(
                              "Facebook",
                              style: TextStyle(color: Colors.indigo),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Dont have an account?"),
                        FlatButton(
                          child: Text("Sign up"),
                          textColor: Colors.indigo,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupPage(),
                                    fullscreenDialog: true));
                          },
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

//Forgot password
  Future forgotPassword() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Form(
            key: _prformKey,
            child: AlertDialog(
              title: Text('Email'),
              content: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Email cannot be Null!';
                  }
                  return null;
                },
                style: TextStyle(color: Colors.blue),
                controller: passwordResetEmail,
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.blue.shade500),
                ),
              ),
              actions: <Widget>[
                MaterialButton(
                  onPressed: () async {
                    final formState = _prformKey.currentState;
                    if (formState.validate()) {
                      try {
                        await FirebaseAuth.instance.sendPasswordResetEmail(
                            email: passwordResetEmail.text);
                        Navigator.pop(context);
                        Toast.show(
                            'A Password Reset Link has been sent to your Email!',
                            context,
                            duration: Toast.LENGTH_LONG,
                            gravity: Toast.BOTTOM);
                      } catch (e) {
                        Toast.show(e.message, context,
                            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
                        print(e.message);
                      }
                    }
                  },
                  child: Text('Submit',
                      style: TextStyle(color: Colors.blue, fontSize: 22)),
                  elevation: 5.0,
                ),
              ],
            ),
          );
        });
  }

//EmailPassword Sign
  void signin(String email, String password) async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      try {
        FirebaseUser user = await widget.auth
            .signInWithFireBaseAuth(email: email, password: password);
        print(user.uid);
        widget.onSignedIn();
        CircularProgressIndicator();
      } catch (e) {
        Toast.show(e.message, context,
            duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
        print(e.message);
      }
    }
  }

  //Google Sign
  void signInWithGoogle() async {
    try {
      FirebaseUser user = await widget.auth.signInWithGoogle();
      print(user.uid);
      widget.onSignedIn();
      CircularProgressIndicator();
    } catch (e) {
      Toast.show(e.message, context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      print(e.message);
    }
  }

  //Facebook
  void signInWithFacebook() async {
    try {
      FirebaseUser user = await widget.auth.signInWithFacebook();
      print(user.uid);
      widget.onSignedIn();
      CircularProgressIndicator();
    } catch (e) {
      Toast.show(e.message, context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      print(e.message);
    }
  }
}
