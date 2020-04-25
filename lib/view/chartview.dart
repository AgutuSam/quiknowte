import 'package:flutter/material.dart';
import 'package:quiknowte/model/dynsql.dart' as flex;
// import 'package:quiknowte/utils/navbar2.dart';

class ChartView extends StatefulWidget {
  // ChartView({this.properties, this.chart});
  // final List properties;
  // final String chart;

  @override
  State<StatefulWidget> createState() {
    return _ChartViewState();
  }
}

class _ChartViewState extends State<ChartView> {
  List<DropdownMenuItem> samplez;
  List<Widget> raw;
  bool listtype;
  bool monVal = false;
  var _radioValue1;
  String result;
  Future<List<Map>> fetchTables() async {
    flex.DatabaseHelper().getAllTables().then((val) {
      setState(() {
      });
      // print('UUUUUUU');
      // print('Length: ${_tableList.length}');
    });
    return null;
  }

  Future<List<Map>> tableStruct() async {
    return flex.DatabaseHelper().getTableInfo('ruley03');
  }

  void _handleRadioValueChange1(dynamic i){
    result = i.toString();
    print('KKKKKKKKKKKKKKKK');
    print(result);
    setState(() {
      _radioValue1 = i;
    });
  }

  @override
  void initState() {
    _radioValue1 = -1;
    fetchTables();
    tableStruct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  Scaffold(
          appBar: AppBar(
            title:  Text('Kids Quiz App'),
            centerTitle: true,
            backgroundColor: Colors.blue,
          ),
          body:  Container(
              padding: EdgeInsets.all(8.0),
              child:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                     Text(
                      'Select correct answers from below:',
                      style:  TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                     Padding(
                      padding:  EdgeInsets.all(8.0),
                    ),
                     Divider(height: 5.0, color: Colors.black),
                     Padding(
                      padding:  EdgeInsets.all(8.0),
                    ),
                     Text(
                      'Lion is :',
                      style:  TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                         Radio(
                          value: 0,
                          groupValue: _radioValue1,
                          onChanged: _handleRadioValueChange1,
                        ),
                         Text(
                          'Carnivore',
                          style:  TextStyle(fontSize: 16.0),
                        ),
                         Radio(
                          value: 1,
                          groupValue: _radioValue1,
                          onChanged: _handleRadioValueChange1,
                        ),
                         Text(
                          'Herbivore',
                          style:  TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                         Radio(
                          value: 2,
                          groupValue: _radioValue1,
                          onChanged: _handleRadioValueChange1,
                        ),
                         Text(
                          'Omnivore',
                          style:  TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
       FloatingActionButton(
        onPressed: () {},
        tooltip: 'export',
        child: Icon(Icons.save_alt),
      ),
                  ],
      ),
      ),
      ),
    );
  }
}
