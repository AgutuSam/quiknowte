import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqfentity_sample/model/dynsql.dart' as flex;
// import 'package:sqfentity_sample/samples/psamples.dart';
// import 'package:intl/intl.dart';

class DataAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DataAdd();
  }
}

class _DataAdd extends State<DataAdd> {
  String currentTable;
  final _formKey = GlobalKey();
  Future dbTableName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    currentTable = prefs.getString('dbTable');
  }

  Future<List<Map>> fetchFromTable() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    currentTable = prefs.getString('dbTable');
    return flex.DatabaseHelper().getTableInfo(currentTable);
  }

  @override
  void initState() {
    dbTableName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder<List<Map>>(
        future: fetchFromTable(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final inputVal = List(snapshot.data.length);
            return Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Expanded(
          child: SizedBox(
            height: 200.0,
                  child: ListView.builder(
                      itemCount:
                          snapshot.data == null ? 0 : snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                      
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: snapshot.data[index]['name']
                                            .toString() ==
                                        'Id'
                                    ? null
                                    : TextField(
                                        decoration: InputDecoration(
                                            labelText: snapshot.data[index]
                                                    ['name']
                                                .toString()),
                                        onChanged: (value) {
                                          inputVal[index] = value;
                                        },
                                        keyboardType: snapshot.data[index]
                                                        ['type']
                                                    .toString() ==
                                                'TEXT'
                                            ? TextInputType.text
                                            : snapshot.data[index]['type']
                                                        .toString() ==
                                                    'DATETIME'
                                                ? TextInputType.datetime
                                                : snapshot.data[index]['type']
                                                            .toString() ==
                                                        'REAL'
                                                    ? TextInputType.number
                                                    : TextInputType.text,
                                        // controller: _ctrl,
                                      ),
                              ),
                            ],
                          ),
                        );
                      }),
          ),),
                ),
                Center(
                  child: 
                 MaterialButton(
                    child: Text('Submit'),
                    elevation: 8,
                    highlightElevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {
                      final List<dynamic> cols = [];
                      final List<dynamic> vals = [];
                      for (int i = 0; i < snapshot.data.length-1; i++) {
                        cols.add(snapshot.data[i]['name']);
                        vals.add(inputVal[i]);
                      }
                      print(currentTable);
                      print(cols);
                      print(vals);
                      flex.DatabaseHelper()
                          .saveTabVal(currentTable, cols, vals);
                    },
                  ),
                )
              ],
            
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Container(
            alignment: AlignmentDirectional.center,
            child: CircularProgressIndicator(),
          );
        });
  }
}
