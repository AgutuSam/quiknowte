import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:quiknowte/charts/chartproperties.dart';

class AppState {
  AppState(
      {this.chartzVisible = false,
      this.counter = 0,
      this.monVal = false,
      this.sampleVisible = false,
      this.axisXVisible = false,
      this.axisYVisible = false,
      this.tableList = const [],
      this.selTable = const [],
      this.checkVal = const [],
      this.samplez = const [],
      this.globalData = const [],
      this.globalMultiData = const [],
      this.multiDataVal = const [],
      this.rett = const ['test'],
      this.radioValue = -1,
      this.checkState = 'radio',
      this.axesSelected = const [
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false
      ],
      this.barsSelected = const [
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false
      ],
      this.comboSelected = const [false, false, false, false, false],
      this.legendsSelected = const [
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false
      ],
      this.linesSelected = const [
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false
      ],
      this.piesSelected = const [false, false, false, false, false, false],
      this.timesSelected = const [
        false,
        false,
        false,
        false,
        false,
        false,
        false
      ],
      this.globalDataChooser = 'default'});

  AppState.fromAppstate(AppState update) {
    chartzVisible = update.chartzVisible;
    counter = update.counter;
    monVal = update.monVal;
    sampleVisible = update.sampleVisible;
    axisXVisible = update.axisXVisible;
    axisYVisible = update.axisYVisible;
    tableList = update.tableList;
    selTable = update.selTable;
    checkVal = update.checkVal;
    samplez = update.samplez;
    globalData = update.globalData;
    globalMultiData = update.globalMultiData;
    multiDataVal = update.multiDataVal;
    rett = update.rett;
    radioValue = update.radioValue;
    checkState = update.checkState;
    axesSelected = update.axesSelected;
    barsSelected = update.barsSelected;
    comboSelected = update.comboSelected;
    legendsSelected = update.legendsSelected;
    linesSelected = update.linesSelected;
    piesSelected = update.piesSelected;
    timesSelected = update.timesSelected;
    globalDataChooser = update.globalDataChooser;
  }

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
}
