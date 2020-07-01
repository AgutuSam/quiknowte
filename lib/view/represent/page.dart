import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' as wig;
import 'package:flutter/rendering.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:quiknowte/model/dynsql.dart' as flex;
import 'package:quiknowte/samples/common.dart';
import 'package:quiknowte/screen_size.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:typicons_flutter/typicons_flutter.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:quiknowte/view/represent/model/app_state.dart';
import 'package:quiknowte/view/represent/model/models.dart';
import 'package:quiknowte/view/represent/redux/actions.dart';
import 'package:quiknowte/view/represent/redux/reducers.dart';

class Represent extends StatefulWidget {
  final Store<AppState> store = Store<AppState>(
    reducer,
    initialState: AppState.initial(),
  );
  @override
  State<StatefulWidget> createState() {
    return _RepresentSate(store: store);
  }
}

class _RepresentSate extends State<Represent>
    with TickerProviderStateMixin {
      _RepresentSate({this.store});
      final Store<AppState> store;
  GlobalKey axesGlobalKey = GlobalKey();
  GlobalKey barsGlobalKey = GlobalKey();
  GlobalKey comboGlobalKey = GlobalKey();
  GlobalKey linesGlobalKey = GlobalKey();
  GlobalKey legendsGlobalKey = GlobalKey();
  GlobalKey piesGlobalKey = GlobalKey();
  GlobalKey timesGlobalKey = GlobalKey();
  GlobalKey tablesGlobalKey = GlobalKey();
  TabController controlle;
  List<Widget> raw;
  List<Map> ret;
  final fileName = TextEditingController();
  // static const secondaryMeasureAxisId = 'secondaryMeasureAxisId';
  dynamic file;
  final pdf = pw.Document();

  

 Future<Uint8List> tableCapturePng() async {
    // try {
    //   print('inside');
    final RenderRepaintBoundary boundary =
        tablesGlobalKey.currentContext.findRenderObject() as RenderRepaintBoundary;
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

Future<Uint8List> axesCapturePng() async {
    // try {
    //   print('inside');
    final RenderRepaintBoundary boundary =
        axesGlobalKey.currentContext.findRenderObject() as RenderRepaintBoundary;
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

Future<Uint8List> barsCapturePng() async {
    // try {
    //   print('inside');
    final RenderRepaintBoundary boundary =
        barsGlobalKey.currentContext.findRenderObject() as RenderRepaintBoundary;
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

Future<Uint8List> comboCapturePng() async {
    // try {
    //   print('inside');
    final RenderRepaintBoundary boundary =
        comboGlobalKey.currentContext.findRenderObject() as RenderRepaintBoundary;
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

Future<Uint8List> legendsCapturePng() async {
    // try {
    //   print('inside');
    final RenderRepaintBoundary boundary =
        legendsGlobalKey.currentContext.findRenderObject() as RenderRepaintBoundary;
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

Future<Uint8List> piesCapturePng() async {
    // try {
    //   print('inside');
    final RenderRepaintBoundary boundary =
      piesGlobalKey.currentContext.findRenderObject() as RenderRepaintBoundary;
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

Future<Uint8List> linesCapturePng() async {
    // try {
    //   print('inside');
    final RenderRepaintBoundary boundary =
        linesGlobalKey.currentContext.findRenderObject() as RenderRepaintBoundary;
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

Future<Uint8List> timesCapturePng() async {
    // try {
    //   print('inside');
    final RenderRepaintBoundary boundary =
        timesGlobalKey.currentContext.findRenderObject() as RenderRepaintBoundary;
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

List<Map> fetchTables() {
    flex.DatabaseHelper().getAllTables().then((val) {
        ret = val;
    });
    return ret;
  }


  @override
  void initState() {
    super.initState();
    fetchTables();
    controlle = TabController(length: 8, vsync: this, initialIndex: 0);
  }

  

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

List<Widget> checkb() {
    raw = [];
    for (var i = 0; i < ret.length; i++) {
      raw.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            StoreConnector<AppState, String>(
            converter: (Store<AppState> store) => store.state.checkState,
          builder: (BuildContext context, String chckState) {
            return Container(
                child: StoreProvider.of<AppState>(context).state.checkState == 'box'
                    ? StoreConnector<AppState, List<bool>>(
            converter: (Store<AppState> store) => store.state.checkVal,
          builder: (BuildContext context, List<bool> chckVal) {
            return Checkbox(
                        value: StoreProvider.of<AppState>(context).state.checkVal[i],
                        onChanged: (bool value) {
                            StoreProvider.of<AppState>(context).state.checkVal[i] = value;
                            if (StoreProvider.of<AppState>(context).state.checkVal[i] == true) {
                              StoreProvider.of<AppState>(context).state.selTable.add(ret[i]['name'].toString());
                            } else {
                              StoreProvider.of<AppState>(context).state.selTable
                                  .remove(ret[i]['name'].toString());
                            }
                            StoreProvider.of<AppState>(context).state.globalMultiData = List.generate(StoreProvider.of<AppState>(context).state.selTable.length, (index) => []);
                            StoreProvider.of<AppState>(context).dispatch(TableStructCheck());                          
                        },
                      );
          },
                    )
                    : StoreProvider.of<AppState>(context).state.checkState == 'radio'
                        ? StoreConnector<AppState, dynamic>(
            converter: (Store<AppState> store) => store.state.radioValue,
          builder: (BuildContext context, dynamic radVal) {
            return Radio(
                            value: ret[i]['name'].toString(),
                            groupValue: StoreProvider.of<AppState>(context).state.radioValue,
                            onChanged: (dynamic i) {
                             StoreProvider.of<AppState>(context).dispatch(HandleRadioValueChange(i));
                             StoreProvider.of<AppState>(context).dispatch(TableStructRad());
                            }
                          );
          },
                        )
                        : null);
    },
            ),
            Text(ret[i]['name'].toString()),
          ],
        ),
      );
    }

    return raw;
  }


Widget cards(String image, String title, String route, String check, int index) {
      return StoreConnector<AppState, List<bool>>(
          converter: (Store<AppState> store) => store.state.tabzSelected,
          builder: (BuildContext context, List<bool> listBool) {
             return InkWell(
        onTap: () => StoreProvider.of<AppState>(context).dispatch(CardzTap(check: check, image: image, index: index, route: route, title: title)),
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
                ],
              ),
            ),
          ),
        ),
             );
          }
      );
}    
       
Widget chartChuzzer(String title, double tl, double tr, double bl, double br){
  return StoreConnector<AppState, bool>(
          converter: (Store<AppState> store) => store.state.chartzVisible,
          builder: (BuildContext context, bool initial) {
             return InkWell(
        onTap: () { 
          StoreProvider.of<AppState>(context).dispatch(ChartzTap());
          StoreProvider.of<AppState>(context).dispatch(Canvas());
          },
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
                );
}

Widget sampleChuzzer(String title, double tl, double tr, double bl, double br){
  return StoreConnector<AppState, AppState>(
          converter: (Store<AppState> store) => AppState.initial(),
          builder: (BuildContext context, AppState initial) {
             return InkWell(
         onTap: () { 
           StoreProvider.of<AppState>(context).dispatch(SamplezTap());
           StoreProvider.of<AppState>(context).dispatch(GlobalCreateData(eyedee: StoreProvider.of<AppState>(context).state.radioRes));
           StoreProvider.of<AppState>(context).dispatch(Canvas());
         },
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
                );
}
    

    final List<Tabz> tabz = <Tabz>[
      Tabz(
        title: 'AXES',
        icon: Icons.filter_1,
        wijet: Tab(
          child:  SingleChildScrollView(
            scrollDirection: wig.Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                chartChuzzer('Charts', 15, 15, 0, 0),
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                StoreConnector<AppState, bool>(
          converter: (Store<AppState> store) => store.state.chartzVisible,
          builder: (BuildContext context, bool data) {
            return Visibility(
                  visible: StoreProvider.of<AppState>(context).state.chartzVisible,
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
                               'BarChartWithSecondaryAxisOnly',    
                              'radio',
                              0),
                          // VisibilityExample()),
                          cards(
                              'assets/charts/axes/bar_secondary_axis_full.png',
                              'Secondary Axis',
                              'BarChartWithSecondaryAxis',
                              'radio',
                              1),
                          cards(
                              'assets/charts/axes/custom_axis_tick_formatters_full.png',
                              'CustomAxis Tick',
                              'CustomAxisTickFormatters',
                              'box',
                              2),
                          cards(
                              'assets/charts/axes/custom_font_size_and_color_full.png',
                              'FontSize Color',
                              'CustomFontSizeAndColor',
                              'radio',
                              3),
                          cards(
                              'assets/charts/axes/custom_measure_tick_count_full.png',
                              'Custom Measure',
                              'CustomMeasureTickCount',
                              'box',
                              4),
                          cards(
                              'assets/charts/axes/flipped_vertical_axis_full.png',
                              'Flipped Vertical',
                               'FlippedVerticalAxis',
                              'radio',
                              5),
                          cards(
                              'assets/charts/axes/gridline_dash_pattern_full.png',
                              'Gridline Dash',
                              'GridlineDashPatter',
                              'box',
                              6),
                          cards(
                              'assets/charts/axes/hidden_ticks_and_labels_axis_full.png',
                              'Hidden Ticks',
                              'HiddenTicksAndLabelsAxis',
                              'radio',
                              7),
                          cards(
                              'assets/charts/axes/horizontal_bar_secondary_axis_full.png',
                              'Horizontal Bar',
                              'HorizontalBarChartWithSecondaryAxis',
                              'radio',
                              8),
                          cards(
                              'assets/charts/axes/integer_only_measure_axis_full.png',
                              'Integer Only Axis',
                              'IntegerOnlyMeasureAxis',
                              'box',
                              9),
                          cards(
                              'assets/charts/axes/line_disjoint_axis_full.png',
                              'Disjoint Axis',
                              'DisjointMeasureAxisLineChart',
                              'radio',
                              10),
                          cards(
                              'assets/charts/axes/measure_axis_label_alignment_full.png',
                              'Measure Axis',
                              'MeasureAxisLabelAlignment',
                              
                              'radio',
                              11),
                          cards(
                              'assets/charts/axes/nonzero_bound_measure_axis_full.png',
                              'Nonzero Bound',
                              'NonzeroBoundMeasureAxis',
                              'box',
                              12),
                          cards(
                              'assets/charts/axes/numeric_initial_viewport_full.png',
                              'Numeric Initial',
                              'NumericInitialViewport',
                              'radio',
                              13),
                          cards(
                              'assets/charts/axes/ordinal_initial_viewport_full.png',
                              'Ordinal Initial',
                              'OrdinalInitialViewport',
                              'radio',
                              14),
                          cards(
                              'assets/charts/axes/short_tick_length_axis_full.png',
                              'Short Tick',
                              'ShortTickLengthAxis',
                              'radio',
                              15),
                          cards(
                              'assets/charts/axes/statically_provided_ticks_full.png',
                              'Statically Ticks',
                              'StaticallyProvidedTicks',
                              'radio',
                              16),
                        ].asMap().entries.map((widget) {
                          return StoreConnector<AppState, List<bool>>(
          converter: (Store<AppState> store) => store.state.axesSelected,
          builder: (BuildContext context, List<bool> data) {
            return ToggleButtons(
                            selectedColor: Colors.red,
                            splashColor: Colors.lightBlue,
                            selectedBorderColor: Colors.green,
                            fillColor: Colors.white,
                            borderColor: null,
                            borderWidth: 3.0,
                            hoverColor: Colors.orange,
                            highlightColor: Colors.blue,
                            isSelected: [StoreProvider.of<AppState>(context).state.axesSelected[widget.key]],
                            onPressed: (_) => StoreProvider.of<AppState>(context).dispatch(CapPress()),
                            children: [widget.value],
                          );
                          },
                          );
                        }).toList()),
                  ),
                );
          },
                ),
                Container(
                  height: SizeConfig.blockSizeVertical * 2,
                ),
                sampleChuzzer('Samples', 0, 0, 15, 15),
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
StoreConnector<AppState, bool>(
          converter: (Store<AppState> store) => store.state.sampleVisible,
          builder: (BuildContext context, bool data) {
            return Visibility(
                  visible: StoreProvider.of<AppState>(context).state.sampleVisible,
                  child: Column(
                    children: <Widget>[
                      Scrollable(
                        viewportBuilder:
                            (BuildContext context, ViewportOffset position) {
                          return StoreConnector<AppState, bool>(
          converter: (Store<AppState> store) => store.state.sampleVisible,
          builder: (BuildContext context, bool data) {
            return Column(
                            children: checkb(),
                            
                          );
          },
                          );
                        },
                      ),
                     StoreConnector<AppState, bool>(
          converter: (Store<AppState> store) => store.state.axisXVisible,
          builder: (BuildContext context, bool data) {
            return Visibility(
                        visible: StoreProvider.of<AppState>(context).state.axisXVisible,
                        child: StoreConnector<AppState, String>(
          converter: (Store<AppState> store) => store.state.axisXVal,
          builder: (BuildContext context, String data) {
            return DropdownButtonFormField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
                            ),
                            iconSize: 40,
                            value: StoreProvider.of<AppState>(context).state.axisXVal,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            onChanged: (value) => StoreProvider.of<AppState>(context).dispatch(AxisXVAL(value.toString())),
                            hint: Text('X Axis'),
                            items: StoreProvider.of<AppState>(context).state.rett.where((col) => col['name'].toString() != 'Id').toList().asMap().entries.map((widget) {                              
                         return DropdownMenuItem(
            value: StoreProvider.of<AppState>(context).state.rett[widget.key]['name'].toString(),
            child: Text(StoreProvider.of<AppState>(context).state.rett[widget.key]['name'].toString())
            );
                }).toList(),
                            
                            );
          },
                        ),
                      );
          },
                     ),
                     StoreConnector<AppState, bool>(
          converter: (Store<AppState> store) => store.state.axisYVisible,
          builder: (BuildContext context, bool data) {
            return Visibility(
                        visible: StoreProvider.of<AppState>(context).state.axisYVisible,
                        child: StoreConnector<AppState, String>(
          converter: (Store<AppState> store) => store.state.axisYVal,
          builder: (BuildContext context, String data) {
            return DropdownButtonFormField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
                            ),
                            iconSize: 40,
                            value: StoreProvider.of<AppState>(context).state.axisYVal,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            onChanged: (value) {
                            StoreProvider.of<AppState>(context).dispatch(AxisYVAL(value.toString()));
                            StoreProvider.of<AppState>(context).dispatch(CreateGlobalData());
                            StoreProvider.of<AppState>(context).dispatch(GlobalCreateData(eyedee: StoreProvider.of<AppState>(context).state.radioRes));
                            },
                            hint: Text('Y Axis'),
                            items: StoreProvider.of<AppState>(context).state.rett.where((col) => col['name'].toString() != 'Id' ).toList().asMap().entries.map((widget) {                              
                         return DropdownMenuItem(
            value: StoreProvider.of<AppState>(context).state.rett[widget.key]['name'].toString(),
            child: Text(StoreProvider.of<AppState>(context).state.rett[widget.key]['name'].toString())
            );
                }).toList(),
                            );
          },
                        ),
                      );
          },
                     ),
                    ],
                  ),
                );
          },
),
                StoreConnector<AppState, Padding>(
          converter: (Store<AppState> store) => store.state.canvas,
          builder: (BuildContext context, Padding data) {
            return RepaintBoundary(
                  key: axesGlobalKey,
                  child: store.state.canvas,
                );
          },
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
            scrollDirection: wig.Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                chartChuzzer('Charts', 15, 15, 0, 0),
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                StoreConnector<AppState, bool>(
          converter: (Store<AppState> store) => store.state.chartzVisible,
          builder: (BuildContext context, bool data) {
            return Visibility(
                  visible: StoreProvider.of<AppState>(context).state.chartzVisible,
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
                                  'SimpleBarChart',
                                  'radio',
                                  0),
                              cards(
                                  'assets/charts/bar_charts/custom_rounded_bars_full.png',
                                  'Custom Round',
                                   'CustomRoundedBars',
                                  'radio',
                                  1),
                              cards(
                                  'assets/charts/bar_charts/grouped_fill_color_full.png',
                                  'Grouped Fill',
                                  'GroupedFillColorBarChart',
                                  'radio',
                                  2),
                              cards(
                                  'assets/charts/bar_charts/grouped_full.png',
                                  'Grouped',
                                  'GroupedBarChart',
                                  'radio',
                                  3),
                              cards(
                                  'assets/charts/bar_charts/grouped_stacked_full.png',
                                  'Grouped Stacked',
                                  'GroupedStackedBarChart',
                                  'radio',
                                  4),
                              cards(
                                  'assets/charts/bar_charts/grouped_stacked_weight_pattern_full.png',
                                  'Weight Pattern',
                                  'GroupedStackedWeightPatternBarChart',
                                  'radio',
                                  5),
                              cards(
                                  'assets/charts/bar_charts/grouped_target_line_full.png',
                                  'Grouped Target',
                                  'GroupedBarTargetLineChart',
                                  'radio',
                                  6),
                              cards(
                                  'assets/charts/bar_charts/grouped_target_line_full.png',
                                  'Single Taget',
                                  'GroupedBarSingleTargetLineChart',
                                  'radio',
                                  7),
                              cards(
                                  'assets/charts/bar_charts/horizontal_full.png',
                                  'Horizontal Bar',
                                  'HorizontalBarChart',
                                  'radio',
                                  8),
                              cards(
                                  'assets/charts/bar_charts/horizontal_bar_label_full.png',
                                  'Horizontal Label',
                                  'HorizontalBarLabelChart',
                                  'radio',
                                  9),
                              cards(
                                  'assets/charts/bar_charts/horizontal_bar_label_custom_full.png',
                                  'Horizontal Custom',
                                  'HorizontalBarLabelCustomChart',
                                  'radio',
                                  10),
                              cards(
                                  'assets/charts/bar_charts/horizontal_pattern_forward_hatch_full.png',
                                  'Horizontal Forward',
                                  'HorizontalPatternForwardHatchBarChart',
                                  'radio',
                                  11),
                              cards(
                                  'assets/charts/bar_charts/pattern_forward_hatch_full.png',
                                  'Pattern Forward',
                                  'PatternForwardHatchBarChart',
                                  'radio',
                                  12),
                              cards(
                                  'assets/charts/bar_charts/spark_bar_full.png',
                                  'Spark Bar',
                                  'SparkBar',
                                  'radio',
                                  13),
                              cards(
                                  'assets/charts/bar_charts/stacked_fill_color_full.png',
                                  'Stacked Color',
                                  'StackedFillColorBarChart',
                                  'radio',
                                  14),
                              cards(
                                  'assets/charts/bar_charts/stacked_horizontal_full.png',
                                  'Stacked Horizontal',
                                  'StackedHorizontalBarChart',
                                  'radio',
                                  15),
                              cards(
                                  'assets/charts/bar_charts/stacked_full.png',
                                  'Stacked',
                                  'StackedBarChart',
                                  'radio',
                                  16),
                              cards(
                                  'assets/charts/bar_charts/stacked_target_line_full.png',
                                  'Stacked Line',
                                  'StackedBarTargetLineChart',
                                  'radio',
                                  17),
                              cards(
                                  'assets/charts/bar_charts/vertical_bar_label_full.png',
                                  'Vertical Bar',
                                  'VerticalBarLabelChart',
                                  'radio',
                                  18),
                            ].asMap().entries.map((widget) {
                              return StoreConnector<AppState, List<bool>>(
          converter: (Store<AppState> store) => store.state.barsSelected,
          builder: (BuildContext context, List<bool> data) {
            return ToggleButtons(
                                selectedColor: Colors.red,
                                splashColor: Colors.lightBlue,
                                selectedBorderColor: Colors.green,
                                fillColor: Colors.white,
                                borderColor: null,
                                borderWidth: 3.0,
                                hoverColor: Colors.orange,
                                highlightColor: Colors.blue,
                                isSelected: [StoreProvider.of<AppState>(context).state.barsSelected[widget.key]],
                                onPressed: (_) => StoreProvider.of<AppState>(context).dispatch(CapPress()),
                                children: [widget.value],
                              );
                              },
                              );
                            }).toList()),
                  ),
                );
          },
                ),
                Container(
                  height: SizeConfig.blockSizeVertical * 2,
                ),
                sampleChuzzer('Samples', 0, 0, 15, 15),
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
               StoreConnector<AppState, bool>(
          converter: (Store<AppState> store) => store.state.sampleVisible,
          builder: (BuildContext context, bool data) {
            return Visibility(
                  visible: StoreProvider.of<AppState>(context).state.sampleVisible,
                  child: Column(
                    children: <Widget>[
                      Scrollable(
                        viewportBuilder:
                            (BuildContext context, ViewportOffset position) {
                          return StoreConnector<AppState, bool>(
          converter: (Store<AppState> store) => store.state.sampleVisible,
          builder: (BuildContext context, bool data) {
            return Column(
                            children: checkb(),
                          );
          },
                          );
                        },
                      ),
                     StoreConnector<AppState, bool>(
          converter: (Store<AppState> store) => store.state.axisXVisible,
          builder: (BuildContext context, bool data) {
            return Visibility(
                        visible: StoreProvider.of<AppState>(context).state.axisXVisible,
                        child: StoreConnector<AppState, String>(
          converter: (Store<AppState> store) => store.state.axisXVal,
          builder: (BuildContext context, String data) {
            return DropdownButtonFormField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
                            ),
                            iconSize: 40,
                            value: StoreProvider.of<AppState>(context).state.axisXVal,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            onChanged: (value) => StoreProvider.of<AppState>(context).dispatch(AxisXVAL(value.toString())),
                            hint: Text('X Axis'),
                            items: StoreProvider.of<AppState>(context).state.rett.where((col) => col['name'].toString() != 'Id').toList().asMap().entries.map((widget) {                              
                         return DropdownMenuItem(
            value: StoreProvider.of<AppState>(context).state.rett[widget.key]['name'].toString(),
            child: Text(StoreProvider.of<AppState>(context).state.rett[widget.key]['name'].toString())
            );
                }).toList(),
                            );
          },
                        ),
                      );
          },
                     ),
                     StoreConnector<AppState, bool>(
          converter: (Store<AppState> store) => store.state.axisYVisible,
          builder: (BuildContext context, bool data) {
            return Visibility(
                        visible: StoreProvider.of<AppState>(context).state.axisYVisible,
                        child: StoreConnector<AppState, String>(
          converter: (Store<AppState> store) => store.state.axisYVal,
          builder: (BuildContext context, String data) {
            return DropdownButtonFormField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
                            ),
                            iconSize: 40,
                            value: StoreProvider.of<AppState>(context).state.axisYVal,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            onChanged: (value) {
                            StoreProvider.of<AppState>(context).dispatch(AxisYVAL(value.toString()));
                            StoreProvider.of<AppState>(context).dispatch(CreateGlobalData());
                            StoreProvider.of<AppState>(context).dispatch(Canvas());
                            },
                            hint: Text('Y Axis'),
                            items: StoreProvider.of<AppState>(context).state.rett.where((col) => col['name'].toString() != 'Id' ).toList().asMap().entries.map((widget) {                              
                         return DropdownMenuItem(
            value: StoreProvider.of<AppState>(context).state.rett[widget.key]['name'].toString(),
            child: Text(StoreProvider.of<AppState>(context).state.rett[widget.key]['name'].toString())
            );
                }).toList(),
                            );
          },
                        ),
                      );
          },
                     ),
                    ],
                  ),
                );
          },
),
                StoreConnector<AppState, Padding>(
          converter: (Store<AppState> store) => store.state.canvas,
          builder: (BuildContext context, Padding data) {
            return RepaintBoundary(
                  key: barsGlobalKey,
                  child: store.state.canvas,
                );
          },
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
            scrollDirection: wig.Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                chartChuzzer('Charts', 15, 15, 0, 0),
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                StoreConnector<AppState, bool>(
          converter: (Store<AppState> store) => store.state.chartzVisible,
          builder: (BuildContext context, bool data) {
            return Visibility(
                  visible: StoreProvider.of<AppState>(context).state.chartzVisible,
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
                              'DateTimeComboLinePointChart',
                              'box',
                              0),
                          cards(
                              'assets/charts/combo_charts/numeric_line_bar_full.png',
                              'Numeric Bar',
                              'NumericComboLineBarChart',
                              'radio',
                              1),
                          cards(
                              'assets/charts/combo_charts/numeric_line_point_full.png',
                              'Numeric Point',
                              'NumericComboLinePointChart',
                              'radio',
                              2),
                          cards(
                              'assets/charts/combo_charts/ordinal_bar_line_full.png',
                              'Ordinal Line',
                              'OrdinalComboBarLineChart',
                              'radio',
                              3),
                          cards(
                              'assets/charts/combo_charts/scatter_plot_line_full.png',
                              'Scatter Line',
                              'ScatterPlotComboLineChart',
                              'radio',
                              4),
                        ].asMap().entries.map((widget) {
                          return StoreConnector<AppState, List<bool>>(
          converter: (Store<AppState> store) => store.state.comboSelected,
          builder: (BuildContext context, List<bool> data) {
            return ToggleButtons(
                            selectedColor: Colors.red,
                            splashColor: Colors.lightBlue,
                            selectedBorderColor: Colors.green,
                            fillColor: Colors.white,
                            borderColor: null,
                            borderWidth: 3.0,
                            hoverColor: Colors.orange,
                            highlightColor: Colors.blue,
                            isSelected: [StoreProvider.of<AppState>(context).state.comboSelected[widget.key]],
                            onPressed: (_) => StoreProvider.of<AppState>(context).dispatch(CapPress()),
                            children: [widget.value],
                          );
          },
                          );
                        }).toList()),
                  ),
                );
          },
                ),
                Container(
                  height: SizeConfig.blockSizeVertical * 2,
                ),
                sampleChuzzer('Samples', 0, 0, 15, 15),
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                StoreConnector<AppState, bool>(
          converter: (Store<AppState> store) => store.state.sampleVisible,
          builder: (BuildContext context, bool data) {
            return Visibility(
                  visible: StoreProvider.of<AppState>(context).state.sampleVisible,
                  child: Column(
                    children: <Widget>[
                      Scrollable(
                        viewportBuilder:
                            (BuildContext context, ViewportOffset position) {
                          return StoreConnector<AppState, bool>(
          converter: (Store<AppState> store) => store.state.sampleVisible,
          builder: (BuildContext context, bool data) {
            return Column(
                            children: checkb(),
                          );
          },
                          );
                        },
                      ),
                     StoreConnector<AppState, bool>(
          converter: (Store<AppState> store) => store.state.axisXVisible,
          builder: (BuildContext context, bool data) {
            return Visibility(
                        visible: StoreProvider.of<AppState>(context).state.axisXVisible,
                        child: StoreConnector<AppState, String>(
          converter: (Store<AppState> store) => store.state.axisXVal,
          builder: (BuildContext context, String data) {
            return DropdownButtonFormField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
                            ),
                            iconSize: 40,
                            value: StoreProvider.of<AppState>(context).state.axisXVal,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            onChanged: (value) => StoreProvider.of<AppState>(context).dispatch(AxisXVAL(value.toString())),
                            hint: Text('X Axis'),
                            items: StoreProvider.of<AppState>(context).state.rett.where((col) => col['name'].toString() != 'Id').toList().asMap().entries.map((widget) {                              
                         return DropdownMenuItem(
            value: StoreProvider.of<AppState>(context).state.rett[widget.key]['name'].toString(),
            child: Text(StoreProvider.of<AppState>(context).state.rett[widget.key]['name'].toString())
            );
                }).toList(),
                            );
          },
                        ),
                      );
          },
                     ),
                     StoreConnector<AppState, bool>(
          converter: (Store<AppState> store) => store.state.axisYVisible,
          builder: (BuildContext context, bool data) {
            return Visibility(
                        visible: StoreProvider.of<AppState>(context).state.axisYVisible,
                        child: StoreConnector<AppState, String>(
          converter: (Store<AppState> store) => store.state.axisYVal,
          builder: (BuildContext context, String data) {
            return DropdownButtonFormField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
                            ),
                            iconSize: 40,
                            value: StoreProvider.of<AppState>(context).state.axisYVal,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            onChanged: (value) {
                            StoreProvider.of<AppState>(context).dispatch(AxisYVAL(value.toString()));
                            StoreProvider.of<AppState>(context).dispatch(CreateGlobalData());
                            StoreProvider.of<AppState>(context).dispatch(Canvas());
                            },
                            hint: Text('Y Axis'),
                            items: StoreProvider.of<AppState>(context).state.rett.where((col) => col['name'].toString() != 'Id' ).toList().asMap().entries.map((widget) {                              
                         return DropdownMenuItem(
            value: StoreProvider.of<AppState>(context).state.rett[widget.key]['name'].toString(),
            child: Text(StoreProvider.of<AppState>(context).state.rett[widget.key]['name'].toString())
            );
                }).toList(),
                            );
          },
                        ),
                      );
          },
                     ),
                    ],
                  ),
                );
          },
),
                StoreConnector<AppState, Padding>(
          converter: (Store<AppState> store) => store.state.canvas,
          builder: (BuildContext context, Padding data) {
            return RepaintBoundary(
                  key: comboGlobalKey,
                  child: store.state.canvas,
                );
          },
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
            scrollDirection: wig.Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                chartChuzzer('Charts', 15, 15, 0, 0),
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                StoreConnector<AppState, bool>(
          converter: (Store<AppState> store) => store.state.chartzVisible,
          builder: (BuildContext context, bool data) {
            return Visibility(
                  visible: StoreProvider.of<AppState>(context).state.chartzVisible,
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
                              'DatumLegendOptions',
                              'radio',
                              0),
                          cards(
                              'assets/charts/legends/datum_legend_with_measures_full.png',
                              'Datum Measures',
                              'DatumLegendWithMeasures',
                              'radio',
                              1),
                          cards(
                              'assets/charts/legends/default_hidden_series_legend_full.png',
                              'Default Hidden',
                              'DefaultHiddenSeriesLegend',
                              'radio',
                              2),
                          cards(
                              'assets/charts/legends/legend_custom_symbol_full.png',
                              'Custom Legend',
                              'LegendWithCustomSymbol',
                              'box',
                              3),
                          cards(
                              'assets/charts/legends/series_legend_options_full.png',
                              'Series Options',
                              'LegendOptions',
                              'radio',
                              4),
                          cards(
                              'assets/charts/legends/series_legend_with_measures_full.png',
                              'Series Measures',
                              'LegendWithMeasures',
                              'radio',
                              5),
                          cards(
                              'assets/charts/legends/simple_datum_legend_full.png',
                              'Simple Datum',
                              'SimpleDatumLegend',
                              'radio',
                              6),
                          cards(
                              'assets/charts/legends/simple_series_legend_full.png',
                              'Simple Series',
                              'SimpleSeriesLegend',
                              'radio',
                              7),
                        ].asMap().entries.map((widget) {
                          return StoreConnector<AppState, List<bool>>(
          converter: (Store<AppState> store) => store.state.legendsSelected,
          builder: (BuildContext context, List<bool> data) {
            return ToggleButtons(
                            selectedColor: Colors.red,
                            splashColor: Colors.lightBlue,
                            selectedBorderColor: Colors.green,
                            fillColor: Colors.white,
                            borderColor: null,
                            borderWidth: 3.0,
                            hoverColor: Colors.orange,
                            highlightColor: Colors.blue,
                            isSelected: [StoreProvider.of<AppState>(context).state.legendsSelected[widget.key]],
                            onPressed: (_) => StoreProvider.of<AppState>(context).dispatch(CapPress()),
                            children: [widget.value],
                          );
          },
                          );
                        }).toList()),
                  ),
                );
          },
                ),
                Container(
                  height: SizeConfig.blockSizeVertical * 2,
                ),
                sampleChuzzer('Samples', 0, 0, 15, 15),
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                StoreConnector<AppState, bool>(
          converter: (Store<AppState> store) => store.state.sampleVisible,
          builder: (BuildContext context, bool data) {
            return Visibility(
                  visible: StoreProvider.of<AppState>(context).state.sampleVisible,
                  child: Column(
                    children: <Widget>[
                      Scrollable(
                        viewportBuilder:
                            (BuildContext context, ViewportOffset position) {
                          return StoreConnector<AppState, bool>(
          converter: (Store<AppState> store) => store.state.sampleVisible,
          builder: (BuildContext context, bool data) {
            return Column(
                            children: checkb(),
                          );
          },
                          );
                        },
                      ),
                     StoreConnector<AppState, bool>(
          converter: (Store<AppState> store) => store.state.axisXVisible,
          builder: (BuildContext context, bool data) {
            return Visibility(
                        visible: StoreProvider.of<AppState>(context).state.axisXVisible,
                        child: StoreConnector<AppState, String>(
          converter: (Store<AppState> store) => store.state.axisXVal,
          builder: (BuildContext context, String data) {
            return DropdownButtonFormField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
                            ),
                            iconSize: 40,
                            value: StoreProvider.of<AppState>(context).state.axisXVal,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            onChanged: (value) => StoreProvider.of<AppState>(context).dispatch(AxisXVAL(value.toString())),
                            hint: Text('X Axis'),
                            items: StoreProvider.of<AppState>(context).state.rett.where((col) => col['name'].toString() != 'Id').toList().asMap().entries.map((widget) {                              
                         return DropdownMenuItem(
            value: StoreProvider.of<AppState>(context).state.rett[widget.key]['name'].toString(),
            child: Text(StoreProvider.of<AppState>(context).state.rett[widget.key]['name'].toString())
            );
                }).toList(),
                            );
          },
                        ),
                      );
          },
                     ),
                     StoreConnector<AppState, bool>(
          converter: (Store<AppState> store) => store.state.axisYVisible,
          builder: (BuildContext context, bool data) {
            return Visibility(
                        visible: StoreProvider.of<AppState>(context).state.axisYVisible,
                        child: StoreConnector<AppState, String>(
          converter: (Store<AppState> store) => store.state.axisYVal,
          builder: (BuildContext context, String data) {
            return DropdownButtonFormField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
                            ),
                            iconSize: 40,
                            value: StoreProvider.of<AppState>(context).state.axisYVal,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            onChanged: (value) {
                            StoreProvider.of<AppState>(context).dispatch(AxisYVAL(value.toString()));
                            StoreProvider.of<AppState>(context).dispatch(CreateGlobalData());
                            StoreProvider.of<AppState>(context).dispatch(Canvas());
                            },
                            hint: Text('Y Axis'),
                            items: StoreProvider.of<AppState>(context).state.rett.where((col) => col['name'].toString() != 'Id' ).toList().asMap().entries.map((widget) {                              
                         return DropdownMenuItem(
            value: StoreProvider.of<AppState>(context).state.rett[widget.key]['name'].toString(),
            child: Text(StoreProvider.of<AppState>(context).state.rett[widget.key]['name'].toString())
            );
                }).toList(),
                            );
          },
                        ),
                      );
          },
                     ),
                    ],
                  ),
                );
          },
),
                StoreConnector<AppState, Padding>(
          converter: (Store<AppState> store) => store.state.canvas,
          builder: (BuildContext context, Padding data) {
            return RepaintBoundary(
                  key: legendsGlobalKey,
                  child: store.state.canvas,
                );
          },
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
            scrollDirection: wig.Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                chartChuzzer('Charts', 15, 15, 0, 0),
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                StoreConnector<AppState, bool>(
          converter: (Store<AppState> store) => store.state.chartzVisible,
          builder: (BuildContext context, bool data) {
            return Visibility(
                  visible: StoreProvider.of<AppState>(context).state.chartzVisible,
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
                              'LineAnimationZoomChart',
                              'radio',
                              0),
                          cards(
                              'assets/charts/line_charts/area_and_line_full.png',
                              'Area & Line',
                              'AreaAndLineChart',
                              'radio',
                              1),
                          cards(
                              'assets/charts/line_charts/dash_pattern_full.png',
                              'Dash Pattern',
                              'DashPatternLineChart',
                              'radio',
                              2),
                          cards(
                              'assets/charts/line_charts/line_annotation_full.png',
                              'Line Annotation',
                              'LineLineAnnotationChart',
                              'radio',
                              3),
                          cards(
                              'assets/charts/line_charts/points_full.png',
                              'Points',
                              'PointsLineChart',
                              'radio',
                              4),
                          cards(
                              'assets/charts/line_charts/range_annotation_margin_full.png',
                              'Range Margin',
                              'LineRangeAnnotationMarginChart',
                              'radio',
                              5),
                          cards(
                              'assets/charts/line_charts/range_annotation_full.png',
                              'Range Annotation',
                              'LineRangeAnnotationChart',
                              'radio',
                              6),
                          cards(
                              'assets/charts/line_charts/segments_full.png',
                              'Segments',
                              'SegmentsLineChart',
                              'radio',
                              7),
                          cards(
                              'assets/charts/line_charts/simple_nulls_full.png',
                              'Simple Null',
                              'SimpleNullsLineChart',
                              'radio',
                              8),
                          cards(
                              'assets/charts/line_charts/simple_full.png',
                              'Simple',
                              'SimpleLineChart',
                              'radio',
                              9),
                          cards(
                              'assets/charts/line_charts/stacked_area_custom_color_full.png',
                              'Stacked Area Custom',
                              'StackedAreaCustomColorLineChart',
                              'radio',
                              10),
                          cards(
                              'assets/charts/line_charts/stacked_area_nulls_full.png',
                              'Stacked Null',
                              'StackedAreaNullsLineChart',
                              'radio',
                              11),
                          cards(
                              'assets/charts/line_charts/stacked_area_full.png',
                              'Stacked Area',
                              'StackedAreaLineChart',
                              'radio',
                              12),
                        ].asMap().entries.map((widget) {
                          return StoreConnector<AppState, List<bool>>(
          converter: (Store<AppState> store) => store.state.linesSelected,
          builder: (BuildContext context, List<bool> data) {
            return ToggleButtons(
                            selectedColor: Colors.red,
                            splashColor: Colors.lightBlue,
                            selectedBorderColor: Colors.green,
                            fillColor: Colors.white,
                            borderColor: null,
                            borderWidth: 3.0,
                            hoverColor: Colors.orange,
                            highlightColor: Colors.blue,
                            isSelected: [StoreProvider.of<AppState>(context).state.linesSelected[widget.key]],
                            onPressed: (_) => StoreProvider.of<AppState>(context).dispatch(CapPress()),
                            children: [widget.value],
                          );
          },
                          );
                        }).toList()),
                  ),
                );
          },
                ),
                Container(
                  height: SizeConfig.blockSizeVertical * 2,
                ),
                sampleChuzzer('Samples', 0, 0, 15, 15),
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                StoreConnector<AppState, bool>(
          converter: (Store<AppState> store) => store.state.sampleVisible,
          builder: (BuildContext context, bool data) {
            return Visibility(
                  visible: StoreProvider.of<AppState>(context).state.sampleVisible,
                  child: Column(
                    children: <Widget>[
                      Scrollable(
                        viewportBuilder:
                            (BuildContext context, ViewportOffset position) {
                          return StoreConnector<AppState, bool>(
          converter: (Store<AppState> store) => store.state.sampleVisible,
          builder: (BuildContext context, bool data) {
            return Column(
                            children: checkb(),
                          );
          },
                          );
                        },
                      ),
                     StoreConnector<AppState, bool>(
          converter: (Store<AppState> store) => store.state.axisXVisible,
          builder: (BuildContext context, bool data) {
            return Visibility(
                        visible: StoreProvider.of<AppState>(context).state.axisXVisible,
                        child: StoreConnector<AppState, String>(
          converter: (Store<AppState> store) => store.state.axisXVal,
          builder: (BuildContext context, String data) {
            return DropdownButtonFormField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
                            ),
                            iconSize: 40,
                            value: StoreProvider.of<AppState>(context).state.axisXVal,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            onChanged: (value) => StoreProvider.of<AppState>(context).dispatch(AxisXVAL(value.toString())),
                            hint: Text('X Axis'),
                            items: StoreProvider.of<AppState>(context).state.rett.where((col) => col['name'].toString() != 'Id').toList().asMap().entries.map((widget) {                              
                         return DropdownMenuItem(
            value: StoreProvider.of<AppState>(context).state.rett[widget.key]['name'].toString(),
            child: Text(StoreProvider.of<AppState>(context).state.rett[widget.key]['name'].toString())
            );
                }).toList(),
                            );
          },
                        ),
                      );
          },
                     ),
                     StoreConnector<AppState, bool>(
          converter: (Store<AppState> store) => store.state.axisYVisible,
          builder: (BuildContext context, bool data) {
            return Visibility(
                        visible: StoreProvider.of<AppState>(context).state.axisYVisible,
                        child: StoreConnector<AppState, String>(
          converter: (Store<AppState> store) => store.state.axisYVal,
          builder: (BuildContext context, String data) {
            return DropdownButtonFormField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
                            ),
                            iconSize: 40,
                            value: StoreProvider.of<AppState>(context).state.axisYVal,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            onChanged: (value) {
                            StoreProvider.of<AppState>(context).dispatch(AxisYVAL(value.toString()));
                            StoreProvider.of<AppState>(context).dispatch(CreateGlobalData());
                            StoreProvider.of<AppState>(context).dispatch(Canvas());
                            },
                            hint: Text('Y Axis'),
                            items: StoreProvider.of<AppState>(context).state.rett.where((col) => col['name'].toString() != 'Id' ).toList().asMap().entries.map((widget) {                              
                         return DropdownMenuItem(
            value: StoreProvider.of<AppState>(context).state.rett[widget.key]['name'].toString(),
            child: Text(StoreProvider.of<AppState>(context).state.rett[widget.key]['name'].toString())
            );
                }).toList(),
                            );
          },
                        ),
                      );
          },
                     ),
                    ],
                  ),
                );
          },
),
                StoreConnector<AppState, Padding>(
          converter: (Store<AppState> store) => store.state.canvas,
          builder: (BuildContext context, Padding data) {
            return RepaintBoundary(
                  key: linesGlobalKey,
                  child: store.state.canvas,
                );
          },
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
            scrollDirection: wig.Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                chartChuzzer('Charts', 15, 15, 0, 0),
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                StoreConnector<AppState, bool>(
          converter: (Store<AppState> store) => store.state.chartzVisible,
          builder: (BuildContext context, bool data) {
            return Visibility(
                  visible: StoreProvider.of<AppState>(context).state.chartzVisible,
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
                              'DonutAutoLabelChart',
                              'radio',
                              0),
                          cards(
                              'assets/charts/pie_charts/donut_full.png',
                              'Doughnut',
                              'DonutPieChart',
                              'radio',
                              1),
                          cards(
                              'assets/charts/pie_charts/gauge_full.png',
                              'Gauge',
                              'GaugeChart',
                              'radio',
                              2),
                          cards(
                              'assets/charts/pie_charts/outside_label_full.png',
                              'Outside Label',
                              'PieOutsideLabelChart',
                              'radio',
                              3),
                          cards(
                              'assets/charts/pie_charts/partial_pie_full.png',
                              'Partial Pie',
                              'PartialPieChart',
                              'radio',
                              4),
                          cards(
                              'assets/charts/pie_charts/simple_full.png',
                              'Simple Pie',
                              'SimplePieChart',
                              'radio',
                              5),
                        ].asMap().entries.map((widget) {
                          return StoreConnector<AppState, List<bool>>(
          converter: (Store<AppState> store) => store.state.piesSelected,
          builder: (BuildContext context, List<bool> data) {
            return ToggleButtons(
                            selectedColor: Colors.red,
                            splashColor: Colors.lightBlue,
                            selectedBorderColor: Colors.green,
                            fillColor: Colors.white,
                            borderColor: null,
                            borderWidth: 3.0,
                            hoverColor: Colors.orange,
                            highlightColor: Colors.blue,
                            isSelected: [StoreProvider.of<AppState>(context).state.piesSelected[widget.key]],
                            onPressed: (_) => StoreProvider.of<AppState>(context).dispatch(CapPress()),
                            children: [widget.value],
                          );
          },
                          );
                        }).toList()),
                  ),
                );
          },
                ),
                Container(
                  height: SizeConfig.blockSizeVertical * 2,
                ),
                sampleChuzzer('Samples', 0, 0, 15, 15),
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                StoreConnector<AppState, bool>(
          converter: (Store<AppState> store) => store.state.sampleVisible,
          builder: (BuildContext context, bool data) {
            return Visibility(
                  visible: StoreProvider.of<AppState>(context).state.sampleVisible,
                  child: Column(
                    children: <Widget>[
                      Scrollable(
                        viewportBuilder:
                            (BuildContext context, ViewportOffset position) {
                          return StoreConnector<AppState, bool>(
          converter: (Store<AppState> store) => store.state.sampleVisible,
          builder: (BuildContext context, bool data) {
            return Column(
                            children: checkb(),
                          );
          },
                          );
                        },
                      ),
                     StoreConnector<AppState, bool>(
          converter: (Store<AppState> store) => store.state.axisXVisible,
          builder: (BuildContext context, bool data) {
            return Visibility(
                        visible: StoreProvider.of<AppState>(context).state.axisXVisible,
                        child: StoreConnector<AppState, String>(
          converter: (Store<AppState> store) => store.state.axisXVal,
          builder: (BuildContext context, String data) {
            return DropdownButtonFormField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
                            ),
                            iconSize: 40,
                            value: StoreProvider.of<AppState>(context).state.axisXVal,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            onChanged: (value) => StoreProvider.of<AppState>(context).dispatch(AxisXVAL(value.toString())),
                            hint: Text('X Axis'),
                            items: StoreProvider.of<AppState>(context).state.rett.where((col) => col['name'].toString() != 'Id').toList().asMap().entries.map((widget) {                              
                         return DropdownMenuItem(
            value: StoreProvider.of<AppState>(context).state.rett[widget.key]['name'].toString(),
            child: Text(StoreProvider.of<AppState>(context).state.rett[widget.key]['name'].toString())
            );
                }).toList(),
                            );
          },
                        ),
                      );
          },
                     ),
                     StoreConnector<AppState, bool>(
          converter: (Store<AppState> store) => store.state.axisYVisible,
          builder: (BuildContext context, bool data) {
            return Visibility(
                        visible: StoreProvider.of<AppState>(context).state.axisYVisible,
                        child: StoreConnector<AppState, String>(
          converter: (Store<AppState> store) => store.state.axisYVal,
          builder: (BuildContext context, String data) {
            return DropdownButtonFormField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
                            ),
                            iconSize: 40,
                            value: StoreProvider.of<AppState>(context).state.axisYVal,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            onChanged: (value) {
                            StoreProvider.of<AppState>(context).dispatch(AxisYVAL(value.toString()));
                            StoreProvider.of<AppState>(context).dispatch(CreateGlobalData());
                            StoreProvider.of<AppState>(context).dispatch(Canvas());
                            },
                            hint: Text('Y Axis'),
                            items: StoreProvider.of<AppState>(context).state.rett.where((col) => col['name'].toString() != 'Id' ).toList().asMap().entries.map((widget) {                              
                         return DropdownMenuItem(
            value: StoreProvider.of<AppState>(context).state.rett[widget.key]['name'].toString(),
            child: Text(StoreProvider.of<AppState>(context).state.rett[widget.key]['name'].toString())
            );
                }).toList(),
                            );
          },
                        ),
                      );
          },
                     ),
                    ],
                  ),
                );
          },
),
                StoreConnector<AppState, Padding>(
          converter: (Store<AppState> store) => store.state.canvas,
          builder: (BuildContext context, Padding data) {
            return RepaintBoundary(
                  key: piesGlobalKey,
                  child: store.state.canvas,
                );
          },
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
            scrollDirection: wig.Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                chartChuzzer('Charts', 15, 15, 0, 0),
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                StoreConnector<AppState, bool>(
          converter: (Store<AppState> store) => store.state.chartzVisible,
          builder: (BuildContext context, bool data) {
            return Visibility(
                  visible: StoreProvider.of<AppState>(context).state.chartzVisible,
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
                              'TimeSeriesConfidenceInterval',
                              'box',
                              0),
                          cards(
                              'assets/charts/time_series_charts/end_points_axis_full.png',
                              'End Point',
                              'EndPointsAxisTimeSeriesChart',
                              'box',
                              1),
                          cards(
                              'assets/charts/time_series_charts/line_annotation_full.png',
                              'Line Annotation',
                              'TimeSeriesLineAnnotationChart',
                              'box',
                              2),
                          cards(
                              'assets/charts/time_series_charts/range_annotation_full.png',
                              'Range Annotation',
                              'TimeSeriesRangeAnnotationChart',
                              'box',
                              3),
                          cards(
                              'assets/charts/time_series_charts/simple_full.png',
                              'Simple',
                              'SimpleTimeSeriesChart',
                              'box',
                              4),
                          cards(
                              'assets/charts/time_series_charts/symbol_annotation_full.png',
                              'Symbol Annotation',
                              'TimeSeriesSymbolAnnotationChart',
                              'box',
                              5),
                          cards(
                              'assets/charts/time_series_charts/with_bar_renderer_full.png',
                              'Bar Render',
                              'TimeSeriesBar',
                              'box',
                              6),
                        ].asMap().entries.map((widget) {
                          return StoreConnector<AppState, List<bool>>(
          converter: (Store<AppState> store) => store.state.timesSelected,
          builder: (BuildContext context, List<bool> data) {
            return ToggleButtons(
                            selectedColor: Colors.red,
                            splashColor: Colors.lightBlue,
                            selectedBorderColor: Colors.green,
                            fillColor: Colors.white,
                            borderColor: null,
                            borderWidth: 3.0,
                            hoverColor: Colors.orange,
                            highlightColor: Colors.blue,
                            isSelected: [StoreProvider.of<AppState>(context).state.timesSelected[widget.key]],
                            onPressed: (_) => StoreProvider.of<AppState>(context).dispatch(CapPress()),
                            children: [widget.value],
                          );
          },
                          );
                        }).toList()),
                  ),
                );
          },
                ),
                Container(
                  height: SizeConfig.blockSizeVertical * 2,
                ),
                sampleChuzzer('Samples', 0, 0, 15, 15),
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                StoreConnector<AppState, bool>(
          converter: (Store<AppState> store) => store.state.sampleVisible,
          builder: (BuildContext context, bool data) {
            return Visibility(
                  visible: StoreProvider.of<AppState>(context).state.sampleVisible,
                  child: Column(
                    children: <Widget>[
                      Scrollable(
                        viewportBuilder:
                            (BuildContext context, ViewportOffset position) {
                          return StoreConnector<AppState, bool>(
          converter: (Store<AppState> store) => store.state.sampleVisible,
          builder: (BuildContext context, bool data) {
            return Column(
                            children: checkb(),
                          );
          },
                          );
                        },
                      ),
                     StoreConnector<AppState, bool>(
          converter: (Store<AppState> store) => store.state.axisXVisible,
          builder: (BuildContext context, bool data) {
            return Visibility(
                        visible: StoreProvider.of<AppState>(context).state.axisXVisible,
                        child: StoreConnector<AppState, String>(
          converter: (Store<AppState> store) => store.state.axisXVal,
          builder: (BuildContext context, String data) {
            return DropdownButtonFormField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
                            ),
                            iconSize: 40,
                            value: StoreProvider.of<AppState>(context).state.axisXVal,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            onChanged: (value) => StoreProvider.of<AppState>(context).dispatch(AxisXVAL(value.toString())),
                            hint: Text('X Axis'),
                            items: StoreProvider.of<AppState>(context).state.rett.where((col) => col['name'].toString() != 'Id').toList().asMap().entries.map((widget) {                              
                         return DropdownMenuItem(
            value: StoreProvider.of<AppState>(context).state.rett[widget.key]['name'].toString(),
            child: Text(StoreProvider.of<AppState>(context).state.rett[widget.key]['name'].toString())
            );
                }).toList(),
                            );
          },
                        ),
                      );
          },
                     ),
                     StoreConnector<AppState, bool>(
          converter: (Store<AppState> store) => store.state.axisYVisible,
          builder: (BuildContext context, bool data) {
            return Visibility(
                        visible: StoreProvider.of<AppState>(context).state.axisYVisible,
                        child: StoreConnector<AppState, String>(
          converter: (Store<AppState> store) => store.state.axisYVal,
          builder: (BuildContext context, String data) {
            return DropdownButtonFormField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
                            ),
                            iconSize: 40,
                            value: StoreProvider.of<AppState>(context).state.axisYVal,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            onChanged: (value) {
                            StoreProvider.of<AppState>(context).dispatch(AxisYVAL(value.toString()));
                            StoreProvider.of<AppState>(context).dispatch(CreateGlobalData());
                            StoreProvider.of<AppState>(context).dispatch(Canvas());
                            },
                            hint: Text('Y Axis'),
                            items: StoreProvider.of<AppState>(context).state.rett.where((col) => col['name'].toString() != 'Id' ).toList().asMap().entries.map((widget) {                              
                         return DropdownMenuItem(
            value: StoreProvider.of<AppState>(context).state.rett[widget.key]['name'].toString(),
            child: Text(StoreProvider.of<AppState>(context).state.rett[widget.key]['name'].toString())
            );
                }).toList(),
                            );
          },
                        ),
                      );
          },
                     ),
                    ],
                  ),
                );
          },
),
                StoreConnector<AppState, Padding>(
          converter: (Store<AppState> store) => store.state.canvas,
          builder: (BuildContext context, Padding data) {
            return RepaintBoundary(
                  key: timesGlobalKey,
                  child: store.state.canvas,
                );
          },
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
            scrollDirection: wig.Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                chartChuzzer('Charts', 15, 15, 0, 0),
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                StoreConnector<AppState, bool>(
          converter: (Store<AppState> store) => store.state.chartzVisible,
          builder: (BuildContext context, bool data) {
            return 
            Visibility(
                  visible: store.state.chartzVisible,
                  child: Container(
                    height: 350.0,
                    // width: MediaQuery.of(context).size.width,
                    child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: 1.2,
                        padding: const EdgeInsets.all(36.0),
                        mainAxisSpacing: 20.0,
                        crossAxisSpacing: 8.0,
                        // children: []
                        ),
                  ),
                );
          },
                ),
                Container(
                  height: SizeConfig.blockSizeVertical * 2,
                ),
                sampleChuzzer('Samples', 0, 0, 15, 15),
                Container(
                  height: SizeConfig.blockSizeVertical * 1,
                ),
                StoreConnector<AppState, bool>(
          converter: (Store<AppState> store) => store.state.sampleVisible,
          builder: (BuildContext context, bool data) {
            return 
            Visibility(
                  visible: store.state.sampleVisible,
                  child: Column(
                    children: <Widget>[
                      Scrollable(
                        viewportBuilder:
                            (BuildContext context, ViewportOffset position) {
                          return StoreConnector<AppState, bool>(
          converter: (Store<AppState> store) => store.state.sampleVisible,
          builder: (BuildContext context, bool data) {
            return Column(
                            children: checkb(),
                          );
          },
                          );
                        },
                      ),
                     StoreConnector<AppState, bool>(
          converter: (Store<AppState> store) => store.state.axisXVisible,
          builder: (BuildContext context, bool data) {
            return 
            Visibility(
                        visible: store.state.axisXVisible,
                        child: StoreConnector<AppState, String>(
          converter: (Store<AppState> store) => store.state.axisXVal,
          builder: (BuildContext context, String data) {
            return DropdownButtonFormField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
                            ),
                            iconSize: 40,
                            value: StoreProvider.of<AppState>(context).state.axisXVal,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            onChanged: (value) => StoreProvider.of<AppState>(context).dispatch(AxisXVAL(value.toString())),
                            hint: Text('X Axis'),
                            items: StoreProvider.of<AppState>(context).state.rett.where((col) => col['name'].toString() != 'Id').toList().asMap().entries.map((widget) {                              
                         return DropdownMenuItem(
            value: StoreProvider.of<AppState>(context).state.rett[widget.key]['name'].toString(),
            child: Text(StoreProvider.of<AppState>(context).state.rett[widget.key]['name'].toString())
            );
                }).toList(),
                            );
          },
                        ),
                      );
          },
                     ),
                     StoreConnector<AppState, bool>(
          converter: (Store<AppState> store) => store.state.axisYVisible,
          builder: (BuildContext context, bool data) {
            return
             Visibility(
                        visible: store.state.axisYVisible,
                        child: StoreConnector<AppState, String>(
          converter: (Store<AppState> store) => store.state.axisYVal,
          builder: (BuildContext context, String data) {
            return DropdownButtonFormField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
                            ),
                            iconSize: 40,
                            value: StoreProvider.of<AppState>(context).state.axisYVal,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                            onChanged: (value) {
                            StoreProvider.of<AppState>(context).dispatch(AxisYVAL(value.toString()));
                            StoreProvider.of<AppState>(context).dispatch(CreateGlobalData());
                            StoreProvider.of<AppState>(context).dispatch(Canvas());
                            },
                            hint: Text('Y Axis'),
                            items: StoreProvider.of<AppState>(context).state.rett.where((col) => col['name'].toString() != 'Id' ).toList().asMap().entries.map((widget) {                              
                         return DropdownMenuItem(
            value: StoreProvider.of<AppState>(context).state.rett[widget.key]['name'].toString(),
            child: Text(StoreProvider.of<AppState>(context).state.rett[widget.key]['name'].toString())
            );
                }).toList(),
                            );
          },
                        ),
                      );
          },
                     ),
                    ],
                  ),
                );
          },
),
                StoreConnector<AppState, Padding>(
          converter: (Store<AppState> store) => store.state.canvas,
          builder: (BuildContext context, Padding data) {
            return 
            RepaintBoundary(
                  key: tablesGlobalKey,
                  child: store.state.canvas,
                );
          },
                ),
              ],
            ),
          ),
        ),
      ),
    ];

    return StoreProvider<AppState>(
      store: store,
          child: MaterialApp(
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
           floatingActionButton: _floats(),
          ),
        ),
      ),
    );
  }


  Widget _floats() {
    return controlle.index == 0
        ? FloatingActionButton(
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
                              axesCapturePng().then((value) async {
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
            )
        : controlle.index == 1 
        ? FloatingActionButton(
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
                              barsCapturePng().then((value) async {
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
            )
        : controlle.index == 2
        ? FloatingActionButton(
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
                              comboCapturePng().then((value) async {
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
            )
        : controlle.index == 3
        ? FloatingActionButton(
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
                             legendsCapturePng().then((value) async {
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
            )
        : controlle.index == 4
        ? FloatingActionButton(
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
                              linesCapturePng().then((value) async {
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
            )
        : controlle.index == 5
        ? FloatingActionButton(
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
                              piesCapturePng().then((value) async {
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
            )
        : controlle.index == 6
        ? FloatingActionButton(
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
                              timesCapturePng().then((value) async {
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
            )
        : controlle.index == 7
        ? FloatingActionButton(
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
                              tableCapturePng().then((value) async {
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
            )
        : null;
  }

    }


class Tabz {
  Tabz({this.wijet, this.title, this.icon});
  final Widget wijet;
  final String title;
  final IconData icon;
}