import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:quiknowte/auth/auth.dart';
import 'package:quiknowte/screen_size.dart';
import 'package:quiknowte/utils/oval-right-clipper.dart';
import 'package:toast/toast.dart';
import 'dart:async';

import '../help.dart';
import '../home.dart';
import '../info.dart';

class NavBar1 extends StatefulWidget {
  NavBar1({this.auth, this.onSignedOut});
  final BaseAuth auth;
  final VoidCallback onSignedOut;
  @override
  State<StatefulWidget> createState() => _NavBar1State();
}

class _NavBar1State extends State<NavBar1> {
  final Color color1 = Color(0xffFA696C);
  final Color color2 = Color(0xffFA8165);
  final Color color3 = Color(0xffFB8964);
  final Color primary = Colors.white;
  final Color active = Colors.grey.shade800;
  final Color divider = Colors.grey.shade600;
  FirebaseUser auser;

  user() async {
    final FirebaseUser thisuser = await widget.auth.currentUser();
    setState(() {
      auser = thisuser;
    });
  }

  @override
  void initState() {
    user();
    super.initState();
  }

  void _signOut() async {
    try {
      await widget.auth.signOutFireBaseAuth();
      await widget.auth
          .signOutGoogle()
          .whenComplete(() async => await widget.auth.signOutFireBaseAuth());
      await widget.auth
          .signOutFacebook()
          .whenComplete(() async => await widget.auth.signOutFireBaseAuth());
      widget.onSignedOut();
    } catch (e) {
      Toast.show(e.toString(), context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      print(e.toString());
    }
  }

  @override
  // Widget build(BuildContext context) {
  //   return _buildDrawer(context);
  // }

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // final String image = images[0];
    return ClipPath(
      clipper: OvalRightBorderClipper(),
      child: Drawer(
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 40),
          decoration: BoxDecoration(
              color: primary, boxShadow: [BoxShadow(color: Colors.black45)]),
          width: 300,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  // Container(
                  //   alignment: Alignment.centerRight,
                  //   child: IconButton(
                  //     icon: Icon(
                  //       Icons.power_settings_new,
                  //       color: active,
                  //     ),
                  //     onPressed: () {
                  //       _key.currentState.openEndDrawer();
                  //     },
                  //   ),
                  // ),
                  Container(
                    height: 90,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [Colors.blueGrey, Colors.blue])),
                    child: CircleAvatar(
                        radius: 44.5,
                        backgroundImage: '${auser?.photoUrl}' != null ||
                                '${auser?.photoUrl}' != 'null'
                            ? NetworkImage('${auser?.photoUrl}')
                            : AssetImage('assets/origami3.jpg')),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    '${auser?.displayName}' != null &&
                            '${auser?.displayName}' != 'null'
                        ? '${auser?.displayName}'
                        : 'Anonymous User',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '${auser?.email}' != null ? '${auser?.email}' : 'Anonym@quiknowte.com',
                    style: TextStyle(color: active, fontSize: 16.0),
                  ),
                  SizedBox(height: 30.0),
                  _buildRow(Icons.home, 'Home', context, StartHomePage()),
                  _buildDivider(),
                  _buildRow(Icons.account_circle, 'Profile', context,
                      StartHomePage()),
                  _buildDivider(),
                  _buildRow(
                      Icons.email, 'Contact us', context, StartHomePage()),
                  _buildDivider(),
                  _buildRow(Icons.star, 'Rate us', context, StartHomePage()),
                  _buildDivider(),
                  _buildRow(Icons.help_outline, 'Help', context, Help()),
                  _buildDivider(),
                  _buildRow(Icons.info_outline, 'Info', context, Info()),
                  _buildDivider(),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: .2),
                    child: FlatButton(
                      onPressed: _signOut,
                      child: Row(children: [
                        Icon(
                          Icons.power_settings_new,
                          color: active,
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          'LogOut',
                          style: TextStyle(color: active, fontSize: 16.0),
                        ),
                        Spacer(),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      color: divider,
    );
  }

  Widget _buildRow(
      IconData icon, String title, BuildContext context, Widget route,
      {bool showBadge = false}) {
    final TextStyle tStyle = TextStyle(color: active, fontSize: 16.0);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: .2),
      child: FlatButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => route));
        },
        child: Row(children: [
          Icon(
            icon,
            color: active,
          ),
          SizedBox(width: 10.0),
          Text(
            title,
            style: tStyle,
          ),
          Spacer(),
          if (showBadge)
            Material(
              color: Colors.deepOrange,
              elevation: 5.0,
              shadowColor: Colors.red,
              borderRadius: BorderRadius.circular(5.0),
              child: Container(
                width: 25,
                height: 25,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Text(
                  '10+',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
        ]),
      ),
    );
  }

  //FileUpload
  Future uploadFile() async {
    String filepath;
    final ByteData bytes = await rootBundle.load(filepath);
    final Directory tempDir = Directory.systemTemp;
    String filename; //filename
    File file; //file
    file.writeAsBytes(bytes.buffer.asUint8List(), mode: FileMode.write);

    final StorageReference ref = FirebaseStorage.instance.ref().child(filename);
    final StorageUploadTask task = ref.putFile(file);
    // final Uri downloadUrl = (await task).downloadUrl;

    // String path = downloadUrl.toString();
  }
}
