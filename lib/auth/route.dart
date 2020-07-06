import 'package:flutter/material.dart';
import 'package:quiknowte/auth/auth.dart';
import 'package:quiknowte/auth/signin.dart';
import 'package:quiknowte/home.dart';

class RoutePage extends StatefulWidget {
  RoutePage({this.auth});
  final BaseAuth auth;
  @override
  State<StatefulWidget> createState() => _RoutePageState();
}

enum AuthStatus { notSignedIn, signedIn }

class _RoutePageState extends State<RoutePage> {
  AuthStatus authStatus = AuthStatus.notSignedIn;

  @override
  initState() {
    super.initState();
    widget.auth.currentUser().then((user) => setState(() {
          authStatus =
              user.uid == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
        }));
  }

  void _signedIn() {
    setState(() {
      authStatus = AuthStatus.signedIn;
    });
  }

  void _signedOut() {
    setState(() {
      authStatus = AuthStatus.notSignedIn;
    });
  }

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.notSignedIn:
        return SigninPage(auth: widget.auth, onSignedIn: _signedIn);
      case AuthStatus.signedIn:
        return StartHomePage(auth: widget.auth, onSignedOut: _signedOut);
    }
  }
}
