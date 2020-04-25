import 'package:flutter/material.dart';
import 'package:quiknowte/utils/oval-right-clipper.dart';

import '../lib/help.dart';
import '../lib/home.dart';

class NavBar1 extends StatelessWidget{
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  final Color color1 = Color(0xffFA696C);
  final Color color2 = Color(0xffFA8165);
  final Color color3 = Color(0xffFB8964);
  final Color primary = Colors.white;
  final Color active = Colors.grey.shade800;
  final Color divider = Colors.grey.shade600;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _buildDrawer(context);
  }
  


Widget _buildDrawer(BuildContext context) {
    // final String image = images[0];
    return ClipPath(
      clipper: OvalRightBorderClipper(),
      child: Drawer(
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 40),
          decoration: BoxDecoration(
              color: primary,
               boxShadow: [BoxShadow(color: Colors.black45)]),
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
                      backgroundImage: AssetImage('assets/origami3.jpg'),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    'erika costell',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '@erika07',
                    style: TextStyle(color: active, fontSize: 16.0),
                  ),
                  SizedBox(height: 50.0),
                  _buildRow(Icons.home, 'Home', context, StartHomePage()),
                  _buildDivider(),
                  _buildRow(Icons.settings, 'Settings', context, StartHomePage()),
                  _buildDivider(),
                  _buildRow(Icons.email, 'Contact us', context, StartHomePage()),
                  _buildDivider(),
                  _buildRow(Icons.star, 'Rate us', context, StartHomePage()),
                  _buildDivider(),
                  _buildRow(Icons.info_outline, 'Help', context, Help()),
                  _buildDivider(),
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

  Widget _buildRow(IconData icon, String title, BuildContext context, Widget route, {bool showBadge = false}) {
    final TextStyle tStyle = TextStyle(color: active, fontSize: 16.0);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: .2),
      child: FlatButton(onPressed: () {
        Navigator.push(
          context,
           MaterialPageRoute(
             builder: (context) => route)
          );
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
  }