import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiknowte/utils/navbar1.dart';
import 'package:quiknowte/auth/auth.dart';

class License extends StatefulWidget {
  License({this.auth});
  final BaseAuth auth;
  @override
  State<StatefulWidget> createState() {
    return _LicenseState();
  }
}

class _LicenseState extends State<License> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text('License'),
      ),
      drawer: NavBar1(auth: widget.auth),
      body: Container(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/license.png'),
                    fit: BoxFit.contain)),
          ),
        ),
      ),
    );
  }
}
