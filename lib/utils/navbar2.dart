import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quiknowte/utils/oval-right-clipper.dart';
import 'package:quiknowte/model/dynsql.dart' as flex;

class NavBar2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NavBar2();
  }
}

class _NavBar2 extends State<NavBar2> {
  // final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  final Color color1 = Color(0xffFA696C);
  final Color color2 = Color(0xffFA8165);
  final Color color3 = Color(0xffFB8964);
  final Color primary = Colors.white;
  final Color active = Colors.grey.shade800;
  final Color divider = Colors.grey.shade600;
  List<DropdownMenuItem> samplez;
  List<DropdownMenuItem> axezex;
  List<DropdownMenuItem> axezy;
  List<Widget> raw;
  List<dynamic> _tableList;
  List<bool> _checkVal;
  List<dynamic> _selTable;
  bool monVal = false;
  bool _sampleVisible = false;
  bool _axisXVisible = false;
  bool _axisYVisible = false;
  List<dynamic> rett;

  void showHideSample() {
    setState(() {
      _sampleVisible = !_sampleVisible;
    });
  }

  Future<List<Map>> fetchTables() async {
    flex.DatabaseHelper().getAllTables().then((val) {
      setState(() {
        _tableList = val;
      });
      // print('UUUUUUU');
      // print('Length: ${_tableList.length}');
    });
    return null;
  }

  void bull() {
    flex.DatabaseHelper().getAllTables().then((val) {
      setState(() {
        for (var i = 0; i < val.length; i++) {
          _checkVal.add(false);
        }
      });
    });
  }

  Future<List<Map>> tableStruct() async {
    Future<List<Map>> answ;
    if(_selTable.isNotEmpty){
      flex.DatabaseHelper().getTableInfo(_selTable[0].toString()).then((val){
        rett = val;
      });
    answ = flex.DatabaseHelper().getTableInfo(_selTable[0].toString());
    _axisXVisible = true;
    _axisYVisible = true;
    }else{
      _axisXVisible = false;
    _axisYVisible = false; 
    }
    answ.then((val){
      print('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
    print(rett);
    });
    return answ;
  }

  @override
  void initState() {
    _tableList = [];
    _selTable = [];
    _checkVal = [];
    rett = [];
    fetchTables();
    tableStruct();
    bull();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _buildDrawer(context);
  }

  Widget _buildDrawer(BuildContext context) {
    // final String image = images[0];
    return ClipPath(
      clipper: OvalRightBorderClipper(),
      child: Drawer(
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 40),
          decoration: BoxDecoration(
              color: primary, boxShadow: [BoxShadow(color: Colors.black45)]),
          width: 300,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          
                          RaisedButton(
                            child: Text('Samples'),
                            onPressed: showHideSample,
                          ),
                          Visibility(
                            visible: _sampleVisible,
                            child: Column(
                              children: <Widget>[
                              Scrollable(
                              viewportBuilder: (BuildContext context,
                                  ViewportOffset position) {
                                return Column(
                                  children: checkb(),
                                );
                              },
                            ),
                          
                          Visibility(
                            visible: _axisXVisible,
                            child: DropdownButtonFormField(
                                iconSize: 40,
                                // value: _constantType,
                                value: null,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                                onChanged: (value) {
                                  setState(() {
                                    // _constantType = value as String;
                                  });
                                },
                                hint: Text('X Axis'),
                                // items: listtype == true ? samplesList() : samplesString()),
                                items: colList()),
                          ),
                          Visibility(
                            visible: _axisYVisible,
                            child: DropdownButtonFormField(
                                iconSize: 40,
                                // value: _constantType,
                                value: null,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                                onChanged: (value) {
                                  setState(() {
                                    // _constantType = value as String;
                                  });
                                },
                                hint: Text('Y Axis'),
                                // items: listtype == true ? samplesList() : samplesString()),
                                items: colList()),
                          ),
                              ],
                            ),
                            ),
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem> samplesString() {
    samplez = [];
    for (var i = 0; i < _tableList.length; i++) {
      samplez.add(DropdownMenuItem(
          value: _tableList[i]['name'].toString(),
          child: Text(_tableList[i]['name'].toString())));
    }
    return samplez;
  }

  List<DropdownMenuItem> samplesList() {
    return samplez = []..add(
        DropdownMenuItem<List>(
          value: [],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: checkb(),
          ),
        ),
      );
  }

  List<DropdownMenuItem> colList() {
    samplez = [];
    for (var i = 0; i < rett.length-1; i++) {
      samplez.add(DropdownMenuItem(
          value: rett[i]['name'].toString(),
          child: Text(rett[i]['name'].toString())));
    }
    return samplez;
  }

List<Widget> sampleCols() {
    raw = [];
    for (var i = 0; i < _tableList.length; i++) {
      raw.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(_tableList[i]['name'].toString()),
          ],
        ),
      );
    }
    
    return raw;
  }

  List<Widget> checkb() {
    raw = [];
    for (var i = 0; i < _tableList.length; i++) {
      raw.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Checkbox(
              value: _checkVal[i],
              onChanged: (bool value) {
                setState(() {
                  _checkVal[i] = value;
                  if(_checkVal[i] == true){
                    _selTable.add(_tableList[i]['name'].toString());
                  }else{
                    _selTable.remove(_tableList[i]['name'].toString());
                  }
                  tableStruct();
                  print(_selTable);
                });
              },
            ),
            Text(_tableList[i]['name'].toString()),
          ],
        ),
      );
    }
    
    return raw;
  }
}
