import 'package:flutter/material.dart';
import 'package:quiknowte/charts/chartproperties.dart';
import 'package:quiknowte/view/represent/model/models.dart';
import 'package:quiknowte/view/represent/model/app_state.dart';
import 'package:redux/redux.dart';

class CreateGlobalData {}

class CreateGlobalMultiDateTimeData {}

class CreateGlobalMultiData {}

class CreateGlobalMultiIntData {}

class CapturePng {}

class SamplezTap {}

class ChartzTap {}

class FetchTables {}

class Bull {}

class TableStructRad {}

class TableStructCheck {}

class HandleRadioValueChange {
  HandleRadioValueChange(this.i);
  final dynamic i;
}

class Canvas {}

class CapPress {}

class SamplesString {}

class SamplesList {}

class CardzTap {
  CardzTap({this.image, this.check, this.index, this.route, this.title});
  final String image;
  final String title; 
  final String route;
  final String check;
  final int index;
}

class ColList {
  ColList(this.axis);
  final String axis;
}

class AxisXVAL {
  AxisXVAL(this.xval);
  String xval;
}

class AxisYVAL {
  AxisYVAL(this.yval);
  String yval;
}

class SampleCols {}

class GetColor {}

class Cardz {
  String image;
  String title;
  Widget route;
  String check;
  int index;
  Function() ontap;

  Cardz({this.image, this.ontap, this.title, this.route, this.check, this.index});

static cardzStore(Store<AppState> store) {
    return Cardz(
      // login: (String username, String password) {tore.dispatch(loginUser(username, password),
    );
  }

}

class GlobalCreateData{
  final String eyedee;
  final List<Properties> globalData;

  GlobalCreateData({this.eyedee, this.globalData});
}

class GlobalCreateMultiData{
  final String eyedee;
  final List<List<Properties>> globalMultiData;

  GlobalCreateMultiData({this.eyedee, this.globalMultiData});
}

class GlobalCreateMultiIntData{
  final String eyedee;
  final List<List<PropertiesInt>> globalMultiIntData;

  GlobalCreateMultiIntData({this.eyedee, this.globalMultiIntData});
}

class GlobalCreateMultiTimeData{
  final String eyedee;
  final List<List<PropertiesDateTime>> globalMultiTimeData;

  GlobalCreateMultiTimeData({this.eyedee, this.globalMultiTimeData});
}

class Tubz {
  final Widget wijet;
  final String title;
  final IconData icon;

  Tubz({this.wijet, this.title, this.icon});
  }

  class Choozer{
  final String title;
  final Function() ontap;
  final double tl;
  final double tr;
  final double bl;
  final double br;

  Choozer({this.bl, this.br, this.ontap, this.title, this.tl, this.tr});
}