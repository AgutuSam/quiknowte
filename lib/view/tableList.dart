import 'package:flutter/material.dart';
import 'package:quiknowte/model/dynsql.dart' as flex;
import 'package:quiknowte/view/data.dart';

class Samples extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Samples();
  }
}

class _Samples extends State<Samples> {
  Future<List<Map>> fetchTables() async {
    return flex.DatabaseHelper().getAllTables();
  }

  List snap;

  @override
  void initState() {
    super.initState();
    fetchTables();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map>>(
      future: fetchTables(),
      builder: (context, snapshot) {
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
                                        builder: (context) => DataView(
                                            text: snapshot.data[index]['name']
                                                as String)),
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
                                    child: Text(snapshot.data[index]['name'][0]
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
                                          builder: (context) => DataView(
                                              text: snapshot.data[index]['name']
                                                  as String)),
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
        }else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return Container(
          alignment: AlignmentDirectional.center,
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
