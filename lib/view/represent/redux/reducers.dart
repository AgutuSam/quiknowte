import 'dart:core';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quiknowte/charts/chartproperties.dart';
import 'package:quiknowte/model/dynsql.dart' as flex;
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:quiknowte/view/represent/model/models.dart';
import 'package:quiknowte/view/represent/redux/actions.dart';

import '../../../screen_size.dart';
import 'actions.dart';

AppState reducer(AppState prev, dynamic action) {
  Random random = Random();
  Color getColor() {
    return Color.fromARGB(
        255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }

  if (action is CreateGlobalData) {
    if (prev.radioRes.isNotEmpty) {
      flex.DatabaseHelper().getAllSamples(prev.radioRes.toString()).then((val) {
        prev.globalData = val.map((prop) =>
         Properties(prop[prev.axisXVal].toString(),
                double.parse(prop[prev.axisYVal].toString()).round())      
                ).toList();               
      });      
    }
  } else if (action is CreateGlobalMultiDateTimeData) {
    List tear;
    int i;
    int j;
    if (prev.selTable.isNotEmpty) {
      for (j = 0; j < prev.selTable.length; j++) {
        flex.DatabaseHelper()
            .getAllSamples(prev.selTable[j].toString())
            .then((val) {
          tear = val;
          print(tear[0][prev.axisYVal]);
          for (i = 0; i < tear.length; i++) {
            prev.globalMultiTimeData.add([
              PropertiesDateTime(tear[i][prev.axisXVal] as DateTime,
                  double.parse(tear[i][prev.axisYVal].toString()).round()),
            ]);
          }
        });
      }
    }
  } else if (action is CreateGlobalMultiData) {
    List tear;
    int i;
    if (prev.selTable.isNotEmpty) {
      prev.selTable.asMap().forEach((index, element) {
        flex.DatabaseHelper().getAllSamples(element.toString()).then((val) {
          tear = val;

          for (i = 0; i < tear.length; i++) {
            prev.globalMultiData[index].add(
              Properties(tear[i][prev.axisXVal].toString(),
                  double.parse(tear[i][prev.axisYVal].toString()).round()),
            );
            print('?////////////////////????????????');
            print(prev.globalMultiData.toString());
            print('????????/////////////////////////????????');
          }
        });
      });
    }
  } else if (action is CreateGlobalMultiIntData) {
    List tear;
    int i;
    int j;
    if (prev.selTable != []) {
      for (j = 0; j < prev.selTable.length; j++) {
        flex.DatabaseHelper()
            .getAllSamples(prev.selTable[j].toString())
            .then((val) {
          tear = val;
          print(tear[0][prev.axisYVal]);
          for (i = 0; i < tear.length; i++) {
            prev.globalMultiIntData.add([
              PropertiesInt(
                  double.parse(tear[i][prev.axisXVal].toString()).round(),
                  double.parse(tear[i][prev.axisYVal].toString()).round()),
            ]);
          }
        });
      }
    }
  } else if (action is SamplezTap) {
    prev.sampleVisible = !prev.sampleVisible;
    if (prev.globalData.isNotEmpty) {
      print('&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&');
      print(prev.globalData[1].domain.toString() + ' : ' + prev.globalData[1].measure.toString());
      print('&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&');
      prev.chartClass = prev.chartClass;
      prev.canvas = Padding(
        padding: EdgeInsets.all(16),
        child: Container(
          height: SizeConfig.blockSizeVertical * 55,
          padding: EdgeInsets.all(8),
          color: Colors.white,
          child: prev.chartClass,
        ),
      );
    } 
  } else if (action is ChartzTap) {
    prev.chartzVisible = !prev.chartzVisible;
  } else if (action is FetchTables) {
    flex.DatabaseHelper().getAllTables().then((val) {
      prev.tableList = val;
      // print('UUUUUUU');
      // print('Length: ${_tableList.length}');
    });
  } else if (action is Bull) {
    flex.DatabaseHelper().getAllTables().then((val) {
      for (var i = 0; i < val.length; i++) {
        prev.checkVal.add(false);
      }
    });
  } else if (action is TableStructRad) {
    if (prev.radioRes.isNotEmpty) {
      flex.DatabaseHelper().getTableInfo(prev.radioRes.toString()).then((val) {
        prev.rett = val;
      });
      prev
        ..axisXVisible = true
        ..axisYVisible = true;
    } else {
      prev
        ..axisXVisible = false
        ..axisYVisible = false;
    }
    
  } else if (action is TableStructCheck) {
    if (prev.selTable.isNotEmpty) {
      flex.DatabaseHelper()
          .getTableInfo(prev.selTable[0].toString())
          .then((val) {
        prev.rett = val;
      });
      prev
        ..axisXVisible = true
        ..axisYVisible = true;
    } else {
      prev
        ..axisXVisible = false
        ..axisYVisible = false;
    }
  } else if (action is HandleRadioValueChange) {
    prev.radioRes = action.i.toString();
    print('KKKKKKKKKKKKKKKK');
    print(prev.radioRes);
    prev.radioValue = action.i;
  } else if (action is Canvas) {
    if (prev.globalData.isNotEmpty) {
      print('*******************************************************');
      print(prev.globalData[1].domain.toString() + ' : ' + prev.globalData[1].measure.toString());
      print('*******************************************************');
      prev.canvas = Padding(
        padding: EdgeInsets.all(16),
        child: Container(
          height: SizeConfig.blockSizeVertical * 55,
          padding: EdgeInsets.all(8),
          color: Colors.white,
          child: prev.chartClass,
        ),
      );
    } else {
      prev.canvas = Padding(
        padding: EdgeInsets.all(16),
        child: Container(
          height: SizeConfig.blockSizeVertical * 55,
          padding: EdgeInsets.all(8),
          color: Colors.white,
          // child: chartClass,
        ),
      );
    }
  } else if (action is CapPress) {
    /* */
  } else if (action is SamplesString) {
    prev.samplez = [];
    flex.DatabaseHelper().getAllTables().then((val) {
        prev.tableList = val;
        print('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
        print(prev.tableList.toString());
        print('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
    });
    for (var i = 0; i < prev.tableList.length; i++) {
      prev.samplez.add(DropdownMenuItem(
          value: prev.tableList[i]['name'].toString(),
          child: Text(prev.tableList[i]['name'].toString())));
    }
  } else if (action is SamplesList) {
    flex.DatabaseHelper().getAllTables().then((val) {
        prev.tableList = val;
    });
    List<Widget> checkb() {
      prev.raw = [];
      for (var i = 0; i < prev.tableList.length; i++) {
        prev.raw.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                  child: prev.checkState == 'box'
                      ? Checkbox(
                          value: prev.checkVal[i],
                          onChanged: (bool value) {
                            prev.checkVal[i] = value;
                            if (prev.checkVal[i] == true) {
                              prev.selTable
                                  .add(prev.tableList[i]['name'].toString());
                            } else {
                              prev.selTable
                                  .remove(prev.tableList[i]['name'].toString());
                            }
                            prev.globalMultiData = List.generate(
                                prev.selTable.length, (index) => []);
                            if (prev?.selTable?.isNotEmpty ?? []) {
                              flex.DatabaseHelper()
                                  .getTableInfo(prev.selTable[0].toString())
                                  .then((val) {
                                prev.rett = val;
                              });
                              prev.axisXVisible = true;
                              prev.axisYVisible = true;
                            } else {
                              prev.axisXVisible = false;
                              prev.axisYVisible = false;
                            }
                          },
                        )
                      : prev.checkState == 'radio'
                          ? Radio(
                              value: prev.tableList[i]['name'].toString(),
                              groupValue: prev.radioValue,
                              onChanged: (dynamic i) {
                                prev.radioRes = i.toString();
                                prev.radioValue = i;
                                prev.radioValue = i;
                                if (prev?.radioRes?.isNotEmpty ?? []) {
                                  flex.DatabaseHelper()
                                      .getTableInfo(prev.radioRes.toString())
                                      .then((val) {
                                    prev.rett = val;
                                  });
                                  prev.axisXVisible = true;
                                  prev.axisYVisible = true;
                                } else {
                                  prev.axisXVisible = false;
                                  prev.axisYVisible = false;
                                }
                              })
                          : null),
              Text(prev.tableList[i]['name'].toString()),
            ],
          ),
        );
      }

      return prev.raw;
    }

    prev.samplez = []..add(
        DropdownMenuItem<List>(
          value: [],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: checkb(),
          ),
        ),
      );
  } else if (action is ColList) {
    prev.samplez = [];
    print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
    print(prev?.rett?.length ?? 0);
    print(prev?.rett?.toString());
    print(prev.globalDataChooser);
    print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
    for (var i = 0; i < prev.rett.length - 1; i++) {
      if (action.axis == 'X') {
        prev.samplez.add(DropdownMenuItem(
            value: prev.rett[i]['name'].toString(),
            child: Text(prev.rett[i]['name'].toString())));
      } else if (action.axis == 'Y') {
        if (prev.rett[i]['type'].toString() == 'REAL') {
          prev.samplez.add(DropdownMenuItem(
              value: prev.rett[i]['name'].toString(),
              child: Text(prev.rett[i]['name'].toString())));
        }
      }
    }
  } else if (action is SampleCols) {
    prev.raw = [];
    flex.DatabaseHelper().getAllTables().then((val) {
        prev.tableList = val;
    });
    for (var i = 0; i < prev.tableList.length; i++) {
      prev.raw.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(prev.tableList[i]['name'].toString()),
          ],
        ),
      );
    }
  } else if (action is CardzTap) {
    if (action.image.substring(14, 18) == 'axes') {
      prev.tabzSelected = prev.axesSelected;
    } else if (action.image.substring(14, 23) == 'bar_chart') {
      prev.tabzSelected = prev.barsSelected;
    } else if (action.image.substring(14, 25) == 'combo_chart') {
      prev.tabzSelected = prev.comboSelected;
    } else if (action.image.substring(14, 21) == 'legends') {
      prev.tabzSelected = prev.legendsSelected;
    } else if (action.image.substring(14, 24) == 'line_chart') {
      prev.tabzSelected = prev.linesSelected;
    } else if (action.image.substring(14, 24) == 'pie_charts') {
      prev.tabzSelected = prev.piesSelected;
    } else if (action.image.substring(14, 32) == 'time_series_charts') {
      prev.tabzSelected = prev.timesSelected;
    }

    prev.chartClass = action.route;
    prev.checkState = action.check;
    for (int buttonIndex = 0;
        buttonIndex < prev.tabzSelected.length;
        buttonIndex++) {
      if (buttonIndex == action.index) {
        prev.tabzSelected[buttonIndex] = !prev.tabzSelected[buttonIndex];
      } else {
        prev.tabzSelected[buttonIndex] = false;
      }
    }
    if (action.title == 'Custom Legend') {
      prev.globalDataChooser = 'multi';
    }
  } else if (action is Choozer) {
    InkWell(
      onTap: action.ontap,
      child: Container(
        height: SizeConfig.blockSizeVertical * 7,
        // width: SizeConfig.blockSizeHorizontal * 5,
        margin: EdgeInsetsDirectional.only(start: 40, end: 40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(action.tl),
              bottomLeft: Radius.circular(action.bl),
              topRight: Radius.circular(action.tr),
              bottomRight: Radius.circular(action.br)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 6.0,
            ),
          ],
          color: Colors.white,
        ),
        child: Center(
          child: Text(action.title),
        ),
      ),
    );
  } else if (action is GlobalCreateData) {
    prev.globCreateData = [
      charts.Series<Properties, String>(
        id: action.eyedee,
        domainFn: (Properties valew, _) => valew.domain,
        measureFn: (Properties valew, _) => valew.measure,
        data: prev.globalData,
      )
      // Set series to use the secondary measure axis.
      // ..setAttribute(charts.measureAxisIdKey, secondaryMeasureAxisId),
    ];
     
  } else if (action is GlobalCreateMultiData) {
    for (var i = 0; i < action.globalMultiData.length; i++) {
      prev.multiDataVal.add(charts.Series<Properties, String>(
        id: 'heey',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(getColor()),
        domainFn: (Properties valew, _) => valew.domain,
        measureFn: (Properties valew, _) => valew.measure,
        data: action.globalMultiData[i],
      )
          // ..setAttribute(charts.rendererIdKey, 'customPoint'),
          );
    }
  } else if (action is GlobalCreateMultiIntData) {
    for (var i = 0; i < action.globalMultiIntData.length; i++) {
      prev.globalCreateMultiIntData = [
        charts.Series<PropertiesInt, int>(
          id: action.eyedee[i],
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          domainFn: (PropertiesInt valew, _) => valew.dtDomain,
          measureFn: (PropertiesInt valew, _) => valew.measure,
          data: action.globalMultiIntData[i],
        )..setAttribute(charts.rendererIdKey, 'customPoint'),
      ];
    }
  } else if (action is GlobalCreateMultiTimeData) {
    for (var i = 0; i < action.globalMultiTimeData.length; i++) {
      prev.globalCreateMultiTimeData = [
        charts.Series<PropertiesDateTime, DateTime>(
          id: action.eyedee[i],
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          domainFn: (PropertiesDateTime valew, _) => valew.dtDomain,
          measureFn: (PropertiesDateTime valew, _) => valew.measure,
          data: action.globalMultiTimeData[i],
        )..setAttribute(charts.rendererIdKey, 'customPoint'),
      ];
    }
  } else if (action is AxisXVAL) {
      prev.axisXVal = action.xval;
      prev.globalData = [];
      prev.axisYVal = null;
  } else if (action is AxisYVAL) {
    prev.axisYVal = action.yval;
  }
  return prev;
}
