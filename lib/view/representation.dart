import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
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
import 'package:quiknowte/screen_size.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:quiknowte/model/dynsql.dart' as flex;
import 'package:typicons_flutter/typicons_flutter.dart';

class Representation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
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
  Widget chartClass;
  var _radioValue;
  String _checkState;
  String radioRes;
  final _formKey = GlobalKey<FormState>();
  final fileName = TextEditingController();
  final fileNote = TextEditingController();
  static const secondaryMeasureAxisId = 'secondaryMeasureAxisId';
   dynamic file;
  


  List<Properties> globalData;

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

//  Future<String> _capturePng() async {
//    final RenderRepaintBoundary boundary =
//           _globalKey.currentContext.findRenderObject() as RenderRepaintBoundary;
//   final image = await boundary.toImage();
//   final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
//   final pngBytes = byteData.buffer.asUint8List();
//   final bs64 = base64Encode(pngBytes);
//   print(pngBytes);
//   return  bs64;
//   }

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
    if (globalData.isNotEmpty) {
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
    rett = ['test'];
    _radioValue = -1;
    _checkState = 'radio';
    fetchTables();
    tableStructRad();
    tableStructCheck();
    bull();
    // canvas();
    super.initState();
    controlle = TabController(length: 8, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Widget cards(String image, String title, Widget route, String check) {
      return InkWell(
        onTap: () {
          setState(() {
            chartClass = route;
            _checkState = check;
          });
        },
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
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
                  width: 100,
                ),
                SizedBox(
                  height: 2,
                ),
                Text(title,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
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
          ..setAttribute(charts.measureAxisIdKey, secondaryMeasureAxisId),
      ];
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
                        padding: const EdgeInsets.all(16.0),
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
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
                              'radio'),
                          // VisibilityExample()),
                          cards(
                              'assets/charts/axes/bar_secondary_axis_full.png',
                              'Secondary Axis',
                              BarChartWithSecondaryAxis(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/axes/custom_axis_tick_formatters_full.png',
                              'CustomAxis Tick',
                              CustomAxisTickFormatters.withSampleData(),
                              'box'),
                          cards(
                              'assets/charts/axes/custom_font_size_and_color_full.png',
                              'FontSize Color',
                              CustomFontSizeAndColor(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/axes/custom_measure_tick_count_full.png',
                              'Custom Measure',
                              CustomMeasureTickCount.withSampleData(),
                              'box'),
                          cards(
                              'assets/charts/axes/flipped_vertical_axis_full.png',
                              'Flipped Vertical',
                              FlippedVerticalAxis(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/axes/gridline_dash_pattern_full.png',
                              'Gridline Dash',
                              GridlineDashPattern.withSampleData(),
                              'box'),
                          cards(
                              'assets/charts/axes/hidden_ticks_and_labels_axis_full.png',
                              'Hidden Ticks',
                              HiddenTicksAndLabelsAxis(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/axes/horizontal_bar_secondary_axis_full.png',
                              'Horizontal Bar',
                              HorizontalBarChartWithSecondaryAxis(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/axes/integer_only_measure_axis_full.png',
                              'Integer Only Axis',
                              IntegerOnlyMeasureAxis.withSampleData(),
                              'box'),
                          cards(
                              'assets/charts/axes/line_disjoint_axis_full.png',
                              'Disjoint Axis',
                              DisjointMeasureAxisLineChart(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/axes/measure_axis_label_alignment_full.png',
                              'Measure Axis',
                              MeasureAxisLabelAlignment(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/axes/nonzero_bound_measure_axis_full.png',
                              'Nonzero Bound',
                              NonzeroBoundMeasureAxis.withSampleData(),
                              'box'),
                          cards(
                              'assets/charts/axes/numeric_initial_viewport_full.png',
                              'Numeric Initial',
                              NumericInitialViewport(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/axes/ordinal_initial_viewport_full.png',
                              'Ordinal Initial',
                              OrdinalInitialViewport(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/axes/short_tick_length_axis_full.png',
                              'Short Tick',
                              ShortTickLengthAxis(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/axes/statically_provided_ticks_full.png',
                              'Statically Ticks',
                              StaticallyProvidedTicks(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                        ]),
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
                    child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 1.2,
                        padding: const EdgeInsets.all(16.0),
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                        children: [
                          cards(
                              'assets/charts/bar_charts/simple_full.png',
                              'Simple Bar',
                              SimpleBarChart(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/bar_charts/custom_rounded_bars_full.png',
                              'Custom Round',
                              CustomRoundedBars(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/bar_charts/grouped_fill_color_full.png',
                              'Grouped Fill',
                              GroupedFillColorBarChart(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/bar_charts/grouped_full.png',
                              'Grouped',
                              GroupedBarChart(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/bar_charts/grouped_stacked_full.png',
                              'Grouped Stacked',
                              GroupedStackedBarChart(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/bar_charts/grouped_stacked_weight_pattern_full.png',
                              'Weight Pattern',
                              GroupedStackedWeightPatternBarChart(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/bar_charts/grouped_target_line_full.png',
                              'Grouped Target',
                              GroupedBarTargetLineChart(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/bar_charts/grouped_target_line_full.png',
                              'Single Taget',
                              GroupedBarSingleTargetLineChart(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/bar_charts/horizontal_full.png',
                              'Horizontal Bar',
                              HorizontalBarChart(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/bar_charts/horizontal_bar_label_full.png',
                              'Horizontal Label',
                              HorizontalBarLabelChart(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/bar_charts/horizontal_bar_label_custom_full.png',
                              'Horizontal Custom',
                              HorizontalBarLabelCustomChart(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/bar_charts/horizontal_pattern_forward_hatch_full.png',
                              'Horizontal Forward',
                              HorizontalPatternForwardHatchBarChart(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/bar_charts/pattern_forward_hatch_full.png',
                              'Pattern Forward',
                              PatternForwardHatchBarChart(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/bar_charts/spark_bar_full.png',
                              'Spark Bar',
                              SparkBar(_createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/bar_charts/stacked_fill_color_full.png',
                              'Stacked Color',
                              StackedFillColorBarChart(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/bar_charts/stacked_horizontal_full.png',
                              'Stacked Horizontal',
                              StackedHorizontalBarChart(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/bar_charts/stacked_full.png',
                              'Stacked',
                              StackedBarChart(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/bar_charts/stacked_target_line_full.png',
                              'Stacked Line',
                              StackedBarTargetLineChart(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/bar_charts/vertical_bar_label_full.png',
                              'Vertical Bar',
                              VerticalBarLabelChart(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                        ]),
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
                canvas(),
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
                        padding: const EdgeInsets.all(16.0),
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                        children: [
                          cards(
                              'assets/charts/combo_charts/date_time_line_point_full.png',
                              'Time Line',
                              DateTimeComboLinePointChart.withSampleData(),
                              'box'),
                          cards(
                              'assets/charts/combo_charts/numeric_line_bar_full.png',
                              'Numeric Bar',
                              NumericComboLineBarChart(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/combo_charts/numeric_line_point_full.png',
                              'Numeric Point',
                              NumericComboLinePointChart(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/combo_charts/ordinal_bar_line_full.png',
                              'Ordinal Line',
                              OrdinalComboBarLineChart(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/combo_charts/scatter_plot_line_full.png',
                              'Scatter Line',
                              ScatterPlotComboLineChart(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                        ]),
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
                canvas(),
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
                        padding: const EdgeInsets.all(16.0),
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                        children: [
                          cards(
                              'assets/charts/legends/datum_legend_options_full.png',
                              'Datum Options',
                              DatumLegendOptions(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/legends/datum_legend_with_measures_full.png',
                              'Datum Measures',
                              DatumLegendWithMeasures(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/legends/default_hidden_series_legend_full.png',
                              'Default Hidden',
                              DefaultHiddenSeriesLegend(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/legends/legend_custom_symbol_full.png',
                              'Custom Legend',
                              LegendWithCustomSymbol(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/legends/series_legend_options_full.png',
                              'Series Options',
                              LegendOptions(_createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/legends/series_legend_with_measures_full.png',
                              'Series Measures',
                              LegendWithMeasures(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/legends/simple_datum_legend_full.png',
                              'Simple Datum',
                              SimpleDatumLegend(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/legends/simple_series_legend_full.png',
                              'Simple Series',
                              SimpleSeriesLegend(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                        ]),
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
                canvas(),
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
                        padding: const EdgeInsets.all(16.0),
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                        children: [
                          cards(
                              'assets/charts/line_charts/simple_full.png',
                              'Animation Zoom',
                              LineAnimationZoomChart(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/line_charts/area_and_line_full.png',
                              'Area & Line',
                              AreaAndLineChart(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/line_charts/dash_pattern_full.png',
                              'Dash Pattern',
                              DashPatternLineChart(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/line_charts/line_annotation_full.png',
                              'Line Annotation',
                              LineLineAnnotationChart(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/line_charts/points_full.png',
                              'Points',
                              PointsLineChart(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/line_charts/range_annotation_margin_full.png',
                              'Range Margin',
                              LineRangeAnnotationMarginChart(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/line_charts/range_annotation_full.png',
                              'Range Annotation',
                              LineRangeAnnotationChart(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/line_charts/segments_full.png',
                              'Segments',
                              SegmentsLineChart(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/line_charts/simple_nulls_full.png',
                              'Simple Null',
                              SimpleNullsLineChart(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/line_charts/simple_full.png',
                              'Simple',
                              SimpleLineChart(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/line_charts/stacked_area_custom_color_full.png',
                              'Stacked Area Custom',
                              StackedAreaCustomColorLineChart(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/line_charts/stacked_area_nulls_full.png',
                              'Stacked Null',
                              StackedAreaNullsLineChart(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/line_charts/stacked_area_full.png',
                              'Stacked Area',
                              StackedAreaLineChart(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                        ]),
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
                canvas(),
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
                        padding: const EdgeInsets.all(16.0),
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                        children: [
                          cards(
                              'assets/charts/pie_charts/auto_label_full.png',
                              'Auto Label',
                              DonutAutoLabelChart(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/pie_charts/donut_full.png',
                              'Doughnut',
                              DonutPieChart(_createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/pie_charts/gauge_full.png',
                              'Gauge',
                              GaugeChart(_createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/pie_charts/outside_label_full.png',
                              'Outside Label',
                              PieOutsideLabelChart(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/pie_charts/partial_pie_full.png',
                              'Partial Pie',
                              PartialPieChart(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                          cards(
                              'assets/charts/pie_charts/simple_full.png',
                              'Simple Pie',
                              SimplePieChart(
                                  _createData('Rubbing', globalData)),
                              'radio'),
                        ]),
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
                canvas(),
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
                        padding: const EdgeInsets.all(16.0),
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                        children: [
                          cards(
                              'assets/charts/time_series_charts/confidence_interval_full.png',
                              'Confidence Interval',
                              TimeSeriesConfidenceInterval.withSampleData(),
                              'box'),
                          cards(
                              'assets/charts/time_series_charts/end_points_axis_full.png',
                              'End Point',
                              EndPointsAxisTimeSeriesChart.withSampleData(),
                              'box'),
                          cards(
                              'assets/charts/time_series_charts/line_annotation_full.png',
                              'Line Annotation',
                              TimeSeriesLineAnnotationChart.withSampleData(),
                              'box'),
                          cards(
                              'assets/charts/time_series_charts/range_annotation_full.png',
                              'Range Annotation',
                              TimeSeriesRangeAnnotationChart.withSampleData(),
                              'box'),
                          cards(
                              'assets/charts/time_series_charts/simple_full.png',
                              'Simple',
                              SimpleTimeSeriesChart.withSampleData(),
                              'box'),
                          cards(
                              'assets/charts/time_series_charts/symbol_annotation_full.png',
                              'Symbol Annotation',
                              TimeSeriesSymbolAnnotationChart.withSampleData(),
                              'box'),
                          cards(
                              'assets/charts/time_series_charts/with_bar_renderer_full.png',
                              'Bar Render',
                              TimeSeriesBar.withSampleData(),
                              'box'),
                        ]),
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
                canvas(),
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
                        padding: const EdgeInsets.all(16.0),
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
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
                canvas(),
              ],
            ),
          ),
        ),
      ),
    ];

    // TODO: implement build
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
                      content: Container(
                        padding: EdgeInsets.all(20.0),
                        child: Form(
                          key: _formKey,
                          child: Stack(
                            children: <Widget>[
                              ClipPath(
                                clipper: RoundedDiagonalPathClipper(),
                                child: Container(
                                  height: SizeConfig.blockSizeVertical * 50,
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40.0)),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(
                                        height: 90.0,
                                      ),
                                      Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          child: TextFormField(
                                            style:
                                                TextStyle(color: Colors.blue),
                                            controller: fileName,
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'File Name cannot be Null!';
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                                hintText: 'Save As',
                                                hintStyle: TextStyle(
                                                    color:
                                                        Colors.blue.shade500),
                                                border: InputBorder.none,
                                                icon: Icon(
                                                  Icons.table_chart,
                                                  color: Colors.blue,
                                                )),
                                          )),
                                      Container(
                                        child: Divider(
                                          color: Colors.blue.shade400,
                                        ),
                                        padding: EdgeInsets.only(
                                            left: 20.0,
                                            right: 20.0,
                                            bottom: 10.0),
                                      ),
                                      Container(
                                        child: Divider(
                                          color: Colors.blue.shade400,
                                        ),
                                        padding: EdgeInsets.only(
                                            left: 20.0,
                                            right: 20.0,
                                            bottom: 10.0),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Container(
                                        height:
                                            SizeConfig.blockSizeVertical * 10,
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: RaisedButton(
                                            onPressed: () {
                                            // String image;
                                            //   _capturePng().then((value) {
                                            //    image = value;
                                            //    exportPDF(
                                            //       image,
                                            //       fileName.text,
                                            //       '/data/user/0/com.example.sqfentity/files/');
                                            //   });
                                              
                                            },
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        40.0)),
                                            child: Text('Export',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 22)),
                                            color: Colors.cyan,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  CircleAvatar(
                                    radius: 40.0,
                                    backgroundColor: Colors.cyan.shade600,
                                    child: Icon(Icons.add),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
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
