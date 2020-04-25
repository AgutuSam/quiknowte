import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quiknowte/model/dynsql.dart' as flex;

class Dtables extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Dtables();
  }
}

class _Dtables extends State<Dtables> {
  String currentTable;
  List<dynamic> _retList;
  List<dynamic> _tableList;
  Future dbTableName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    currentTable = prefs.getString('dbTable');
    print(currentTable);
  }

  Future<List<Map>> fetchFromTable() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    currentTable = prefs.getString('dbTable');
    flex.DatabaseHelper().getAllSamples(currentTable).then((retList) {
      setState(() {
        _retList = retList;
      });
      print('Length: ${retList.length}');
      print(
          'test: ${retList[1][retList[1].toString().substring(1, retList[1].toString().indexOf(':'))]}');
    });
    flex.DatabaseHelper().getTableInfo(currentTable).then((tableList) {
      setState(() {
        _tableList = tableList;
      });
      print('Length: ${tableList.length}');
      print('one: ${tableList[1]["name"]}');
    });
    return null;
  }

  @override
  void initState() {
    _retList = [];
    _tableList = [];
    dbTableName();
    fetchFromTable();
    super.initState();
  }

  SingleChildScrollView _getDataBody() {
    List<DataCell> _dcell = [];
    final List<DataColumn> _dColmn = [];
    final List<String> colNm = [];
    final List<DataRow> _dRow = [];
    for (int i = 0; i < _tableList.length; i++) {
      _dColmn.add(DataColumn(
              label: _tableList[i]['name'].toString() == 'Id'
                  ? Icon(Icons.menu)
                  : RichText(
                      text: TextSpan(
                          text: _tableList[i]['name'].toString().toUpperCase(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )),
                    ))
          // Text(_tableList[i]['name'].toString()),

          );
      colNm.add(_tableList[i]['name'].toString());
    }
    List<DataCell> dCell(int num) {
      final int _numb = _retList[num].length as int;
      _dcell = [];
      print('number = $_numb');
      for (int i = 0; i < _numb; i++) {
        _dcell.add(
          DataCell(colNm[i].toString() == 'Id'
              ? IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {},
                )
              : Text('${_retList[num][colNm[i].toString()].toString()}')),
        );
      }

      return _dcell;
    }

    for (int i = 0; i < _retList.length; i++) {
      _dRow.add(
        DataRow(cells: dCell(i)),
      );
    }

    if (_dcell == null ||
        _dcell.isEmpty ||
        _dColmn == null ||
        _dColmn.isEmpty ||
        colNm == null ||
        colNm.isEmpty ||
        _dRow == null ||
        _dRow.isEmpty) {
      return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '  No data has been added to this element yet!',
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              Text(''),
              Row(
                children: <Widget>[
                  // Icon(Icons.mood_bad),
                  Icon(
                    Icons.sentiment_dissatisfied,
                    size: 42,
                  ),
                  //  CircularProgressIndicator(),
                ],
              ),
            ],
          ));
    } else {
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            sortColumnIndex: 0,
            sortAscending: false,
            columns: _dColmn,
            rows: _dRow,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: _retList == null ||
                        _retList.isEmpty ||
                        _tableList == null ||
                        _tableList.isEmpty
                    ? Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '  No data has been added to this element yet!',
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                            ),
                            Text(''),
                            Row(
                              children: <Widget>[
                                // Icon(Icons.mood_bad),
                                Icon(
                                  Icons.sentiment_dissatisfied,
                                  size: 42,
                                ),
                                //  CircularProgressIndicator(),
                              ],
                            ),
                          ],
                        ),
                      )
                    : _getDataBody()),
          ],
        ),
      ),
    );
  }
}
