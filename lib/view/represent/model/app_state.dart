import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:quiknowte/model/dynsql.dart' as flex;
import 'package:quiknowte/charts/chartproperties.dart';
// import 'package:meta/meta.dart';

import '../../../screen_size.dart';
import '../../representation.dart';

// @immutable
class AppState {
  AppState({
    this.chartzVisible,
    this.counter,
    this.monVal,
    this.sampleVisible,
    this.axisXVisible,
    this.axisYVisible,
    this.tableList,
    this.selTable,
    this.checkVal,
    this.samplez,
    this.globalData,
    this.globalMultiData,
    this.multiDataVal,
    this.rett,
    this.radioValue,
    this.checkState,
    this.axesSelected,
    this.barsSelected,
    this.comboSelected,
    this.legendsSelected,
    this.linesSelected,
    this.piesSelected,
    this.timesSelected,
    this.tablesSelected,
    this.tabzSelected,
    this.globalDataChooser,
    this.canvas,
    this.globCreateData,
    this.globCreateMultiData,
    this.globalCreateMultiIntData,
    this.globalCreateMultiTimeData,
    this.tabz,
  });

factory AppState.initial() => AppState(
  chartzVisible : false,
    counter : 0,
    monVal : false,
    sampleVisible : false,
    axisXVisible : false,
    axisYVisible : false,
    tableList : fetchTables(),
    selTable : [],
    checkVal : [],
    samplez : [],
    globalData : [],
    globalMultiData : [],
    multiDataVal : [],
    rett : ['test'],
    radioValue : -1,
    checkState : 'radio',
    axesSelected : List.generate(17, (index) => false),
    barsSelected : List.generate(19, (index) => false),
    comboSelected : List.generate(5, (index) => false),
    legendsSelected : List.generate(8, (index) => false),
    linesSelected : List.generate(13, (index) => false),
    piesSelected : List.generate(6, (index) => false),
    timesSelected : List.generate(7, (index) => false),
    tablesSelected : List.generate(1, (index) => false),
    tabzSelected : [],
    globalDataChooser : 'default',
    canvas : Padding(padding: EdgeInsets.all(16),
        child: Container(
          height: SizeConfig.blockSizeVertical * 55,
          padding: EdgeInsets.all(8),
          color: Colors.white,
        ),
      ),
      globCreateData : [],
      globCreateMultiData : [],
      globalCreateMultiIntData : [],
      globalCreateMultiTimeData : [],
      tabz : [],
      );

 

  List<DropdownMenuItem> samplez;
  List<DropdownMenuItem> axezex;
  List<DropdownMenuItem> axezy;
  List<Widget> raw;
  List<dynamic> tableList;
  List<bool> checkVal;
  List<dynamic> selTable;
  List<dynamic> rett;
  String axisXVal;
  String axisYVal;
  String selTab;
  Widget chartClass;
  var radioValue;
  String checkState;
  String radioRes;
  String globalDataChooser;
  List<bool> barsSelected;
  List<bool> axesSelected;
  List<bool> comboSelected;
  List<bool> legendsSelected;
  List<bool> linesSelected;
  List<bool> piesSelected;
  List<bool> timesSelected;
  List<bool> tablesSelected;
  List<bool> tabzSelected;
  // static const secondaryMeasureAxisId = 'secondaryMeasureAxisId';
  dynamic file;
  final pdf = pw.Document();
  var counter;
  bool chartzVisible;
  bool monVal;
  bool sampleVisible;
  bool axisXVisible;
  bool axisYVisible;
  final fileName = TextEditingController();
  final fileNote = TextEditingController();
  List<Properties> globalData;
  List<List<Properties>> globalMultiData;
  List<List<PropertiesDateTime>> globalMultiTimeData;
  List<List<PropertiesInt>> globalMultiIntData;
  List<charts.Series<Properties, String>> multiDataVal;
  Padding canvas;
  List<charts.Series<Properties, String>> globCreateData;
  List<charts.Series<Properties, String>> globCreateMultiData;
  List<charts.Series<PropertiesInt, int>> globalCreateMultiIntData;
  List<charts.Series<PropertiesDateTime, DateTime>> globalCreateMultiTimeData;
  List<Tabz> tabz;

 static List<dynamic> fetchTables() {
   List ret;
    flex.DatabaseHelper().getAllTables().then((val) {
        ret = val;
      // print('UUUUUUU');
      // print('Length: ${_tableList.length}');
    });
    return ret;
  }

}
