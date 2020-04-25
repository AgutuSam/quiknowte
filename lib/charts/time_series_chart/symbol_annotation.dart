// Copyright 2018 the Charts project authors. Please see the AUTHORS file
// for details.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

/// Example of timeseries chart with annotation rows between the chart draw area
/// and the domain axis.
///
/// The symbol annotation renderer draws a row of symbols for each series below
/// the drawArea but above the bottom axis.
///
/// This renderer can draw point annotations and range annotations. Point
/// annotations are drawn at the location of the domain along the chart's domain
/// axis, in the row for its series. Range annotations are drawn as a range
/// shape between the domainLowerBound and domainUpperBound positions along the
/// chart's domain axis. Point annotations are drawn on top of range
/// annotations.
// EXCLUDE_FROM_GALLERY_DOCS_START
import 'dart:math';
// EXCLUDE_FROM_GALLERY_DOCS_END
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class TimeSeriesSymbolAnnotationChart extends StatelessWidget {
  TimeSeriesSymbolAnnotationChart(this.seriesList, {this.animate});

  /// Creates a [TimeSeriesChart] with sample data and no transition.
  factory TimeSeriesSymbolAnnotationChart.withSampleData() {
    return TimeSeriesSymbolAnnotationChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  // EXCLUDE_FROM_GALLERY_DOCS_START
  // This section is excluded from being copied to the gallery.
  // It is used for creating random series data to demonstrate animation in
  // the example app only.
  factory TimeSeriesSymbolAnnotationChart.withRandomData() {
    return TimeSeriesSymbolAnnotationChart(_createRandomData());
  }
  final List<charts.Series<dynamic, DateTime>> seriesList;
  final bool animate;

  /// Create random data.
  static List<charts.Series<TimeSeriesSales, DateTime>> _createRandomData() {
    final random = Random();

    final myDesktopData = [
      TimeSeriesSales(
          timeCurrent: DateTime(2017, 9, 19), sales: random.nextInt(100)),
      TimeSeriesSales(
          timeCurrent: DateTime(2017, 9, 26), sales: random.nextInt(100)),
      TimeSeriesSales(
          timeCurrent: DateTime(2017, 10, 3), sales: random.nextInt(100)),
      TimeSeriesSales(
          timeCurrent: DateTime(2017, 10, 10), sales: random.nextInt(100)),
    ];

    final myTabletData = [
      TimeSeriesSales(
          timeCurrent: DateTime(2017, 9, 19), sales: random.nextInt(100)),
      TimeSeriesSales(
          timeCurrent: DateTime(2017, 9, 26), sales: random.nextInt(100)),
      TimeSeriesSales(
          timeCurrent: DateTime(2017, 10, 3), sales: random.nextInt(100)),
      TimeSeriesSales(
          timeCurrent: DateTime(2017, 10, 10), sales: random.nextInt(100)),
    ];

    // Example of a series with two range annotations. A regular point shape
    // will be drawn at the current domain value, and a range shape will be
    // drawn between the previous and target domain values.
    //
    // Note that these series do not contain any measure values. They are
    // positioned automatically in rows.
    final myAnnotationDataTop = [
      TimeSeriesSales(
        timeCurrent: DateTime(2017, 9, 24),
        timePrevious: DateTime(2017, 9, 19),
        timeTarget: DateTime(2017, 9, 24),
      ),
      TimeSeriesSales(
        timeCurrent: DateTime(2017, 9, 29),
        timePrevious: DateTime(2017, 9, 29),
        timeTarget: DateTime(2017, 10, 4),
      ),
    ];

    // Example of a series with one range annotation and two single point
    // annotations. Omitting the previous and target domain values causes that
    // datum to be drawn as a single point.
    final myAnnotationDataBottom = [
      TimeSeriesSales(
        timeCurrent: DateTime(2017, 9, 25),
        timePrevious: DateTime(2017, 9, 21),
        timeTarget: DateTime(2017, 9, 25),
      ),
      TimeSeriesSales(timeCurrent: DateTime(2017, 9, 31)),
      TimeSeriesSales(timeCurrent: DateTime(2017, 10, 5)),
    ];

    return [
      charts.Series<TimeSeriesSales, DateTime>(
        id: 'Desktop',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.timeCurrent,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: myDesktopData,
      ),
      charts.Series<TimeSeriesSales, DateTime>(
        id: 'Tablet',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.timeCurrent,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: myTabletData,
      ),
      charts.Series<TimeSeriesSales, DateTime>(
        id: 'Annotation Series 1',
        colorFn: (_, __) => charts.MaterialPalette.gray.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.timeCurrent,
        domainLowerBoundFn: (TimeSeriesSales row, _) => row.timePrevious,
        domainUpperBoundFn: (TimeSeriesSales row, _) => row.timeTarget,
        // No measure values are needed for symbol annotations.
        measureFn: (_, __) => null,
        data: myAnnotationDataTop,
      )
        // Configure our custom symbol annotation renderer for this series.
        ..setAttribute(charts.rendererIdKey, 'customSymbolAnnotation')
        // Optional radius for the annotation shape. If not specified, this will
        // default to the same radius as the points.
        ..setAttribute(charts.boundsLineRadiusPxKey, 3.5),
      charts.Series<TimeSeriesSales, DateTime>(
        id: 'Annotation Series 2',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.timeCurrent,
        domainLowerBoundFn: (TimeSeriesSales row, _) => row.timePrevious,
        domainUpperBoundFn: (TimeSeriesSales row, _) => row.timeTarget,
        // No measure values are needed for symbol annotations.
        measureFn: (_, __) => null,
        data: myAnnotationDataBottom,
      )
        // Configure our custom symbol annotation renderer for this series.
        ..setAttribute(charts.rendererIdKey, 'customSymbolAnnotation')
        // Optional radius for the annotation shape. If not specified, this will
        // default to the same radius as the points.
        ..setAttribute(charts.boundsLineRadiusPxKey, 3.5),
    ];
  }
  // EXCLUDE_FROM_GALLERY_DOCS_END

  @override
  Widget build(BuildContext context) {
    return charts.TimeSeriesChart(
      seriesList,
      animate: animate,
      // Custom renderer configuration for the point series.
      customSeriesRenderers: [
        charts.SymbolAnnotationRendererConfig(
            // ID used to link series to this renderer.
            customRendererId: 'customSymbolAnnotation')
      ],
      // Optionally pass in a [DateTimeFactory] used by the chart. The factory
      // should create the same type of [DateTime] as the data provided. If none
      // specified, the default creates local date time.
      dateTimeFactory: const charts.LocalDateTimeFactory(),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
    final myDesktopData = [
      TimeSeriesSales(timeCurrent: DateTime(2017, 9, 19), sales: 5),
      TimeSeriesSales(timeCurrent: DateTime(2017, 9, 26), sales: 25),
      TimeSeriesSales(timeCurrent: DateTime(2017, 10, 3), sales: 100),
      TimeSeriesSales(timeCurrent: DateTime(2017, 10, 10), sales: 75),
    ];

    final myTabletData = [
      TimeSeriesSales(timeCurrent: DateTime(2017, 9, 19), sales: 10),
      TimeSeriesSales(timeCurrent: DateTime(2017, 9, 26), sales: 50),
      TimeSeriesSales(timeCurrent: DateTime(2017, 10, 3), sales: 200),
      TimeSeriesSales(timeCurrent: DateTime(2017, 10, 10), sales: 150),
    ];

    // Example of a series with two range annotations. A regular point shape
    // will be drawn at the current domain value, and a range shape will be
    // drawn between the previous and target domain values.
    //
    // Note that these series do not contain any measure values. They are
    // positioned automatically in rows.
    final myAnnotationDataTop = [
      TimeSeriesSales(
        timeCurrent: DateTime(2017, 9, 24),
        timePrevious: DateTime(2017, 9, 19),
        timeTarget: DateTime(2017, 9, 24),
      ),
      TimeSeriesSales(
        timeCurrent: DateTime(2017, 9, 29),
        timePrevious: DateTime(2017, 9, 29),
        timeTarget: DateTime(2017, 10, 4),
      ),
    ];

    // Example of a series with one range annotation and two single point
    // annotations. Omitting the previous and target domain values causes that
    // datum to be drawn as a single point.
    final myAnnotationDataBottom = [
      TimeSeriesSales(
        timeCurrent: DateTime(2017, 9, 25),
        timePrevious: DateTime(2017, 9, 21),
        timeTarget: DateTime(2017, 9, 25),
      ),
      TimeSeriesSales(timeCurrent: DateTime(2017, 9, 31)),
      TimeSeriesSales(timeCurrent: DateTime(2017, 10, 5)),
    ];

    return [
      charts.Series<TimeSeriesSales, DateTime>(
        id: 'Desktop',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.timeCurrent,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: myDesktopData,
      ),
      charts.Series<TimeSeriesSales, DateTime>(
        id: 'Tablet',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.timeCurrent,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: myTabletData,
      ),
      charts.Series<TimeSeriesSales, DateTime>(
        id: 'Annotation Series 1',
        colorFn: (_, __) => charts.MaterialPalette.gray.shadeDefault,
        // A point shape will be drawn at the location of the domain.
        domainFn: (TimeSeriesSales sales, _) => sales.timeCurrent,
        // A range shape will be drawn between the lower and upper domain
        // bounds. The range will be drawn underneath the domain point.
        domainLowerBoundFn: (TimeSeriesSales row, _) => row.timePrevious,
        domainUpperBoundFn: (TimeSeriesSales row, _) => row.timeTarget,
        // No measure values are needed for symbol annotations.
        measureFn: (_, __) => null,
        data: myAnnotationDataTop,
      )
        // Configure our custom symbol annotation renderer for this series.
        ..setAttribute(charts.rendererIdKey, 'customSymbolAnnotation')
        // Optional radius for the annotation range. If not specified, this will
        // default to the same radius as the domain point.
        ..setAttribute(charts.boundsLineRadiusPxKey, 3.5),
      charts.Series<TimeSeriesSales, DateTime>(
        id: 'Annotation Series 2',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        // A point shape will be drawn at the location of the domain.
        domainFn: (TimeSeriesSales sales, _) => sales.timeCurrent,
        // A range shape will be drawn between the lower and upper domain
        // bounds. The range will be drawn underneath the domain point.
        domainLowerBoundFn: (TimeSeriesSales row, _) => row.timePrevious,
        domainUpperBoundFn: (TimeSeriesSales row, _) => row.timeTarget,
        // No measure values are needed for symbol annotations.
        measureFn: (_, __) => null,
        data: myAnnotationDataBottom,
      )
        // Configure our custom symbol annotation renderer for this series.
        ..setAttribute(charts.rendererIdKey, 'customSymbolAnnotation')
        // Optional radius for the annotation range. If not specified, this will
        // default to the same radius as the domain point.
        ..setAttribute(charts.boundsLineRadiusPxKey, 3.5),
    ];
  }
}

/// Sample time series data type.
class TimeSeriesSales {
  TimeSeriesSales(
      {this.timeCurrent, this.timePrevious, this.timeTarget, this.sales});
  final DateTime timeCurrent;
  final DateTime timePrevious;
  final DateTime timeTarget;
  final int sales;
}
