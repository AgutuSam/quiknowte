import 'package:flutter/material.dart';

class VisibilityExample extends StatefulWidget {
  @override
  _VisibilityExampleState createState() {
    return _VisibilityExampleState();
  }
}

class _VisibilityExampleState extends State {
  bool _isVisible = true;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Visibility Tutorial by Woolha.com',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Visibility Tutorial by Woolha.com'),
          ),
          body: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RaisedButton(
                  child: Text('Show/Hide Card B'),
                  onPressed: showToast,
                ),
                Card(
                  child: ListTile(
                    title: Center(
                      child: Text('A'),
                    ),
                  ),
                ),
                Visibility(
                  visible: _isVisible,
                  child: Card(
                    child: ListTile(
                      title: Center(
                        child: Text('B'),
                      ),
                    ),
                  ),
                ),
                Card(
                  child:  ListTile(
                    title: Center(
                      child:  Text('C'),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
