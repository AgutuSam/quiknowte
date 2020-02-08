import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sqfentity_sample/utils/navbar1.dart';

class Help extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      drawer: NavBar1(),
    );
  }
  
}