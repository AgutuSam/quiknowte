import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quiknowte/charts/chartproperties.dart';
import 'package:quiknowte/model/dynsql.dart' as flex;
import 'package:quiknowte/view/represent/model/app_state.dart';

import '../../../screen_size.dart';
import 'actions.dart';

AppState reducer(AppState prev, dynamic action) {
  AppState newState;
  newState = AppState.fromAppstate(prev);

  if (action is CreateGlobalData) {
    List tear;
    int i;
    int j;
    if (prev.selTable.isNotEmpty) {
      for(j = 0; j < prev.selTable.length; j++){
      flex.DatabaseHelper().getAllSamples(prev.selTable[j].toString()).then((val) {
        tear = val;
        print(tear[0][prev.axisYVal]);
        for (i = 0; i < tear.length; i++) {
          newState.globalMultiTimeData.add(
            [
            PropertiesDateTime(tear[i][prev.axisXVal] as DateTime,
                double.parse(tear[i][prev.axisYVal].toString()).round()),
            ]
          );
        }
      });
    }
    }
  } else if (action is CreateGlobalMultiDateTimeData) {
     List tear;
    int i;
    int j;
    if (prev.selTable.isNotEmpty) {
      for(j = 0; j < prev.selTable.length; j++){
      flex.DatabaseHelper().getAllSamples(prev.selTable[j].toString()).then((val) {
        tear = val;
        print(tear[0][prev.axisYVal]);
        for (i = 0; i < tear.length; i++) {
          newState.globalMultiTimeData.add(
            [
            PropertiesDateTime(tear[i][prev.axisXVal] as DateTime,
                double.parse(tear[i][prev.axisYVal].toString()).round()),
            ]
          );
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
          
          newState.globalMultiData[index].add(
            Properties(tear[i][prev.axisXVal].toString(),
                double.parse(tear[i][prev.axisYVal].toString()).round()),
                );
                print('?////////////////////????????????');
        print(newState.globalMultiData.toString());
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
      for(j = 0; j < prev.selTable.length; j++){
      flex.DatabaseHelper().getAllSamples(prev.selTable[j].toString()).then((val) {
        tear = val;
        print(tear[0][prev.axisYVal]);
        for (i = 0; i < tear.length; i++) {
          newState.globalMultiIntData.add(
            [
            PropertiesInt(double.parse(tear[i][prev.axisXVal].toString()).round(),
                double.parse(tear[i][prev.axisYVal].toString()).round()),
            ]
          );
        }
      });
    }
    }
  } else if (action is SamplezTap) {
    newState.sampleVisible = !prev.sampleVisible;
  } else if (action is ChartzTap) {
    newState.chartzVisible = !prev.chartzVisible;
  } else if (action is FetchTables) {
    flex.DatabaseHelper().getAllTables().then((val) {
        newState.tableList = val;
      // print('UUUUUUU');
      // print('Length: ${_tableList.length}');
    });
  } else if (action is Bull) {
    flex.DatabaseHelper().getAllTables().then((val) {
        for (var i = 0; i < val.length; i++) {
          newState.checkVal.add(false);
        }
    });
  } else if (action is TableStructRad) {
    Future<List<Map>> answ;
    if (prev.radioRes.isNotEmpty) {
      flex.DatabaseHelper().getTableInfo(prev.radioRes.toString()).then((val) {
        newState.rett = val;
      });
      answ = flex.DatabaseHelper().getTableInfo(prev.radioRes.toString());
      newState..axisXVisible = true
      ..axisYVisible = true;
    } else {
      newState..axisXVisible = false
      ..axisYVisible = false;
    }
    answ.then((val) {
      print('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      print(newState.rett);
    });
  } else if (action is TableStructCheck) {
    Future<List<Map>> answ;
    if (prev.selTable.isNotEmpty) {
      flex.DatabaseHelper().getTableInfo(prev.selTable[0].toString()).then((val) {
        newState.rett = val;
      });
      answ = flex.DatabaseHelper().getTableInfo(prev.selTable[0].toString());
      newState..axisXVisible = true
      ..axisYVisible = true;
    } else {
      newState..axisXVisible = false
      ..axisYVisible = false;
    }
    answ.then((val) {
      print('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      print(newState.rett);
    });
  } else if (action is HandleRadioValueChange) {
    newState.radioRes = action.i.toString();
    print('KKKKKKKKKKKKKKKK');
    print(newState.radioRes);
      newState.radioValue = action.i;
      // tableStructRad();            **************************************************************
  } else if (action is Canvas) {
    Padding _canvas;      
    //**********************************************************************/
    if (prev.globalData.isNotEmpty || prev.globalMultiData.isNotEmpty) {
      _canvas = Padding(
        padding: EdgeInsets.all(16),
        child: Container(
          height: SizeConfig.blockSizeVertical * 55,
          padding: EdgeInsets.all(8),
          color: Colors.white,
          child: newState.chartClass,
        ),
      );
    } else {
      _canvas = Padding(
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
    newState.samplez = [];
    for (var i = 0; i < prev.tableList.length; i++) {
      newState.samplez.add(DropdownMenuItem(
          value: prev.tableList[i]['name'].toString(),
          child: Text(prev.tableList[i]['name'].toString())));
    }
  } else if (action is SamplesList) {
    newState.samplez = []
    ..add(
        DropdownMenuItem<List>(
          value: [],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // children: checkb(),      ********************************************************
          ),
        ),
      );
  } else if (action is ColList) {
    newState.samplez = [];
    for (var i = 0; i < prev.rett.length - 1; i++) {
      if (action.axis == 'X') {
        newState.samplez.add(DropdownMenuItem(
            value: prev.rett[i]['name'].toString(),
            child: Text(prev.rett[i]['name'].toString())));
      } else if (action.axis == 'Y') {
        if (prev.rett[i]['type'].toString() == 'REAL') {
          newState.samplez.add(DropdownMenuItem(
              value: prev.rett[i]['name'].toString(),
              child: Text(prev.rett[i]['name'].toString())));
        }
      }
    }
  } else if (action is SampleCols) {
    newState.raw = [];
    for (var i = 0; i < prev.tableList.length; i++) {
      newState.raw.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(prev.tableList[i]['name'].toString()),
          ],
        ),
      );
    }
  } else if (action is Checkb) {
    newState.raw = [];
    for (var i = 0; i < prev.tableList.length; i++) {
      newState.raw.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
                child: prev.checkState == 'box'
                    ? Checkbox(
                        value: prev.checkVal[i],
                        onChanged: (bool value) {
                            newState.checkVal[i] = value;
                            if (newState.checkVal[i] == true) {
                              newState.selTable.add(prev.tableList[i]['name'].toString());
                            } else {
                              newState.selTable
                                  .remove(prev.tableList[i]['name'].toString());
                            }
                            newState.globalMultiData = List.generate(prev.selTable.length, (index) => []);
                            // tableStructCheck(); ************************
                        },
                      )
                    : prev.checkState == 'radio'
                        ? Radio(
                            value: prev.tableList[i]['name'].toString(),
                            groupValue: prev.radioValue,
                            onChanged: (_){},
                            // onChanged: _handleRadioValueChange, **********************
                          )
                        : null),
            Text(prev.tableList[i]['name'].toString()),
          ],
        ),
      );
    }
  }
  return newState;
}
