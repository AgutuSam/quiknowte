import 'package:flutter/material.dart';
// import 'main.dart';

class Trie extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ocean Eyes',
      // theme: ThemeData(
      //     primaryColor: Color.fromRGBO(95, 66, 119, 1.0),
      //     fontFamily: 'LexendDeca'),
      home: Diamond(),
    );
  }
}

class Diamond extends StatefulWidget{
   Diamond({Key key, this.title}) : super(key: key);
  final String title;

  @override
DiamondState createState() => DiamondState();
}

class DiamondState extends State<Diamond>{
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    TextEditingController _email = TextEditingController();
    final TextEditingController _name = TextEditingController();
    final TextEditingController _password = TextEditingController();

    @override
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          // title: Title ('Ocean Eyes'),
        ),
        body: Stack(
          children: <Widget>[
            _display(),
          ],
        ),
      );
    }


Widget _displayName(){
return Padding(
  padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
  child: TextFormField(
    maxLines: 1,
      // keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration:  InputDecoration(
          hintText: 'User ID',
          icon: Icon(
            Icons.mail,
            color: Colors.grey,
          )),
      // onSaved: (value) => _userid = value,
      //  validator: (value) => value == "" ? 'User ID can\'t be empty' : null,
      controller: _name,
  ),
);
}

Widget _displayEmail(){
return Padding(
  padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
  child: TextFormField(
    maxLines: 1,
      // keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration:  InputDecoration(
          hintText: 'User ID',
          icon: Icon(
            Icons.mail,
            color: Colors.grey,
          )),
      // onSaved: (value) => _userid = value,
      //  validator: (value) => value == "" ? 'User ID can\'t be empty' : null,
      controller: _email,
  ),
);
}

Widget _displayPassword(){
return Padding(
  padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
  child: TextFormField(
    maxLines: 1,
      // keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration:  InputDecoration(
          hintText: 'User ID',
          icon: Icon(
            Icons.mail,
            color: Colors.grey,
          )),
      // onSaved: (value) => _userid = value,
      //  validator: (value) => value == "" ? 'User ID can\'t be empty' : null,
      controller: _password,
  ),
);
}

Widget _display(){
  return Container(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child:  ListView(
          shrinkWrap: true,
          children: <Widget>[
            _displayName(),
            _displayEmail(),
            _displayPassword(),
          ],
        ),
      ));
}
}