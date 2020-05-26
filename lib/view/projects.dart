import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quiknowte/view/projecthome.dart';
import 'package:sqflite/sqflite.dart';
import 'package:quiknowte/model/dbhelper.dart' as stat;
// import 'package:quiknowte/samples/ptitles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Projects extends StatefulWidget {
  @override
  State createState() => _Projects();
}

class _Projects extends State<Projects> {
  Future<List<Map>> fetchProject() async {
    return stat.DatabaseHelper().getAllSamples();
  }

  FixedExtentScrollController fixedExtentScrollController =
      FixedExtentScrollController();
  List projects;
  final db = stat.DatabaseHelper();
  // final _formKey = GlobalKey<FormState>();
  final projectName = TextEditingController();
  final projectNote = TextEditingController();
  final hyph = '-';
  final coll = ':';

  @override
  void initState() {
    super.initState();
    fetchProject();
    viewProjects();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    projectName.dispose();
    projectNote.dispose();
    super.dispose();
  }

  Future<String> viewProjects() async {
    final res = await db.getAllSamples();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    final String dbPath = prefs.getString('dbPath');
    final bool exist = await databaseExists(dbPath);
    print(exist);
    setState(() {
      projects = res;
    });
    return 'success';
  }

  Future insert(String name, String note) async {
    return await db.saveProject([name, note]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(title: const Text('Projects')),
      body: FutureBuilder<List<Map>>(
        future: fetchProject(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data == null ? 0 : snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Card(
                            elevation: 10.0,
                            margin: EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 5.0),
                            child: Row(
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ProjectHome(
                                                ptime: snapshot.data[index]
                                                    ['time'] as String,
                                                pname: snapshot.data[index]
                                                    ['name'] as String,
                                                pid: snapshot.data[index]['Id']
                                                    as int,
                                              )),
                                    );
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12.0, vertical: 10.0),
                                    margin: EdgeInsets.only(left: 4.0),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            right: BorderSide(
                                                width: 1.5,
                                                color: Colors.black26))),
                                    child: CircleAvatar(
                                      child: Text(snapshot.data[index]['name']
                                              [0]
                                          .toUpperCase()
                                          .toString()),
                                      radius: 14.0,
                                      backgroundColor: Colors.blueAccent,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ProjectHome(
                                                  ptime: snapshot.data[index]
                                                      ['time'] as String,
                                                  pname: snapshot.data[index]
                                                      ['name'] as String,
                                                  pid: snapshot.data[index]
                                                      ['Id'] as int,
                                                )),
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.0, vertical: 15.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          Text(
                                            snapshot.data[index]['name']
                                                as String,
                                            style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 24.0,
                                            ),
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              style: TextStyle(
                                                color: Colors.black54,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14.0,
                                              ),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: snapshot.data[index]
                                                          ['time']
                                                      .substring(
                                                          snapshot
                                                                  .data[index]
                                                                      ['time']
                                                                  .length -
                                                              8,
                                                          snapshot
                                                                  .data[index]
                                                                      ['time']
                                                                  .length -
                                                              6) as String,
                                                ),
                                                TextSpan(text: hyph),
                                                TextSpan(
                                                  text: snapshot.data[index]
                                                          ['time']
                                                      .substring(
                                                          snapshot
                                                                  .data[index]
                                                                      ['time']
                                                                  .length -
                                                              10,
                                                          snapshot
                                                                  .data[index]
                                                                      ['time']
                                                                  .length -
                                                              8) as String,
                                                ),
                                                TextSpan(text: hyph),
                                                TextSpan(
                                                  text: snapshot.data[index]
                                                          ['time']
                                                      .substring(
                                                          snapshot
                                                                  .data[index]
                                                                      ['time']
                                                                  .length -
                                                              14,
                                                          snapshot
                                                                  .data[index]
                                                                      ['time']
                                                                  .length -
                                                              10) as String,
                                                ),
                                                TextSpan(text: ' @ '),
                                                TextSpan(
                                                  text: snapshot.data[index]
                                                          ['time']
                                                      .substring(
                                                          snapshot
                                                                  .data[index]
                                                                      ['time']
                                                                  .length -
                                                              6,
                                                          snapshot
                                                                  .data[index]
                                                                      ['time']
                                                                  .length -
                                                              4) as String,
                                                ),
                                                TextSpan(text: coll),
                                                TextSpan(
                                                  text: snapshot.data[index]
                                                          ['time']
                                                      .substring(
                                                          snapshot
                                                                  .data[index]
                                                                      ['time']
                                                                  .length -
                                                              4,
                                                          snapshot
                                                                  .data[index]
                                                                      ['time']
                                                                  .length -
                                                              2) as String,
                                                ),
                                                TextSpan(text: coll),
                                                TextSpan(
                                                  text: snapshot.data[index]
                                                          ['time']
                                                      .substring(
                                                          snapshot
                                                                  .data[index]
                                                                      ['time']
                                                                  .length -
                                                              2,
                                                          snapshot
                                                              .data[index]
                                                                  ['time']
                                                              .length) as String,
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      // IconButton(
                                      //   icon: Icon(Icons.edit),
                                      //   tooltip: 'Edit',
                                      //   color: Colors.blueAccent,
                                      //   onPressed: () {},
                                      // ),
                                      // IconButton(
                                      //   icon: Icon(Icons.delete),
                                      //   tooltip: 'Delete',
                                      //   color: Colors.redAccent,
                                      //   onPressed: () {},
                                      // ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Container(
            alignment: AlignmentDirectional.center,
            child: CircularProgressIndicator(),
          );
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.orange,
      //   onPressed: () {
      //     showDialog(
      //         context: context,
      //         builder: (BuildContext context) {
      //           return AlertDialog(
      //             content: Form(
      //               key: _formKey,
      //               child: Column(
      //                 mainAxisSize: MainAxisSize.min,
      //                 children: <Widget>[
      //                   Padding(
      //                     padding: EdgeInsets.all(8.0),
      //                     child: TextFormField(
      //                       controller: projectName,
      //                       validator: (value) {
      //                         if (value.isEmpty) {
      //                           return 'Project Name cannot be Null!';
      //                         }
      //                         return null;
      //                       },
      //                       decoration: InputDecoration(
      //                           prefixIcon: Icon(Icons.table_chart),
      //                           hintText: 'project name*',
      //                           hintStyle: TextStyle(
      //                               fontWeight: FontWeight.w300,
      //                               color: Colors.red)),
      //                       style: TextStyle(
      //                           color: Colors.black87,
      //                           fontWeight: FontWeight.w300),
      //                     ),
      //                   ),
      //                   Padding(
      //                     padding: EdgeInsets.all(8.0),
      //                     child: TextFormField(
      //                       controller: projectNote,
      //                       decoration: InputDecoration(
      //                           prefixIcon: Icon(Icons.note),
      //                           hintText: 'note (optional)',
      //                           hintStyle: TextStyle(
      //                               fontWeight: FontWeight.w300,
      //                               color: Colors.red)),
      //                       style: TextStyle(
      //                           color: Colors.black87,
      //                           fontWeight: FontWeight.w300),
      //                     ),
      //                   ),
      //                   Padding(
      //                     padding: const EdgeInsets.all(8.0),
      //                     child: Row(
      //                       children: <Widget>[
      //                         RaisedButton(
      //                           child: Text('cancel'),
      //                           onPressed: () {
      //                             Navigator.pop(context);
      //                           },
      //                         ),
      //                         Spacer(),
      //                         RaisedButton(
      //                           child: Text('Submit'),
      //                           onPressed: () {
      //                             if (_formKey.currentState.validate()) {
      //                               _formKey.currentState.save();
      //                             }
      //                             // projectNote.text ??= 'none';
      //                             insert(projectName.text, projectNote.text);
      //                             // Navigator.pop(context);
      //                             Navigator.push(
      //                                 context,
      //                                 MaterialPageRoute(
      //                                     builder: (context) => Projects()));
      //                           },
      //                         ),
      //                       ],
      //                     ),
      //                   )
      //                 ],
      //               ),
      //             ),
      //           );
      //         });
      //   },
      //   tooltip: 'New Project',
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
