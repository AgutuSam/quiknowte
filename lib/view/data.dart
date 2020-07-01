import 'package:flutter/material.dart';
import 'package:quiknowte/view/dataAdd/page.dart';
import 'package:quiknowte/view/datatables.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataView extends StatefulWidget {
  DataView({Key key, @required this.text}) : super(key: key);
  final String text;
  @override
  State<StatefulWidget> createState() {
    return _DataView(tableName: text);
  }
}

class _DataView extends State<DataView> {
  _DataView({Key key, @required this.tableName});
  final String tableName;
  int _currentIndex = 0;
  final List<Widget> _children = [Dtables(), DataAdd()];

  Future dbTableName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('dbTable', tableName);
  }

  @override
  void initState() {
    dbTableName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(tableName),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.table_chart),
              title: Text('Table'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box),
              title: Text('Add Data'),
            ),
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
