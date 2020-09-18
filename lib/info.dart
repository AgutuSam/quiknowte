import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiknowte/utils/navbar1.dart';
import 'package:quiknowte/auth/auth.dart';

class Info extends StatefulWidget {
  Info({this.auth});
  final BaseAuth auth;
  @override
  State<StatefulWidget> createState() {
    return _InfoState();
  }
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text('About'),
      ),
      drawer: NavBar1(auth: widget.auth),
      body: Container(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(18.0),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/info.png'), fit: BoxFit.contain)),
          ),
        ),
      ),
    );
  }
}
