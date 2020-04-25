import 'package:flutter/material.dart';
// import 'package:sqfentity_sample/samples/ptitles.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:sqfentity_sample/view/dynamic.dart';
import 'model/dbhelper.dart';

/// This Widget is the main application widget.
class Test extends StatelessWidget {
  static const String _title = 'Ocean Eyes';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: MyStatelessWidget(),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);
  final db = DatabaseHelper();

  BuildContext get context => null;

  Future insert() async {
    return await db.saveProject(['omg', 'project']);
  }

  Future delete() async {
    return await db.deleteProject(2, 'omg');
  }

  Future getAll() async {
    return await db.getAllSamples();
  }

  Future getId() async {
    return await db.getProject(4);
  }

  Future change() async {
    return await switchDb('projects', 'omg');
  }

  Future closer(String closeName) async {
    final ext = '.db';
    final closedb = await openDatabase(closeName + ext);
    // print(closedb.close());
    return await closedb.close();
  }

  Future switchDb(String closedb, String opendb) async {
    closer(closedb);
    //  Navigator.push(
    //    context,
    //       MaterialPageRoute(builder: (context) => Mydine(text: opendb,)),
    //             );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        padding: const EdgeInsets.all(16.0),
        mainAxisSpacing: 12.0,
        crossAxisSpacing: 8.0,
        children: <Widget>[
          RaisedButton(
            color: Colors.grey,
            onPressed: insert,
            textColor: Colors.white,
            padding: const EdgeInsets.all(0.0),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFFE65100),
                    Color(0xFFEF6C00),
                    Color(0xFFF57C00),
                  ],
                ),
              ),
              padding: const EdgeInsets.all(10.0),
              child:
                  const Text('Add new Project', style: TextStyle(fontSize: 20)),
            ),
          ),
          RaisedButton(
            color: Colors.blueAccent,
            onPressed: delete,
            textColor: Colors.white,
            padding: const EdgeInsets.all(0.0),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF00C853),
                    Color(0xFF00E676),
                    Color(0xFF00C853),
                  ],
                ),
              ),
              padding: const EdgeInsets.all(10.0),
              child:
                  const Text('Delete Project', style: TextStyle(fontSize: 20)),
            ),
          ),
          RaisedButton(
            color: Colors.greenAccent,
            onPressed: getAll,
            textColor: Colors.white,
            padding: const EdgeInsets.all(0.0),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF2962FF),
                    Color(0xFF2979FF),
                    Color(0xFF448AFF),
                  ],
                ),
              ),
              padding: const EdgeInsets.all(10.0),
              child:
                  const Text('View Projects', style: TextStyle(fontSize: 20)),
            ),
          ),
          RaisedButton(
            color: Colors.orange,
            onPressed: getId,
            textColor: Colors.white,
            padding: const EdgeInsets.all(0.0),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF616161),
                    Color(0xFF757575),
                    Color(0xFF9E9E9E),
                  ],
                ),
              ),
              padding: const EdgeInsets.all(10.0),
              child: const Text('Get with ID', style: TextStyle(fontSize: 20)),
            ),
          ),
          RaisedButton(
            color: Colors.purpleAccent[100],
            onPressed: () {
              //    Navigator.push(
              //  context,
              //     MaterialPageRoute(builder: (context) => Mydine(text: 'omg',)),
              //           );
            },
            textColor: Colors.white,
            padding: const EdgeInsets.all(0.0),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFFEF6C00),
                    Color(0xFFAFB42B),
                    Color(0xFF9E9D24),
                  ],
                ),
              ),
              padding: const EdgeInsets.all(10.0),
              child: const Text('switch db', style: TextStyle(fontSize: 20)),
            ),
          ),
          RaisedButton(
            color: Colors.blueAccent,
            onPressed: null,
            textColor: Colors.white,
            padding: const EdgeInsets.all(0.0),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF00C853),
                    Color(0xFF00E676),
                    Color(0xFF00C853),
                  ],
                ),
              ),
              padding: const EdgeInsets.all(10.0),
              child: const Text('insert dyn', style: TextStyle(fontSize: 20)),
            ),
          ),
        ],
      ),
    );
  }
}
