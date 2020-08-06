import 'package:flutter/material.dart';
import 'package:quiknowte/view/extras/modules/audio.dart';
import 'package:quiknowte/view/extras/modules/picture.dart';
import 'package:quiknowte/view/extras/modules/video.dart';

class Extras extends StatefulWidget {
  Extras({this.ptime, this.pname, this.pid});
  final String ptime;
  final String pname;
  final int pid;
  @override
  State<StatefulWidget> createState() {
    return _Extras();
  }
}

class _Extras extends State<Extras> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [
      Picture(),
      Audio(title: widget.pname, dir: widget.ptime),
      Video()
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(widget.pname),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt),
              title: Text('Picture'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mic),
              title: Text('Audio'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.videocam),
              title: Text('Video'),
            )
          ],
        ),
        body: _children[_currentIndex],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
