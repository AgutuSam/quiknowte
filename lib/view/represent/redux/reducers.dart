import 'dart:core';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
      // print('&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&');
      // print(prev.globalData[1].domain.toString() + ' : ' + prev.globalData[1].measure.toString());
      // print('&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&');
      prev.canvas = Padding(
        padding: EdgeInsets.all(16),
        child: Container(
          height: SizeConfig.blockSizeVertical * 55,
          padding: EdgeInsets.all(8),
          color: Colors.white,
          child: 
          //Axes
            prev.chartState == 'BarChartWithSecondaryAxisOnly' ? BarChartWithSecondaryAxisOnly(prev.globCreateData,)
          : prev.chartState == 'BarChartWithSecondaryAxis' ? BarChartWithSecondaryAxis(prev.globCreateData,)
          : prev.chartState == 'CustomAxisTickFormatters' ? CustomAxisTickFormatters.withSampleData()
          : prev.chartState == 'CustomFontSizeAndColor' ? CustomFontSizeAndColor(prev.globCreateData,)
          : prev.chartState == 'CustomMeasureTickCount' ? CustomMeasureTickCount.withSampleData()
          : prev.chartState == 'FlippedVerticalAxis' ? FlippedVerticalAxis(prev.globCreateData,)
          : prev.chartState == 'GridlineDashPattern' ?  GridlineDashPattern.withSampleData()
          : prev.chartState == 'HiddenTicksAndLabelsAxis' ? HiddenTicksAndLabelsAxis(prev.globCreateData)
          : prev.chartState == 'HorizontalBarChartWithSecondaryAxis' ? HorizontalBarChartWithSecondaryAxis(prev.globCreateData)
          : prev.chartState == 'IntegerOnlyMeasureAxis' ? IntegerOnlyMeasureAxis.withSampleData()
          : prev.chartState == 'DisjointMeasureAxisLineChart' ? DisjointMeasureAxisLineChart(prev.globCreateData) 
          : prev.chartState == 'MeasureAxisLabelAlignment' ? MeasureAxisLabelAlignment(prev.globCreateData)  
          : prev.chartState == 'NonzeroBoundMeasureAxis' ? NonzeroBoundMeasureAxis.withSampleData()  
          : prev.chartState == 'NumericInitialViewport' ? NumericInitialViewport(prev.globCreateData) 
          : prev.chartState == 'OrdinalInitialViewport' ?  OrdinalInitialViewport(prev.globCreateData)  
          : prev.chartState == 'ShortTickLengthAxis' ? ShortTickLengthAxis(prev.globCreateData)                                    
          : prev.chartState == 'StaticallyProvidedTicks' ? StaticallyProvidedTicks(prev.globCreateData)  
          //Bars
          : prev.chartState == 'SimpleBarChart' ? SimpleBarChart(prev.globCreateData) 
          : prev.chartState == 'CustomRoundedBars' ? CustomRoundedBars(prev.globCreateData) 
          : prev.chartState == 'GroupedFillColorBarChart' ? GroupedFillColorBarChart(prev.globCreateData)  
          : prev.chartState == 'GroupedBarChart' ? GroupedBarChart(prev.globCreateData)  
          : prev.chartState == 'GroupedStackedBarChart' ? GroupedStackedBarChart(prev.globCreateData)  
          : prev.chartState == 'GroupedStackedWeightPatternBarChart' ? GroupedStackedWeightPatternBarChart(prev.globCreateData)  
          : prev.chartState == 'GroupedBarTargetLineChart' ? GroupedBarTargetLineChart(prev.globCreateData) 
          : prev.chartState == 'GroupedBarSingleTargetLineChart' ? GroupedBarSingleTargetLineChart(prev.globCreateData) 
          : prev.chartState == 'HorizontalBarChart' ? HorizontalBarChart(prev.globCreateData) 
          : prev.chartState == 'HorizontalBarLabelChart' ? HorizontalBarLabelChart(prev.globCreateData) 
          : prev.chartState == 'HorizontalBarLabelCustomChart' ? HorizontalBarLabelCustomChart(prev.globCreateData)  
          : prev.chartState == 'HorizontalPatternForwardHatchBarChart' ? HorizontalPatternForwardHatchBarChart(prev.globCreateData) 
          : prev.chartState == 'PatternForwardHatchBarChart' ? PatternForwardHatchBarChart(prev.globCreateData) 
          : prev.chartState == 'SparkBar' ? SparkBar(prev.globCreateData) 
          : prev.chartState == 'StackedFillColorBarChart' ? StackedFillColorBarChart(prev.globCreateData) 
          : prev.chartState == 'StackedHorizontalBarChart' ? StackedHorizontalBarChart(prev.globCreateData)  
          : prev.chartState == 'StackedBarChart' ? StackedBarChart(prev.globCreateData) 
          : prev.chartState == 'StackedBarTargetLineChart' ? StackedBarTargetLineChart(prev.globCreateData)  
          : prev.chartState == 'VerticalBarLabelChart' ? VerticalBarLabelChart(prev.globCreateData)
          // Combo  
          : prev.chartState == 'DateTimeComboLinePointChart' ? DateTimeComboLinePointChart.withSampleData()  
          : prev.chartState == 'NumericComboLineBarChart' ? NumericComboLineBarChart(prev.globCreateData)  
          : prev.chartState == 'NumericComboLinePointChart' ? NumericComboLinePointChart(prev.globCreateData)  
          : prev.chartState == 'OrdinalComboBarLineChart' ? OrdinalComboBarLineChart(prev.globCreateData)  
          : prev.chartState == 'ScatterPlotComboLineChart' ? ScatterPlotComboLineChart(prev.globCreateData)
          // Legends
          : prev.chartState == 'DatumLegendWithMeasures' ? DatumLegendWithMeasures(prev.globCreateData)  
          : prev.chartState == 'DefaultHiddenSeriesLegend' ? DefaultHiddenSeriesLegend(prev.globCreateData)  
          : prev.chartState == 'LegendWithCustomSymbol' ? LegendWithCustomSymbol(prev.globCreateData)  
          : prev.chartState == 'LegendOptions' ? LegendOptions(prev.globCreateData)  
          : prev.chartState == 'LegendWithMeasures' ? LegendWithMeasures(prev.globCreateData)  
          : prev.chartState == 'SimpleDatumLegend' ? SimpleDatumLegend(prev.globCreateData)  
          : prev.chartState == 'SimpleSeriesLegend' ? SimpleSeriesLegend(prev.globCreateData) 
          // Lines 
          : prev.chartState == 'LineAnimationZoomChart' ? LineAnimationZoomChart(prev.globCreateData)  
          : prev.chartState == 'AreaAndLineChart' ? AreaAndLineChart(prev.globCreateData)  
          : prev.chartState == 'DashPatternLineChart' ? DashPatternLineChart(prev.globCreateData)  
          : prev.chartState == 'LineLineAnnotationChart' ? LineLineAnnotationChart(prev.globCreateData)  
          : prev.chartState == 'PointsLineChart' ? PointsLineChart(prev.globCreateData)  
          : prev.chartState == 'LineRangeAnnotationMarginChart' ? LineRangeAnnotationMarginChart(prev.globCreateData)  
          : prev.chartState == 'LineRangeAnnotationChart' ? LineRangeAnnotationChart(prev.globCreateData)  
          : prev.chartState == 'SegmentsLineChart' ? SegmentsLineChart(prev.globCreateData)  
          : prev.chartState == 'SimpleNullsLineChart' ? SimpleNullsLineChart(prev.globCreateData)  
          : prev.chartState == 'SimpleLineChart' ? SimpleLineChart(prev.globCreateData)  
          : prev.chartState == 'StackedAreaCustomColorLineChart' ? StackedAreaCustomColorLineChart(prev.globCreateData)  
          : prev.chartState == 'StackedAreaNullsLineChart' ? StackedAreaNullsLineChart(prev.globCreateData)  
          : prev.chartState == 'StackedAreaLineChart' ? StackedAreaLineChart(prev.globCreateData)
          // Pie  
          : prev.chartState == 'DonutAutoLabelChart' ? DonutAutoLabelChart(prev.globCreateData)  
          : prev.chartState == 'DonutPieChart' ? DonutPieChart(prev.globCreateData)  
          : prev.chartState == 'GaugeChart' ? GaugeChart(prev.globCreateData)  
          : prev.chartState == 'PieOutsideLabelChart' ? PieOutsideLabelChart(prev.globCreateData)  
          : prev.chartState == 'PartialPieChart' ? PartialPieChart(prev.globCreateData) 
          : prev.chartState == 'SimplePieChart' ? SimplePieChart(prev.globCreateData)
          // Series
          : prev.chartState == 'TimeSeriesConfidenceInterval' ? TimeSeriesConfidenceInterval.withSampleData()
          : prev.chartState == 'EndPointsAxisTimeSeriesChart' ? EndPointsAxisTimeSeriesChart.withSampleData()
          : prev.chartState == 'TimeSeriesLineAnnotationChart' ? TimeSeriesLineAnnotationChart.withSampleData()
          : prev.chartState == 'TimeSeriesRangeAnnotationChart' ? TimeSeriesRangeAnnotationChart.withSampleData()
          : prev.chartState == 'SimpleTimeSeriesChart' ? SimpleTimeSeriesChart.withSampleData()
          : prev.chartState == 'TimeSeriesSymbolAnnotationChart' ? TimeSeriesSymbolAnnotationChart.withSampleData()
          : prev.chartState == 'TimeSeriesBar' ? TimeSeriesBar.withSampleData() 
          : null
        ),
      );
    }  else {
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

    prev.chartState = action.route;
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
