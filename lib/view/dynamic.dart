import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:quiknowte/utils/navbar1.dart';
import 'package:quiknowte/view/tableList.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quiknowte/model/dbhelper.dart' as stat;
import 'package:quiknowte/model/dynsql.dart' as flex;
import 'new_sple_stepper.dart';

String popper;

class Mydine extends StatefulWidget {
  Mydine({Key key, @required this.extended,@required this.text, @required this.id}) : super(key: key);
  final String text;
  final String extended;
  final int id;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Dine(dbName: extended,projName: text, dbid: id);
  }
}

class _Dine extends State<Mydine> {
  _Dine({Key key,@required this.dbName, @required this.projName, @required this.dbid});
  final String dbName;
  final String projName;
  final int dbid;
  static String exten = '.db';
  final dy = flex.DatabaseHelper();
  final db = stat.DatabaseHelper();
  String quote = '"';
  String sure = 'Are you sure you want to delete the project named ';
  String quest = '?';
  int _currentIndex = 0;
  final List<Widget> _children = [Samples(), NewSample()];

  Future insdyn() async {
    await db.closer();
    return await dy
        .saveTabVal('test', ['username', 'admnum'], ['yuyu', 'yuyu']);
  }

  Future getAll() async {
    return await dy.getAllSamples('test');
  }

  Future fetchTables() async {
    return await dy.getAllTables();
  }

  Future tableCreate(List samples, List constants, List variables) async {
    return await dy.table(samples, constants, variables);
  }

  Future deleteDb(int id, String dbName) async {
    setState(() {
      openDb();
    });
    return await db.deleteProject(id, dbName);
  }

  Future closeMain() async {
    await db.closer();
  }

  Future closeDyn() async {
    await dy.closer();
  }

  @override
  void initState() {
    db.closer();
    openDb();
    super.initState();
  }

  Future openDb() async {
    final String databasesPath = await getDatabasesPath();
    final String path = join(databasesPath, dbName + exten);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('dbPath', path);
    // final String dbPath = prefs.getString('dbPath');
    // final bool exist = await databaseExists(dbPath);
    final db = await openDatabase(dbName + exten);
    // print('DDD'+dbName);
    print(db);
    print(path);
    if (popper == 'false') {
      popper = 'true';
      Navigator.pop(this.context);
    }
    return db;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back),
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          // ),
          title: Text(projName),
          actions: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
              child: IconButton(
                icon: Icon(Icons.delete_forever),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(sure + dbName.substring(0,dbName.length-14) + quest),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  RaisedButton(
                                    child: Text('cancel'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  Spacer(),
                                  RaisedButton(
                                    child: Text('delete'),
                                    onPressed: () {
                                      closeDyn();
                                      deleteDb(dbid, dbName);
                                      popper = 'false';
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
              // Icon(Icons.delete_forever),
            ),
          ],
          
        ),
        
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.collections_bookmark),
              title: Text('Samples'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.create_new_folder),
              title: Text('New Sample'),
            ),
          ],
        ),
        drawer: NavBar1(),
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
