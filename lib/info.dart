import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiknowte/utils/navbar1.dart';

class Info extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      drawer: NavBar1(),
    );
  }
  
}