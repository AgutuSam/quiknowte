import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:quiknowte/charts/axes/bar_secondary_axis.dart';
import 'package:quiknowte/charts/axes/bar_secondary_axis_only.dart';
import 'package:quiknowte/charts/axes/custom_axis_tick_formatters.dart';
import 'package:quiknowte/charts/axes/custom_font_size_and_color.dart';
import 'package:quiknowte/charts/axes/custom_measure_tick_count.dart';
import 'package:quiknowte/charts/axes/flipped_vertical_axis.dart';
import 'package:quiknowte/charts/axes/gridline_dash_pattern.dart';
import 'package:quiknowte/charts/axes/hidden_ticks_and_labels_axis.dart';
import 'package:quiknowte/charts/axes/horizontal_bar_secondary_axis.dart';
import 'package:quiknowte/charts/axes/integer_only_measure_axis.dart';
import 'package:quiknowte/charts/axes/line_disjoint_axis.dart';
import 'package:quiknowte/charts/axes/measure_axis_label_alignment.dart';
import 'package:quiknowte/charts/axes/nonzero_bound_measure_axis.dart';
import 'package:quiknowte/charts/axes/numeric_initial_viewport.dart';
import 'package:quiknowte/charts/axes/ordinal_initial_viewport.dart';
import 'package:quiknowte/charts/axes/short_tick_length_axis.dart';
import 'package:quiknowte/charts/axes/statically_provided_ticks.dart';
import 'package:quiknowte/charts/bar_chart/custom_rounded_bars.dart';
import 'package:quiknowte/charts/bar_chart/grouped.dart';
import 'package:quiknowte/charts/bar_chart/grouped_fill_color.dart';
import 'package:quiknowte/charts/bar_chart/grouped_single_target_line.dart';
import 'package:quiknowte/charts/bar_chart/grouped_stacked.dart';
import 'package:quiknowte/charts/bar_chart/grouped_stacked_weight_pattern.dart';
import 'package:quiknowte/charts/bar_chart/grouped_target_line.dart';
import 'package:quiknowte/charts/bar_chart/horizontal.dart';
import 'package:quiknowte/charts/bar_chart/horizontal_bar_label.dart';
import 'package:quiknowte/charts/bar_chart/horizontal_bar_label_custom.dart';
import 'package:quiknowte/charts/bar_chart/horizontal_pattern_forward_hatch.dart';
import 'package:quiknowte/charts/bar_chart/pattern_forward_hatch.dart';
import 'package:quiknowte/charts/bar_chart/simple.dart';
import 'package:quiknowte/charts/bar_chart/spark_bar.dart';
import 'package:quiknowte/charts/bar_chart/stacked.dart';
import 'package:quiknowte/charts/bar_chart/stacked_fill_color.dart';
import 'package:quiknowte/charts/bar_chart/stacked_horizontal.dart';
import 'package:quiknowte/charts/bar_chart/stacked_target_line.dart';
import 'package:quiknowte/charts/bar_chart/vertical_bar_label.dart';
import 'package:quiknowte/charts/chartproperties.dart';
import 'package:quiknowte/charts/combo_chart/date_time_line_point.dart';
import 'package:quiknowte/charts/combo_chart/numeric_line_bar.dart';
import 'package:quiknowte/charts/combo_chart/numeric_line_point.dart';
import 'package:quiknowte/charts/combo_chart/ordinal_bar_line.dart';
import 'package:quiknowte/charts/combo_chart/scatter_plot_line.dart';
import 'package:quiknowte/charts/legends/datum_legend_options.dart';
import 'package:quiknowte/charts/legends/datum_legend_with_measures.dart';
import 'package:quiknowte/charts/legends/default_hidden_series_legend.dart';
import 'package:quiknowte/charts/legends/legend_custom_symbol.dart';
import 'package:quiknowte/charts/legends/series_legend_options.dart';
import 'package:quiknowte/charts/legends/series_legend_with_measures.dart';
import 'package:quiknowte/charts/legends/simple_datum_legend.dart';
import 'package:quiknowte/charts/legends/simple_series_legend.dart';
import 'package:quiknowte/charts/line_chart/animation_zoom.dart';
import 'package:quiknowte/charts/line_chart/area_and_line.dart';
import 'package:quiknowte/charts/line_chart/dash_pattern.dart';
import 'package:quiknowte/charts/line_chart/line_annotation.dart';
import 'package:quiknowte/charts/line_chart/points.dart';
import 'package:quiknowte/charts/line_chart/range_annotation.dart';
import 'package:quiknowte/charts/line_chart/range_annotation_margin.dart';
import 'package:quiknowte/charts/line_chart/segments.dart';
import 'package:quiknowte/charts/line_chart/simple.dart';
import 'package:quiknowte/charts/line_chart/simple_nulls.dart';
import 'package:quiknowte/charts/line_chart/stacked_area.dart';
import 'package:quiknowte/charts/line_chart/stacked_area_custom_color.dart';
import 'package:quiknowte/charts/line_chart/stacked_area_nulls.dart';
import 'package:quiknowte/charts/pie_chart/auto_label.dart';
import 'package:quiknowte/charts/pie_chart/donut.dart';
import 'package:quiknowte/charts/pie_chart/gauge.dart';
import 'package:quiknowte/charts/pie_chart/outside_label.dart';
import 'package:quiknowte/charts/pie_chart/partial_pie.dart';
import 'package:quiknowte/charts/pie_chart/simple.dart';
import 'package:quiknowte/charts/time_series_chart/confidence_interval.dart';
import 'package:quiknowte/charts/time_series_chart/end_points_axis.dart';
import 'package:quiknowte/charts/time_series_chart/line_annotation.dart';
import 'package:quiknowte/charts/time_series_chart/range_annotation.dart';
import 'package:quiknowte/charts/time_series_chart/simple.dart';
import 'package:quiknowte/charts/time_series_chart/symbol_annotation.dart';
import 'package:quiknowte/charts/time_series_chart/with_bar_renderer.dart';
import 'package:quiknowte/model/dynsql.dart' as flex;
import 'package:quiknowte/samples/common.dart';
import 'package:quiknowte/screen_size.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:typicons_flutter/typicons_flutter.dart';

class Representation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RepresentationSate();
  }
}

class _RepresentationSate extends State<Representation>
    with TickerProviderStateMixin {
  GlobalKey _globalKey = GlobalKey();
  TabController controlle;
  bool _chartzVisible = false;
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
  String _axisXVal;
  String _axisYVal;
  String selTab;
  Widget chartClass;
  var _radioValue;
  var counter = 0;
  String _checkState;
  String radioRes;
  String globalDataChooser;
  final fileName = TextEditingController();
  final fileNote = TextEditingController();
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

  List<Properties> globalData;
  List<List<Properties>> globalMultiData;
  List<List<PropertiesDateTime>> globalMultiTimeData;
  List<List<PropertiesInt>> globalMultiIntData;
  List<charts.Series<Properties, String>>  multiDataVal;
  static Random random = Random();
  static Color getColor() {
    return Color.fromARGB(255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }

  void createGlobalData() {
    List tear;
    int i;
    if (radioRes.isNotEmpty) {
      flex.DatabaseHelper().getAllSamples(radioRes.toString()).then((val) {
        tear = val;
        print(tear[0][_axisYVal]);
        for (i = 0; i < tear.length; i++) {
          globalData.add(
            Properties(tear[i][_axisXVal].toString(),
                double.parse(tear[i][_axisYVal].toString()).round()),
          );
        }
      });
    }
  }

  void createGlobalMultiDateTimeData() {
    List tear;
    int i;
    int j;
    if (_selTable.isNotEmpty) {
      for(j = 0; j < _selTable.length; j++){
      flex.DatabaseHelper().getAllSamples(_selTable[j].toString()).then((val) {
        tear = val;
        print(tear[0][_axisYVal]);
        for (i = 0; i < tear.length; i++) {
          globalMultiTimeData.add(
            [
            PropertiesDateTime(tear[i][_axisXVal] as DateTime,
                double.parse(tear[i][_axisYVal].toString()).round()),
            ]
          );
        }
      });
    }
    }
  }

  void createGlobalMultiData() {
    List tear;
    int i;
    if (_selTable.isNotEmpty) {
      _selTable.asMap().forEach((index, element) { 
        flex.DatabaseHelper().getAllSamples(element.toString()).then((val) {
        tear = val;
        
        for (i = 0; i < tear.length; i++) {
          
          globalMultiData[index].add(
            Properties(tear[i][_axisXVal].toString(),
                double.parse(tear[i][_axisYVal].toString()).round()),
                );
                print('?////////////////////????????????');
        print(globalMultiData.toString());
        print('????????/////////////////////////????????');
        }
      });
      });
      setState(() {
        _selTable = [];
      });
    }
  }

  void createGlobalMultiIntData() {
    List tear;
    int i;
    int j;
    if (_selTable != []) {
      for(j = 0; j < _selTable.length; j++){
      flex.DatabaseHelper().getAllSamples(_selTable[j].toString()).then((val) {
        tear = val;
        print(tear[0][_axisYVal]);
        for (i = 0; i < tear.length; i++) {
          globalMultiIntData.add(
            [
            PropertiesInt(double.parse(tear[i][_axisXVal].toString()).round(),
                double.parse(tear[i][_axisYVal].toString()).round()),
            ]
          );
        }
      });
    }
    }
  }

  Future<Uint8List> _capturePng() async {
    // try {
    //   print('inside');
    final RenderRepaintBoundary boundary =
        _globalKey.currentContext.findRenderObject() as RenderRepaintBoundary;
    final ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    final ByteData byteData =
        await image.toByteData(format: ui.ImageByteFormat.png);
    final pngBytes = byteData.buffer.asUint8List();
    final bs64 = base64Encode(pngBytes);
    print(pngBytes);
    print(bs64);
    setState(() {});
    return pngBytes;
    // } catch (e) {
    //   print(e);
    // }
  }

  void samplezTap() {
    setState(() {
      _sampleVisible = !_sampleVisible;
    });
  }

  void chartzTap() {
    setState(() {
      _chartzVisible = !_chartzVisible;
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

  Future<List<Map>> tableStructRad() async {
    Future<List<Map>> answ;
    if (radioRes.isNotEmpty) {
      flex.DatabaseHelper().getTableInfo(radioRes.toString()).then((val) {
        rett = val;
      });
      answ = flex.DatabaseHelper().getTableInfo(radioRes.toString());
      _axisXVisible = true;
      _axisYVisible = true;
    } else {
      _axisXVisible = false;
      _axisYVisible = false;
    }
    answ.then((val) {
      print('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      print(rett);
    });
    return answ;
  }

  Future<List<Map>> tableStructCheck() async {
    Future<List<Map>> answ;
    if (_selTable.isNotEmpty) {
      flex.DatabaseHelper().getTableInfo(_selTable[0].toString()).then((val) {
        rett = val;
      });
      answ = flex.DatabaseHelper().getTableInfo(_selTable[0].toString());
      _axisXVisible = true;
      _axisYVisible = true;
    } else {
      _axisXVisible = false;
      _axisYVisible = false;
    }
    answ.then((val) {
      print('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      print(rett);
    });
    return answ;
  }

  void _handleRadioValueChange(dynamic i) {
    radioRes = i.toString();
    print('KKKKKKKKKKKKKKKK');
    print(radioRes);
    setState(() {
      _radioValue = i;
      tableStructRad();
    });
  }

  Padding canvas() {
    Padding _canvas;
    if (globalData.isNotEmpty || globalMultiData.isNotEmpty) {
      _canvas = Padding(
        padding: EdgeInsets.all(16),
        child: Container(
          height: SizeConfig.blockSizeVertical * 55,
          padding: EdgeInsets.all(8),
          color: Colors.white,
          child: chartClass,
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

    return _canvas;
  }

  @override
  void initState() {
    _tableList = [];
    _selTable = [];
    _checkVal = [];
    samplez = [];
    globalData = [];
    globalMultiData = [];
    multiDataVal = [];
    rett = ['test'];
    _radioValue = -1;
    _checkState = 'radio';
    axesSelected = List.generate(17, (index) => false);
    barsSelected = List.generate(19, (index) => false);
    comboSelected = List.generate(5, (index) => false);
    legendsSelected = List.generate(8, (index) => false);
    linesSelected = List.generate(13, (index) => false);
    piesSelected = List.generate(6, (index) => false);
    timesSelected = List.generate(7, (index) => false);
    globalDataChooser = 'default';
    fetchTables();
    tableStructRad();
    tableStructCheck();
    bull();
    // canvas();
    print(selTab);
    super.initState();
    controlle = TabController(length: 8, vsync: this);
  }

  void onCapPress(int index) {
    setState(() {
      // selected[index] = !selected[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Widget cards(
        String image, String title, Widget route, String check, int index) {
      return InkWell(
        onTap: () {
          List<bool> selected;
          if (image.substring(14, 18) == 'axes') {
            selected = axesSelected;
          } else if (image.substring(14, 23) == 'bar_chart') {
            selected = barsSelected;
          } else if (image.substring(14, 25) == 'combo_chart') {
            selected = comboSelected;
          } else if (image.substring(14, 21) == 'legends') {
            selected = legendsSelected;
          } else if (image.substring(14, 24) == 'line_chart') {
            selected = linesSelected;
          } else if (image.substring(14, 24) == 'pie_charts') {
            selected = piesSelected;
          } else if (image.substring(14, 32) == 'time_series_charts') {
            selected = timesSelected;
          }

          setState(() {
            chartClass = route;
            _checkState = check;
            for (int buttonIndex = 0;
                buttonIndex < selected.length;
                buttonIndex++) {
              if (buttonIndex == index) {
                selected[buttonIndex] = !selected[buttonIndex];
              } else {
                selected[buttonIndex] = false;
              }
            }
            if(title == 'Custom Legend'){
              globalDataChooser = 'multi';
            }
          }
          );
        },
        child: Opacity(
          opacity: 0.8,
          child: Container(
            height: 180,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              // borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 6.0,
                ),
              ],
              // color: Colors.white,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    image,
                    height: 80,
                    width: 120,
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Text(title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  // Container(
                  //     padding: EdgeInsets.all(5),
                  //     margin: EdgeInsets.only(top: 4),
                  //     color: Colors.deepOrange,
                  //     child: Text("\$ " + price,
                  //         style: TextStyle(
                  //             color: Colors.white,
                  //             fontWeight: FontWeight.bold,
                  //             fontSize: 12))),
                ],
              ),
            ),
          ),
        ),
      );
    }

    InkWell choozer(String title, Function() ontap, double tl, double tr,
        double bl, double br) {
      return InkWell(
        onTap: ontap,
        child: Container(
          height: SizeConfig.blockSizeVertical * 7,
          // width: SizeConfig.blockSizeHorizontal * 5,
          margin: EdgeInsetsDirectional.only(start: 40, end: 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(tl),
                bottomLeft: Radius.circular(bl),
                topRight: Radius.circular(tr),
                bottomRight: Radius.circular(br)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 6.0,
              ),
            ],
            color: Colors.white,
          ),
          child: Center(
            child: Text(title),
          ),
        ),
      );
    }

    List<charts.Series<Properties, String>> _createData(
        String eyedee, List<Properties> globalData) {
          
      return [
        charts.Series<Properties, String>(
          id: eyedee,
          domainFn: (Properties valew, _) => valew.domain,
          measureFn: (Properties valew, _) => valew.measure,
          data: globalData,
        )
          // Set series to use the secondary measure axis.
          // ..setAttribute(charts.measureAxisIdKey, secondaryMeasureAxisId),
      ];
    }

    List<charts.Series<PropertiesInt, int>> 
    _createMultiIntData(String eyedee, List<List<PropertiesInt>> globalMultiIntData) {
      List<charts.Series<PropertiesInt, int>>  val;
      for(var i = 0; i < globalMultiTimeData.length; i++){
        val = [
        charts.Series<PropertiesInt, int>(
        id: eyedee[i],
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (PropertiesInt valew, _) => valew.dtDomain,
        measureFn: (PropertiesInt valew, _) => valew.measure,
        data: globalMultiIntData[i],
      )
      ..setAttribute(charts.rendererIdKey, 'customPoint'),
        ];
      }
      return val;
      
    }

    List<charts.Series<Properties, String>> 
    _createMultiData(String eyedee, List<List<Properties>> globalMultiData) {
    print(':::::::::::::::::::::::::::::::::::::::::::::::::::');
    print(globalMultiData.toString());
    print(':::::::::::::::::::::::::::::::::::::::::::::::::::');
      for(var i = 0; i < globalMultiData.length; i++){
        multiDataVal.add(
        charts.Series<Properties, String>(
        id: 'heey',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(getColor()),
        domainFn: (Properties valew, _) => valew.domain,
        measureFn: (Properties valew, _) => valew.measure,
        data: globalMultiData[i],
      )
      // ..setAttribute(charts.rendererIdKey, 'customPoint'),
        );
      }
        
      return multiDataVal;
    }

   List<charts.Series<PropertiesDateTime, DateTime>> 
    _createMultiTimeData(String eyedee, List<List<PropertiesDateTime>> globalMultiTimeData) {
   List<charts.Series<PropertiesDateTime, DateTime>>  val;
      for(var i = 0; i < globalMultiTimeData.length; i++){
        val = [
        charts.Series<PropertiesDateTime, DateTime>(
        id: eyedee[i],
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (PropertiesDateTime valew, _) => valew.dtDomain,
        measureFn: (PropertiesDateTime valew, _) => valew.measure,
        data: globalMultiTimeData[i],
      )
      ..setAttribute(charts.rendererIdKey, 'customPoint'),
        ];
      }
      return val;
  }

    final List<Tabz> tabz = <Tabz>[
      Tabz(
        title: 'AXES',
        icon: Icons.filter_1,
        wijet: Tab(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                choozer('Charts', chartzTap, 15, 15, 0, 0),
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                Visibility(
                  visible: _chartzVisible,
                  child: Container(
                    height: 350.0,
                    // width: MediaQuery.of(context).size.width,
                    child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 1.2,
                        padding: const EdgeInsets.all(36.0),
                        mainAxisSpacing: 20.0,
                        crossAxisSpacing: 8.0,
                        children: [
                          // cards(
                          //     'assets/charts/axes/bar_secondary_axis_only_full.png',
                          //     'Bar Secondary Only',
                          //     BarChartWithSecondaryAxisOnly(_createData('Rubbing', globalData)), 'radio'),
                          cards(
                              'assets/charts/axes/bar_secondary_axis_only_full.png',
                              'Secondary Only',
                              BarChartWithSecondaryAxisOnly(
                                  _createData('Rubbing', globalData)),
                              'radio',
                              0),
                          // VisibilityExample()),
                          cards(
                              'assets/charts/axes/bar_secondary_axis_full.png',
                              'Secondary Axis',
                              BarChartWithSecondaryAxis(
                                  _createData('Rubbing', globalData)),
                              'radio',
                              1),
                          cards(
                              'assets/charts/axes/custom_axis_tick_formatters_full.png',
                              'CustomAxis Tick',
                              CustomAxisTickFormatters.withSampleData(),
                              'box',
                              2),
                          cards(
                              'assets/charts/axes/custom_font_size_and_color_full.png',
                              'FontSize Color',
                              CustomFontSizeAndColor(
                                  _createData('Rubbing', globalData)),
                              'radio',
                              3),
                          cards(
                              'assets/charts/axes/custom_measure_tick_count_full.png',
                              'Custom Measure',
                              CustomMeasureTickCount.withSampleData(),
                              'box',
                              4),
                          cards(
                              'assets/charts/axes/flipped_vertical_axis_full.png',
                              'Flipped Vertical',
                              FlippedVerticalAxis(
                                  _createData('Rubbing', globalData)),
                              'radio',
                              5),
                          cards(
                              'assets/charts/axes/gridline_dash_pattern_full.png',
                              'Gridline Dash',
                              GridlineDashPattern.withSampleData(),
                              'box',
                              6),
                          cards(
                              'assets/charts/axes/hidden_ticks_and_labels_axis_full.png',
                              'Hidden Ticks',
                              HiddenTicksAndLabelsAxis(
                                  _createData('Rubbing', globalData)),
                              'radio',
                              7),
                          cards(
                              'assets/charts/axes/horizontal_bar_secondary_axis_full.png',
                              'Horizontal Bar',
                              HorizontalBarChartWithSecondaryAxis(
                                  _createData('Rubbing', globalData)),
                              'radio',
                              8),
                          cards(
                              'assets/charts/axes/integer_only_measure_axis_full.png',
                              'Integer Only Axis',
                              IntegerOnlyMeasureAxis.withSampleData(),
                              'box',
                              9),
                          cards(
                              'assets/charts/axes/line_disjoint_axis_full.png',
                              'Disjoint Axis',
                              DisjointMeasureAxisLineChart(
                                  _createData('Rubbing', globalData)),
                              'radio',
                              10),
                          cards(
                              'assets/charts/axes/measure_axis_label_alignment_full.png',
                              'Measure Axis',
                              MeasureAxisLabelAlignment(
                                  _createData('Rubbing', globalData)),
                              'radio',
                              11),
                          cards(
                              'assets/charts/axes/nonzero_bound_measure_axis_full.png',
                              'Nonzero Bound',
                              NonzeroBoundMeasureAxis.withSampleData(),
                              'box',
                              12),
                          cards(
                              'assets/charts/axes/numeric_initial_viewport_full.png',
                              'Numeric Initial',
                              NumericInitialViewport(
                                  _createData('Rubbing', globalData)),
                              'radio',
                              13),
                          cards(
                              'assets/charts/axes/ordinal_initial_viewport_full.png',
                              'Ordinal Initial',
                              OrdinalInitialViewport(
                                  _createData('Rubbing', globalData)),
                              'radio',
                              14),
                          cards(
                              'assets/charts/axes/short_tick_length_axis_full.png',
                              'Short Tick',
                              ShortTickLengthAxis(
                                  _createData('Rubbing', globalData)),
                              'radio',
                              15),
                          cards(
                              'assets/charts/axes/statically_provided_ticks_full.png',
                              'Statically Ticks',
                              StaticallyProvidedTicks(
                                  _createData('Rubbing', globalData)),
                              'radio',
                              16),
                        ].asMap().entries.map((widget) {
                          return ToggleButtons(
                            selectedColor: Colors.red,
                            splashColor: Colors.lightBlue,
                            selectedBorderColor: Colors.green,
                            fillColor: Colors.white,
                            borderColor: null,
                            borderWidth: 3.0,
                            hoverColor: Colors.orange,
                            highlightColor: Colors.blue,
                            isSelected: [axesSelected[widget.key]],
                            onPressed: (_) => onCapPress(widget.key),
                            children: [widget.value],
                          );
                        }).toList()),
                  ),
                ),
                Container(
                  height: SizeConfig.blockSizeVertical * 2,
                ),
                choozer('Samples', samplezTap, 0, 0, 15, 15),
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                Visibility(
                  // visible: _sampleVisible,
                  visible: _sampleVisible,
                  child: Column(
                    children: <Widget>[
                      Scrollable(
                        viewportBuilder:
                            (BuildContext context, ViewportOffset position) {
                          return Column(
                            children: checkb(),
                          );
                        },
                      ),
                      Visibility(
                        visible: _axisXVisible,
                        child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
                            ),
                            iconSize: 40,
                            value: _axisXVal,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            onChanged: (value) {
                              setState(() {
                                _axisXVal = value as String;
                                // createGlobalData();
                                // canvas();
                              });
                            },
                            hint: Text('X Axis'),
                            // items: listtype == true ? samplesList() : samplesString()),
                            items: colList('X')),
                      ),
                      Visibility(
                        visible: _axisYVisible,
                        child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
                            ),
                            iconSize: 40,
                            value: _axisYVal,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            onChanged: (value) {
                              setState(() {
                                _axisYVal = value as String;
                                createGlobalData();
                                canvas();
                              });
                            },
                            hint: Text('Y Axis'),
                            // items: listtype == true ? samplesList() : samplesString()),
                            items: colList('Y')),
                      ),
                    ],
                  ),
                ),
                RepaintBoundary(
                  key: _globalKey,
                  child: canvas(),
                ),
              ],
            ),
          ),
        ),
      ),
      Tabz(
        title: 'BARS',
        icon: Icons.filter_2,
        wijet: Tab(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                choozer('Charts', chartzTap, 15, 15, 0, 0),
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                Visibility(
                  visible: _chartzVisible,
                  child: Container(
                    height: 350.0,
                    // width: MediaQuery.of(context).size.width,
                    child:
                        //             GridView.count(
                        // crossAxisCount: 2,
                        // children: [
                        //   Icon(Icons.info),
                        //   Icon(Icons.title),
                        //   Icon(Icons.info),
                        //   Icon(Icons.title)
                        // ].asMap().entries.map((widget) {

                        //   return ToggleButtons(
                        //     selectedColor: Colors.red,
                        //     splashColor: Colors.lightBlue,
                        //     selectedBorderColor: Colors.green,
                        //     fillColor: Colors.transparent,
                        //     isSelected: [selected[widget.key]],
                        //     onPressed: (_) => onCapPress(widget.key),
                        //     children: [widget.value],
                        //   );
                        // }).toList()
                        GridView.count(
                            crossAxisCount: 2,
                            childAspectRatio: 1.2,
                            padding: const EdgeInsets.all(36.0),
                            mainAxisSpacing: 20.0,
                            crossAxisSpacing: 8.0,
                            children: [
                              cards(
                                  'assets/charts/bar_charts/simple_full.png',
                                  'Simple Bar',
                                  SimpleBarChart(
                                      _createData('Rubbing', globalData)),
                                  'radio',
                                  0),
                              cards(
                                  'assets/charts/bar_charts/custom_rounded_bars_full.png',
                                  'Custom Round',
                                  CustomRoundedBars(
                                      _createData('Rubbing', globalData)),
                                  'radio',
                                  1),
                              cards(
                                  'assets/charts/bar_charts/grouped_fill_color_full.png',
                                  'Grouped Fill',
                                  GroupedFillColorBarChart(
                                      _createData('Rubbing', globalData)),
                                  'radio',
                                  2),
                              cards(
                                  'assets/charts/bar_charts/grouped_full.png',
                                  'Grouped',
                                  GroupedBarChart(
                                      _createData('Rubbing', globalData)),
                                  'radio',
                                  3),
                              cards(
                                  'assets/charts/bar_charts/grouped_stacked_full.png',
                                  'Grouped Stacked',
                                  GroupedStackedBarChart(
                                      _createData('Rubbing', globalData)),
                                  'radio',
                                  4),
                              cards(
                                  'assets/charts/bar_charts/grouped_stacked_weight_pattern_full.png',
                                  'Weight Pattern',
                                  GroupedStackedWeightPatternBarChart(
                                      _createData('Rubbing', globalData)),
                                  'radio',
                                  5),
                              cards(
                                  'assets/charts/bar_charts/grouped_target_line_full.png',
                                  'Grouped Target',
                                  GroupedBarTargetLineChart(
                                      _createData('Rubbing', globalData)),
                                  'radio',
                                  6),
                              cards(
                                  'assets/charts/bar_charts/grouped_target_line_full.png',
                                  'Single Taget',
                                  GroupedBarSingleTargetLineChart(
                                      _createData('Rubbing', globalData)),
                                  'radio',
                                  7),
                              cards(
                                  'assets/charts/bar_charts/horizontal_full.png',
                                  'Horizontal Bar',
                                  HorizontalBarChart(
                                      _createData('Rubbing', globalData)),
                                  'radio',
                                  8),
                              cards(
                                  'assets/charts/bar_charts/horizontal_bar_label_full.png',
                                  'Horizontal Label',
                                  HorizontalBarLabelChart(
                                      _createData('Rubbing', globalData)),
                                  'radio',
                                  9),
                              cards(
                                  'assets/charts/bar_charts/horizontal_bar_label_custom_full.png',
                                  'Horizontal Custom',
                                  HorizontalBarLabelCustomChart(
                                      _createData('Rubbing', globalData)),
                                  'radio',
                                  10),
                              cards(
                                  'assets/charts/bar_charts/horizontal_pattern_forward_hatch_full.png',
                                  'Horizontal Forward',
                                  HorizontalPatternForwardHatchBarChart(
                                      _createData('Rubbing', globalData)),
                                  'radio',
                                  11),
                              cards(
                                  'assets/charts/bar_charts/pattern_forward_hatch_full.png',
                                  'Pattern Forward',
                                  PatternForwardHatchBarChart(
                                      _createData('Rubbing', globalData)),
                                  'radio',
                                  12),
                              cards(
                                  'assets/charts/bar_charts/spark_bar_full.png',
                                  'Spark Bar',
                                  SparkBar(_createData('Rubbing', globalData)),
                                  'radio',
                                  13),
                              cards(
                                  'assets/charts/bar_charts/stacked_fill_color_full.png',
                                  'Stacked Color',
                                  StackedFillColorBarChart(
                                      _createData('Rubbing', globalData)),
                                  'radio',
                                  14),
                              cards(
                                  'assets/charts/bar_charts/stacked_horizontal_full.png',
                                  'Stacked Horizontal',
                                  StackedHorizontalBarChart(
                                      _createData('Rubbing', globalData)),
                                  'radio',
                                  15),
                              cards(
                                  'assets/charts/bar_charts/stacked_full.png',
                                  'Stacked',
                                  StackedBarChart(
                                      _createData('Rubbing', globalData)),
                                  'radio',
                                  16),
                              cards(
                                  'assets/charts/bar_charts/stacked_target_line_full.png',
                                  'Stacked Line',
                                  StackedBarTargetLineChart(
                                      _createData('Rubbing', globalData)),
                                  'radio',
                                  17),
                              cards(
                                  'assets/charts/bar_charts/vertical_bar_label_full.png',
                                  'Vertical Bar',
                                  VerticalBarLabelChart(
                                      _createData('Rubbing', globalData)),
                                  'radio',
                                  18),
                            ].asMap().entries.map((widget) {
                              return ToggleButtons(
                                selectedColor: Colors.red,
                                splashColor: Colors.lightBlue,
                                selectedBorderColor: Colors.green,
                                fillColor: Colors.white,
                                borderColor: null,
                                borderWidth: 3.0,
                                hoverColor: Colors.orange,
                                highlightColor: Colors.blue,
                                isSelected: [barsSelected[widget.key]],
                                onPressed: (_) => onCapPress(widget.key),
                                children: [widget.value],
                              );
                            }).toList()),
                  ),
                ),
                Container(
                  height: SizeConfig.blockSizeVertical * 2,
                ),
                choozer('Samples', samplezTap, 0, 0, 15, 15),
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                Visibility(
                  // visible: _sampleVisible,
                  visible: _sampleVisible,
                  child: Column(
                    children: <Widget>[
                      Scrollable(
                        viewportBuilder:
                            (BuildContext context, ViewportOffset position) {
                          return Column(
                            children: checkb(),
                          );
                        },
                      ),
                      Visibility(
                        visible: _axisXVisible,
                        child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
                            ),
                            iconSize: 40,
                            value: _axisXVal,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            onChanged: (value) {
                              setState(() {
                                _axisXVal = value as String;
                                // createGlobalData();
                                // canvas();
                              });
                            },
                            hint: Text('X Axis'),
                            // items: listtype == true ? samplesList() : samplesString()),
                            items: colList('X')),
                      ),
                      Visibility(
                        visible: _axisYVisible,
                        child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
                            ),
                            iconSize: 40,
                            value: _axisYVal,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            onChanged: (value) {
                              setState(() {
                                _axisYVal = value as String;
                                createGlobalData();
                                canvas();
                              });
                            },
                            hint: Text('Y Axis'),
                            // items: listtype == true ? samplesList() : samplesString()),
                            items: colList('Y')),
                      ),
                    ],
                  ),
                ),
                RepaintBoundary(
                  key: _globalKey,
                  child: canvas(),
                ),
              ],
            ),
          ),
        ),
      ),
      Tabz(
        title: 'COMBO',
        icon: Icons.filter_3,
        wijet: Tab(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                choozer('Charts', chartzTap, 15, 15, 0, 0),
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                Visibility(
                  visible: _chartzVisible,
                  child: Container(
                    height: 350.0,
                    // width: MediaQuery.of(context).size.width,
                    child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 1.2,
                        padding: const EdgeInsets.all(36.0),
                        mainAxisSpacing: 20.0,
                        crossAxisSpacing: 8.0,
                        children: [
                          cards(
                              'assets/charts/combo_charts/date_time_line_point_full.png',
                              'Time Line',
                              DateTimeComboLinePointChart.withSampleData(),
                              'box',
                              0),
                          cards(
                              'assets/charts/combo_charts/numeric_line_bar_full.png',
                              'Numeric Bar',
                              NumericComboLineBarChart(
                                  _createData('Rubbing', globalData)),
                              'radio',
                              1),
                          cards(
                              'assets/charts/combo_charts/numeric_line_point_full.png',
                              'Numeric Point',
                              NumericComboLinePointChart(
                                  _createData('Rubbing', globalData)),
                              'radio',
                              2),
                          cards(
                              'assets/charts/combo_charts/ordinal_bar_line_full.png',
                              'Ordinal Line',
                              OrdinalComboBarLineChart(
                                  _createData('Rubbing', globalData)),
                              'radio',
                              3),
                          cards(
                              'assets/charts/combo_charts/scatter_plot_line_full.png',
                              'Scatter Line',
                              ScatterPlotComboLineChart(
                                  _createData('Rubbing', globalData)),
                              'radio',
                              4),
                        ].asMap().entries.map((widget) {
                          return ToggleButtons(
                            selectedColor: Colors.red,
                            splashColor: Colors.lightBlue,
                            selectedBorderColor: Colors.green,
                            fillColor: Colors.white,
                            borderColor: null,
                            borderWidth: 3.0,
                            hoverColor: Colors.orange,
                            highlightColor: Colors.blue,
                            isSelected: [comboSelected[widget.key]],
                            onPressed: (_) => onCapPress(widget.key),
                            children: [widget.value],
                          );
                        }).toList()),
                  ),
                ),
                Container(
                  height: SizeConfig.blockSizeVertical * 2,
                ),
                choozer('Samples', samplezTap, 0, 0, 15, 15),
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                Visibility(
                  // visible: _sampleVisible,
                  visible: _sampleVisible,
                  child: Column(
                    children: <Widget>[
                      Scrollable(
                        viewportBuilder:
                            (BuildContext context, ViewportOffset position) {
                          return Column(
                            children: checkb(),
                          );
                        },
                      ),
                      Visibility(
                        visible: _axisXVisible,
                        child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
                            ),
                            iconSize: 40,
                            value: _axisXVal,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            onChanged: (value) {
                              setState(() {
                                _axisXVal = value as String;
                                // createGlobalData();
                                // canvas();
                              });
                            },
                            hint: Text('X Axis'),
                            // items: listtype == true ? samplesList() : samplesString()),
                            items: colList('X')),
                      ),
                      Visibility(
                        visible: _axisYVisible,
                        child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
                            ),
                            iconSize: 40,
                            value: _axisYVal,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            onChanged: (value) {
                              setState(() {
                                _axisYVal = value as String;
                                createGlobalData();
                                canvas();
                              });
                            },
                            hint: Text('Y Axis'),
                            // items: listtype == true ? samplesList() : samplesString()),
                            items: colList('Y')),
                      ),
                    ],
                  ),
                ),
                RepaintBoundary(
                  key: _globalKey,
                  child: canvas(),
                ),
              ],
            ),
          ),
        ),
      ),
      Tabz(
        title: 'LEGENDS',
        icon: Icons.filter_4,
        wijet: Tab(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                choozer('Charts', chartzTap, 15, 15, 0, 0),
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                Visibility(
                  visible: _chartzVisible,
                  child: Container(
                    height: 350.0,
                    // width: MediaQuery.of(context).size.width,
                    child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 1.2,
                        padding: const EdgeInsets.all(36.0),
                        mainAxisSpacing: 20.0,
                        crossAxisSpacing: 8.0,
                        children: [
                          cards(
                              'assets/charts/legends/datum_legend_options_full.png',
                              'Datum Options',
                              DatumLegendOptions(
                                  _createData('Rubbing', globalData)),
                              'radio',
                              0),
                          cards(
                              'assets/charts/legends/datum_legend_with_measures_full.png',
                              'Datum Measures',
                              DatumLegendWithMeasures(
                                  _createData('Rubbing', globalData)),
                              'radio',
                              1),
                          cards(
                              'assets/charts/legends/default_hidden_series_legend_full.png',
                              'Default Hidden',
                              DefaultHiddenSeriesLegend(
                                  _createData('Rubbing', globalData)),
                              'radio',
                              2),
                          cards(
                              'assets/charts/legends/legend_custom_symbol_full.png',
                              'Custom Legend',
                              LegendWithCustomSymbol(
                                  _createMultiData('Rubbing', globalMultiData)),
                              'box',
                              3),
                          cards(
                              'assets/charts/legends/series_legend_options_full.png',
                              'Series Options',
                              LegendOptions(_createData('Rubbing', globalData)),
                              'radio',
                              4),
                          cards(
                              'assets/charts/legends/series_legend_with_measures_full.png',
                              'Series Measures',
                              LegendWithMeasures(
                                  _createData('Rubbing', globalData)),
                              'radio',
                              5),
                          cards(
                              'assets/charts/legends/simple_datum_legend_full.png',
                              'Simple Datum',
                              SimpleDatumLegend(
                                  _createData('Rubbing', globalData)),
                              'radio',
                              6),
                          cards(
                              'assets/charts/legends/simple_series_legend_full.png',
                              'Simple Series',
                              SimpleSeriesLegend(
                                  _createData('Rubbing', globalData)),
                              'radio',
                              7),
                        ].asMap().entries.map((widget) {
                          return ToggleButtons(
                            selectedColor: Colors.red,
                            splashColor: Colors.lightBlue,
                            selectedBorderColor: Colors.green,
                            fillColor: Colors.white,
                            borderColor: null,
                            borderWidth: 3.0,
                            hoverColor: Colors.orange,
                            highlightColor: Colors.blue,
                            isSelected: [legendsSelected[widget.key]],
                            onPressed: (_) => onCapPress(widget.key),
                            children: [widget.value],
                          );
                        }).toList()),
                  ),
                ),
                Container(
                  height: SizeConfig.blockSizeVertical * 2,
                ),
                choozer('Samples', samplezTap, 0, 0, 15, 15),
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                Visibility(
                  // visible: _sampleVisible,
                  visible: _sampleVisible,
                  child: Column(
                    children: <Widget>[
                      Scrollable(
                        viewportBuilder:
                            (BuildContext context, ViewportOffset position) {
                          return Column(
                            children: checkb(),
                          );
                        },
                      ),
                      Visibility(
                        visible: _axisXVisible,
                        child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
                            ),
                            iconSize: 40,
                            value: _axisXVal,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            onChanged: (value) {
                              setState(() {
                                _axisXVal = value as String;
                                // createGlobalData();
                                // canvas();
                              });
                            },
                            hint: Text('X Axis'),
                            // items: listtype == true ? samplesList() : samplesString()),
                            items: colList('X')),
                      ),
                      Visibility(
                        visible: _axisYVisible,
                        child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
                            ),
                            iconSize: 40,
                            value: _axisYVal,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            onChanged: (value) {
                              setState(() {
                                _axisYVal = value as String;
                                if(globalDataChooser == 'default'){
                                  createGlobalData();
                                }else if(globalDataChooser == 'multi'){
                                  print('OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO');
                                  createGlobalMultiData();
                                }                                
                                canvas();
                              });
                            },
                            hint: Text('Y Axis'),
                            // items: listtype == true ? samplesList() : samplesString()),
                            items: colList('Y')),
                      ),
                    ],
                  ),
                ),
                RepaintBoundary(
                  key: _globalKey,
                  child: canvas(),
                ),
              ],
            ),
          ),
        ),
      ),
      Tabz(
        title: 'LINES',
        icon: Icons.filter_5,
        wijet: Tab(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                choozer('Charts', chartzTap, 15, 15, 0, 0),
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                Visibility(
                  visible: _chartzVisible,
                  child: Container(
                    height: 350.0,
                    // width: MediaQuery.of(context).size.width,
                    child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 1.2,
                        padding: const EdgeInsets.all(36.0),
                        mainAxisSpacing: 20.0,
                        crossAxisSpacing: 8.0,
                        children: [
                          cards(
                              'assets/charts/line_charts/simple_full.png',
                              'Animation Zoom',
                              LineAnimationZoomChart(
                                  _createData('Rubbing', globalData)),
                              'radio',
                              0),
                          cards(
                              'assets/charts/line_charts/area_and_line_full.png',
                              'Area & Line',
                              AreaAndLineChart(
                                  _createData('Rubbing', globalData)),
                              'radio',
                              1),
                          cards(
                              'assets/charts/line_charts/dash_pattern_full.png',
                              'Dash Pattern',
                              DashPatternLineChart(
                                  _createData('Rubbing', globalData)),
                              'radio',
                              2),
                          cards(
                              'assets/charts/line_charts/line_annotation_full.png',
                              'Line Annotation',
                              LineLineAnnotationChart(
                                  _createData('Rubbing', globalData)),
                              'radio',
                              3),
                          cards(
                              'assets/charts/line_charts/points_full.png',
                              'Points',
                              PointsLineChart(
                                  _createData('Rubbing', globalData)),
                              'radio',
                              4),
                          cards(
                              'assets/charts/line_charts/range_annotation_margin_full.png',
                              'Range Margin',
                              LineRangeAnnotationMarginChart(
                                  _createData('Rubbing', globalData)),
                              'radio',
                              5),
                          cards(
                              'assets/charts/line_charts/range_annotation_full.png',
                              'Range Annotation',
                              LineRangeAnnotationChart(
                                  _createData('Rubbing', globalData)),
                              'radio',
                              6),
                          cards(
                              'assets/charts/line_charts/segments_full.png',
                              'Segments',
                              SegmentsLineChart(
                                  _createData('Rubbing', globalData)),
                              'radio',
                              7),
                          cards(
                              'assets/charts/line_charts/simple_nulls_full.png',
                              'Simple Null',
                              SimpleNullsLineChart(
                                  _createData('Rubbing', globalData)),
                              'radio',
                              8),
                          cards(
                              'assets/charts/line_charts/simple_full.png',
                              'Simple',
                              SimpleLineChart(
                                  _createData('Rubbing', globalData)),
                              'radio',
                              9),
                          cards(
                              'assets/charts/line_charts/stacked_area_custom_color_full.png',
                              'Stacked Area Custom',
                              StackedAreaCustomColorLineChart(
                                  _createData('Rubbing', globalData)),
                              'radio',
                              10),
                          cards(
                              'assets/charts/line_charts/stacked_area_nulls_full.png',
                              'Stacked Null',
                              StackedAreaNullsLineChart(
                                  _createData('Rubbing', globalData)),
                              'radio',
                              11),
                          cards(
                              'assets/charts/line_charts/stacked_area_full.png',
                              'Stacked Area',
                              StackedAreaLineChart(
                                  _createData('Rubbing', globalData)),
                              'radio',
                              12),
                        ].asMap().entries.map((widget) {
                          return ToggleButtons(
                            selectedColor: Colors.red,
                            splashColor: Colors.lightBlue,
                            selectedBorderColor: Colors.green,
                            fillColor: Colors.white,
                            borderColor: null,
                            borderWidth: 3.0,
                            hoverColor: Colors.orange,
                            highlightColor: Colors.blue,
                            isSelected: [linesSelected[widget.key]],
                            onPressed: (_) => onCapPress(widget.key),
                            children: [widget.value],
                          );
                        }).toList()),
                  ),
                ),
                Container(
                  height: SizeConfig.blockSizeVertical * 2,
                ),
                choozer('Samples', samplezTap, 0, 0, 15, 15),
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                Visibility(
                  // visible: _sampleVisible,
                  visible: _sampleVisible,
                  child: Column(
                    children: <Widget>[
                      Scrollable(
                        viewportBuilder:
                            (BuildContext context, ViewportOffset position) {
                          return Column(
                            children: checkb(),
                          );
                        },
                      ),
                      Visibility(
                        visible: _axisXVisible,
                        child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
                            ),
                            iconSize: 40,
                            value: _axisXVal,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            onChanged: (value) {
                              setState(() {
                                _axisXVal = value as String;
                                // createGlobalData();
                                // canvas();
                              });
                            },
                            hint: Text('X Axis'),
                            // items: listtype == true ? samplesList() : samplesString()),
                            items: colList('X')),
                      ),
                      Visibility(
                        visible: _axisYVisible,
                        child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
                            ),
                            iconSize: 40,
                            value: _axisYVal,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            onChanged: (value) {
                              setState(() {
                                _axisYVal = value as String;
                                createGlobalData();
                                canvas();
                              });
                            },
                            hint: Text('Y Axis'),
                            // items: listtype == true ? samplesList() : samplesString()),
                            items: colList('Y')),
                      ),
                    ],
                  ),
                ),
                RepaintBoundary(
                  key: _globalKey,
                  child: canvas(),
                ),
              ],
            ),
          ),
        ),
      ),
      Tabz(
        title: 'PIE',
        icon: Icons.filter_6,
        wijet: Tab(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                choozer('Charts', chartzTap, 15, 15, 0, 0),
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                Visibility(
                  visible: _chartzVisible,
                  child: Container(
                    height: 350.0,
                    // width: MediaQuery.of(context).size.width,
                    child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 1.2,
                        padding: const EdgeInsets.all(36.0),
                        mainAxisSpacing: 20.0,
                        crossAxisSpacing: 8.0,
                        children: [
                          cards(
                              'assets/charts/pie_charts/auto_label_full.png',
                              'Auto Label',
                              DonutAutoLabelChart(
                                  _createData('Rubbing', globalData)),
                              'radio',
                              0),
                          cards(
                              'assets/charts/pie_charts/donut_full.png',
                              'Doughnut',
                              DonutPieChart(_createData('Rubbing', globalData)),
                              'radio',
                              1),
                          cards(
                              'assets/charts/pie_charts/gauge_full.png',
                              'Gauge',
                              GaugeChart(_createData('Rubbing', globalData)),
                              'radio',
                              2),
                          cards(
                              'assets/charts/pie_charts/outside_label_full.png',
                              'Outside Label',
                              PieOutsideLabelChart(
                                  _createData('Rubbing', globalData)),
                              'radio',
                              3),
                          cards(
                              'assets/charts/pie_charts/partial_pie_full.png',
                              'Partial Pie',
                              PartialPieChart(
                                  _createData('Rubbing', globalData)),
                              'radio',
                              4),
                          cards(
                              'assets/charts/pie_charts/simple_full.png',
                              'Simple Pie',
                              SimplePieChart(
                                  _createData('Rubbing', globalData)),
                              'radio',
                              5),
                        ].asMap().entries.map((widget) {
                          return ToggleButtons(
                            selectedColor: Colors.red,
                            splashColor: Colors.lightBlue,
                            selectedBorderColor: Colors.green,
                            fillColor: Colors.white,
                            borderColor: null,
                            borderWidth: 3.0,
                            hoverColor: Colors.orange,
                            highlightColor: Colors.blue,
                            isSelected: [piesSelected[widget.key]],
                            onPressed: (_) => onCapPress(widget.key),
                            children: [widget.value],
                          );
                        }).toList()),
                  ),
                ),
                Container(
                  height: SizeConfig.blockSizeVertical * 2,
                ),
                choozer('Samples', samplezTap, 0, 0, 15, 15),
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                Visibility(
                  // visible: _sampleVisible,
                  visible: _sampleVisible,
                  child: Column(
                    children: <Widget>[
                      Scrollable(
                        viewportBuilder:
                            (BuildContext context, ViewportOffset position) {
                          return Column(
                            children: checkb(),
                          );
                        },
                      ),
                      Visibility(
                        visible: _axisXVisible,
                        child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
                            ),
                            iconSize: 40,
                            value: _axisXVal,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            onChanged: (value) {
                              setState(() {
                                _axisXVal = value as String;
                                // createGlobalData();
                                // canvas();
                              });
                            },
                            hint: Text('X Axis'),
                            // items: listtype == true ? samplesList() : samplesString()),
                            items: colList('X')),
                      ),
                      Visibility(
                        visible: _axisYVisible,
                        child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
                            ),
                            iconSize: 40,
                            value: _axisYVal,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            onChanged: (value) {
                              setState(() {
                                _axisYVal = value as String;
                                createGlobalData();
                                canvas();
                              });
                            },
                            hint: Text('Y Axis'),
                            // items: listtype == true ? samplesList() : samplesString()),
                            items: colList('Y')),
                      ),
                    ],
                  ),
                ),
                RepaintBoundary(
                  key: _globalKey,
                  child: canvas(),
                ),
              ],
            ),
          ),
        ),
      ),
      Tabz(
        title: 'SERIES',
        icon: Icons.filter_7,
        wijet: Tab(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                choozer('Charts', chartzTap, 15, 15, 0, 0),
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                Visibility(
                  visible: _chartzVisible,
                  child: Container(
                    height: 350.0,
                    // width: MediaQuery.of(context).size.width,
                    child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 1.2,
                        padding: const EdgeInsets.all(36.0),
                        mainAxisSpacing: 20.0,
                        crossAxisSpacing: 8.0,
                        children: [
                          cards(
                              'assets/charts/time_series_charts/confidence_interval_full.png',
                              'Confidence Interval',
                              TimeSeriesConfidenceInterval.withSampleData(),
                              'box',
                              0),
                          cards(
                              'assets/charts/time_series_charts/end_points_axis_full.png',
                              'End Point',
                              EndPointsAxisTimeSeriesChart.withSampleData(),
                              'box',
                              1),
                          cards(
                              'assets/charts/time_series_charts/line_annotation_full.png',
                              'Line Annotation',
                              TimeSeriesLineAnnotationChart.withSampleData(),
                              'box',
                              2),
                          cards(
                              'assets/charts/time_series_charts/range_annotation_full.png',
                              'Range Annotation',
                              TimeSeriesRangeAnnotationChart.withSampleData(),
                              'box',
                              3),
                          cards(
                              'assets/charts/time_series_charts/simple_full.png',
                              'Simple',
                              SimpleTimeSeriesChart.withSampleData(),
                              'box',
                              4),
                          cards(
                              'assets/charts/time_series_charts/symbol_annotation_full.png',
                              'Symbol Annotation',
                              TimeSeriesSymbolAnnotationChart.withSampleData(),
                              'box',
                              5),
                          cards(
                              'assets/charts/time_series_charts/with_bar_renderer_full.png',
                              'Bar Render',
                              TimeSeriesBar.withSampleData(),
                              'box',
                              6),
                        ].asMap().entries.map((widget) {
                          return ToggleButtons(
                            selectedColor: Colors.red,
                            splashColor: Colors.lightBlue,
                            selectedBorderColor: Colors.green,
                            fillColor: Colors.white,
                            borderColor: null,
                            borderWidth: 3.0,
                            hoverColor: Colors.orange,
                            highlightColor: Colors.blue,
                            isSelected: [timesSelected[widget.key]],
                            onPressed: (_) => onCapPress(widget.key),
                            children: [widget.value],
                          );
                        }).toList()),
                  ),
                ),
                Container(
                  height: SizeConfig.blockSizeVertical * 2,
                ),
                choozer('Samples', samplezTap, 0, 0, 15, 15),
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                Visibility(
                  // visible: _sampleVisible,
                  visible: _sampleVisible,
                  child: Column(
                    children: <Widget>[
                      Scrollable(
                        viewportBuilder:
                            (BuildContext context, ViewportOffset position) {
                          return Column(
                            children: checkb(),
                          );
                        },
                      ),
                      Visibility(
                        visible: _axisXVisible,
                        child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
                            ),
                            iconSize: 40,
                            value: _axisXVal,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            onChanged: (value) {
                              setState(() {
                                _axisXVal = value as String;
                                // createGlobalData();
                                // canvas();
                              });
                            },
                            hint: Text('X Axis'),
                            // items: listtype == true ? samplesList() : samplesString()),
                            items: colList('X')),
                      ),
                      Visibility(
                        visible: _axisYVisible,
                        child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
                            ),
                            iconSize: 40,
                            value: _axisYVal,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            onChanged: (value) {
                              setState(() {
                                _axisYVal = value as String;
                                createGlobalData();
                                canvas();
                              });
                            },
                            hint: Text('Y Axis'),
                            // items: listtype == true ? samplesList() : samplesString()),
                            items: colList('Y')),
                      ),
                    ],
                  ),
                ),
                RepaintBoundary(
                  key: _globalKey,
                  child: canvas(),
                ),
              ],
            ),
          ),
        ),
      ),
      Tabz(
        title: 'TABLES',
        icon: Icons.filter_8,
        wijet: Tab(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                choozer('Charts', chartzTap, 15, 15, 0, 0),
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                Visibility(
                  visible: _chartzVisible,
                  child: Container(
                    height: 350.0,
                    // width: MediaQuery.of(context).size.width,
                    child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 1.2,
                        padding: const EdgeInsets.all(36.0),
                        mainAxisSpacing: 20.0,
                        crossAxisSpacing: 8.0,
                        children: []),
                  ),
                ),
                Container(
                  height: SizeConfig.blockSizeVertical * 2,
                ),
                choozer('Samples', samplezTap, 0, 0, 15, 15),
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                Visibility(
                  // visible: _sampleVisible,
                  visible: _sampleVisible,
                  child: Column(
                    children: <Widget>[
                      Scrollable(
                        viewportBuilder:
                            (BuildContext context, ViewportOffset position) {
                          return Column(
                            children: checkb(),
                          );
                        },
                      ),
                      Visibility(
                        visible: _axisXVisible,
                        child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
                            ),
                            iconSize: 40,
                            value: _axisXVal,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            onChanged: (value) {
                              setState(() {
                                _axisXVal = value as String;
                                // createGlobalData();
                                // canvas();
                              });
                            },
                            hint: Text('X Axis'),
                            // items: listtype == true ? samplesList() : samplesString()),
                            items: colList('X')),
                      ),
                      Visibility(
                        visible: _axisYVisible,
                        child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
                            ),
                            iconSize: 40,
                            value: _axisYVal,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            onChanged: (value) {
                              setState(() {
                                _axisYVal = value as String;
                                createGlobalData();
                                canvas();
                              });
                            },
                            hint: Text('Y Axis'),
                            // items: listtype == true ? samplesList() : samplesString()),
                            items: colList('Y')),
                      ),
                    ],
                  ),
                ),
                RepaintBoundary(
                  key: _globalKey,
                  child: canvas(),
                ),
              ],
            ),
          ),
        ),
      ),
    ];

    return MaterialApp(
      home: DefaultTabController(
        length: tabz.length,
        child: Scaffold(
          backgroundColor: Colors.blue.shade100,
          appBar: AppBar(
            title: Text('Data Representation'),
            bottom: TabBar(
              controller: controlle,
              isScrollable: true,
              tabs: tabz.map((Tabz choice) {
                return Tab(
                  text: choice.title,
                  icon: Icon(choice.icon),
                );
              }).toList(),
            ),
          ),
          body: TabBarView(
            controller: controlle,
            children: tabz.map((Tabz choice) {
              return choice.wijet;
            }).toList(),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('File Name'),
                      content: TextField(
                        style: TextStyle(color: Colors.blue),
                        controller: fileName,
                        decoration: InputDecoration(
                          hintText: 'Save As',
                          hintStyle: TextStyle(color: Colors.blue.shade500),
                        ),
                      ),
                      actions: <Widget>[
                        MaterialButton(
                          onPressed: () {
                            Uint8List image;
                            _capturePng().then((value) async {
                              final SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              final String dbTime =
                                  prefs.getString('projectTime');
                              image = value;
                              final img = PdfImage.file(
                                pdf.document,
                                bytes: image,
                              );
                              pdf.addPage(pw.Page(build: (pw.Context context) {
                                return pw.Center(
                                  child: pw.Image(img),
                                ); // Center
                              }));

                              final bool dirExists = await Directory(
                                      '/data/user/0/com.example.quiknowte/$dbTime/')
                                  .exists();
                              // Common().sDCardDir = (await getExternalStorageDirectory()).path;
                              if (!dirExists) {
                                Directory(
                                        '/data/user/0/com.example.quiknowte/$dbTime/')
                                    .create()
                                    .then((Directory directory) {
                                  Common().sDCardDir = directory.path;
                                });
                              }

                              final file = File(
                                  '/data/user/0/com.example.quiknowte/$dbTime/${fileName.text}');
                              await file.writeAsBytes(pdf.save());
                            });
                          },
                          child: Text('Export',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 22)),
                          elevation: 5.0,
                        ),
                      ],
                    );
                  });
            },
            tooltip: 'export',
            child: Icon(Typicons.export_outline),
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

  List<DropdownMenuItem> colList(String axis) {
    samplez = [];
    for (var i = 0; i < rett.length - 1; i++) {
      if (axis == 'X') {
        samplez.add(DropdownMenuItem(
            value: rett[i]['name'].toString(),
            child: Text(rett[i]['name'].toString())));
      } else if (axis == 'Y') {
        if (rett[i]['type'].toString() == 'REAL') {
          samplez.add(DropdownMenuItem(
              value: rett[i]['name'].toString(),
              child: Text(rett[i]['name'].toString())));
        }
      }
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
            Container(
                child: _checkState == 'box'
                    ? Checkbox(
                        value: _checkVal[i],
                        onChanged: (bool value) {
                          setState(() {
                            _checkVal[i] = value;
                            if (_checkVal[i] == true) {
                              _selTable.add(_tableList[i]['name'].toString());
                            } else {
                              _selTable
                                  .remove(_tableList[i]['name'].toString());
                            }
                            globalMultiData = List.generate(_selTable.length, (index) => []);
                            tableStructCheck();
                          });
                        },
                      )
                    : _checkState == 'radio'
                        ? Radio(
                            value: _tableList[i]['name'].toString(),
                            groupValue: _radioValue,
                            onChanged: _handleRadioValueChange,
                          )
                        : null),
            Text(_tableList[i]['name'].toString()),
          ],
        ),
      );
    }

    return raw;
  }
}

class Tabz {
  Tabz({this.wijet, this.title, this.icon});
  final Widget wijet;
  final String title;
  final IconData icon;
}

class Choice {
  Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

List<Choice> choices = <Choice>[
  Choice(title: 'CAR', icon: Icons.directions_car),
  Choice(title: 'BICYCLE', icon: Icons.directions_bike),
  Choice(title: 'BOAT', icon: Icons.directions_boat),
  Choice(title: 'BUS', icon: Icons.directions_bus),
  Choice(title: 'BUS', icon: Icons.directions_bus),
  Choice(title: 'BUS', icon: Icons.directions_bus),
  Choice(title: 'TRAIN', icon: Icons.directions_railway),
  Choice(title: 'WALK', icon: Icons.directions_walk),
];
