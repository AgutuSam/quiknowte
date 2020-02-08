import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:toast/toast.dart';
import 'package:sqfentity_sample/model/dbhelper.dart' as stat;

import 'dynamic.dart';

class NewProject extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewProject();
  }
}


class _NewProject extends State<NewProject> {
  static final String path = 'lib/src/pages/login/login2.dart';
  final _formKey = GlobalKey<FormState>();
  final projectName = TextEditingController();
  final projectNote = TextEditingController();
  final db = stat.DatabaseHelper();
  List<dynamic> projectdetails; 

  @override
  void initState() {
    super.initState();
  }

  Future<List> insert(String name, String note) async {
    return await db.saveProject([name, note]);
  }

  Widget _buildPageContent(BuildContext context) {
    return Container(
      color: Colors.blue.shade100,
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 30.0,
          ),
          CircleAvatar(
            child: Image(
              image: AssetImage('assets/origami2.png'),
            ),
            maxRadius: 50,
            backgroundColor: Colors.transparent,
          ),
          SizedBox(
            height: 20.0,
          ),
          _buildLoginForm(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[],
          )
        ],
      ),
    );
  }

  Container _buildLoginForm(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Form(
       key: _formKey,
       child:Stack(
        children: <Widget>[
          ClipPath(
            clipper: RoundedDiagonalPathClipper(),
            child: Container(
              height: 400,
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40.0)),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 90.0,
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
                        style: TextStyle(color: Colors.blue),
                        controller: projectName,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Project Name cannot be Null!';
                              }
                              return null;
                            },
                        decoration: InputDecoration(
                            hintText: 'Project Name*',
                            hintStyle: TextStyle(color: Colors.blue.shade500),
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.table_chart,
                              color: Colors.blue,
                            )),
                      )),
                  Container(
                    child: Divider(
                      color: Colors.blue.shade400,
                    ),
                    padding:
                        EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextFormField(
                        style: TextStyle(color: Colors.blue),
                         controller: projectNote,
                        decoration: InputDecoration(
                            hintText: 'Note (optional)',
                            hintStyle: TextStyle(color: Colors.blue.shade500),
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.note,
                              color: Colors.blue,
                            )),
                      )),
                  Container(
                    child: Divider(
                      color: Colors.blue.shade400,
                    ),
                    padding:
                        EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
                  ),
  
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 40.0,
                backgroundColor: Colors.cyan.shade600,
                child: Icon(Icons.add),
              ),
            ],
          ),
          Container(
            height: 420,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    // _formKey.currentState.save();
                   insert(projectName.text, projectNote.text).then((retList) {
                     setState(() {
                     projectdetails = retList;
                   });
                  //  print('PPPPPPPP'+projectdetails.toString());
                   Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Mydine(
                                                extended: projectdetails[0] as String,
                                                text: projectdetails
                                                    [1] as String,
                                                id: projectdetails[2]
                                                    as int,
                                              )));
                   });
                   
                                                           
                  }else{
                    Toast.show('Project Name must not be Null!', context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                  }
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0)),
                child: Text('Create', style: TextStyle(color: Colors.white, fontSize: 22)),
                color: Colors.cyan,
              ),
            ),
          )
        ],
                    ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPageContent(context),
    );
  }
}
