import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiknowte/utils/navbar1.dart';
import 'package:quiknowte/auth/auth.dart';

class Help extends StatefulWidget {
  Help({this.auth});
  final BaseAuth auth;
  @override
  State<StatefulWidget> createState() {
    return _HelpState();
  }
}

class _HelpState extends State<Help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      drawer: NavBar1(auth: widget.auth),
      body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/elephant.jpg'),
                      fit: BoxFit.cover)),
            ),
    );
  }
}
