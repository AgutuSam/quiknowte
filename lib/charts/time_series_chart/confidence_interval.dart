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

/// Example of a time series chart with a confidence interval.
///
/// Confidence interval is defined by specifying the upper and lower measure
/// bounds in the series.
// EXCLUDE_FROM_GALLERY_DOCS_START
import 'dart:math';
// EXCLUDE_FROM_GALLERY_DOCS_END
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class TimeSeriesConfidenceInterval extends StatelessWidget {
  TimeSeriesConfidenceInterval(this.seriesList, {this.animate});

  /// Creates a [TimeSeriesChart] with sample data and no transition.
  factory TimeSeriesConfidenceInterval.withSampleData() {
    return TimeSeriesConfidenceInterval(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  // EXCLUDE_FROM_GALLERY_DOCS_START
  // This section is excluded from being copied to the gallery.
  // It is used for creating random series data to demonstrate animation in
  // the example app only.
  factory TimeSeriesConfidenceInterval.withRandomData() {
    return TimeSeriesConfidenceInterval(_createRandomData());
  }

  final List<charts.Series<dynamic, DateTime>> seriesList;
  final bool animate;

  /// Create random data.
  static List<charts.Series<TimeSeriesSales, DateTime>> _createRandomData() {
    final random = Random();

    final data = [
      TimeSeriesSales(DateTime(2017, 9, 19), random.nextInt(100)),
      TimeSeriesSales(DateTime(2017, 9, 26), random.nextInt(100)),
      TimeSeriesSales(DateTime(2017, 10, 3), random.nextInt(100)),
      TimeSeriesSales(DateTime(2017, 10, 10), random.nextInt(100)),
    ];

    return [
      charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        // When the measureLowerBoundFn and measureUpperBoundFn is defined,
        // the line renderer will render the area around the bounds.
        measureLowerBoundFn: (TimeSeriesSales sales, _) => sales.sales - 5,
        measureUpperBoundFn: (TimeSeriesSales sales, _) => sales.sales + 5,
        data: data,
      )
    ];
  }
  // EXCLUDE_FROM_GALLERY_DOCS_END

  @override
  Widget build(BuildContext context) {
    return charts.TimeSeriesChart(
      seriesList,
      animate: animate,
      // Optionally pass in a [DateTimeFactory] used by the chart. The factory
      // should create the same type of [DateTime] as the data provided. If none
      // specified, the default creates local date time.
      dateTimeFactory: const charts.LocalDateTimeFactory(),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
    final data = [
      TimeSeriesSales(DateTime(2017, 9, 19), 5),
      TimeSeriesSales(DateTime(2017, 9, 26), 25),
      TimeSeriesSales(DateTime(2017, 10, 3), 100),
      TimeSeriesSales(DateTime(2017, 10, 10), 75),
    ];

    return [
      charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        // When the measureLowerBoundFn and measureUpperBoundFn is defined,
        // the line renderer will render the area around the bounds.
        measureLowerBoundFn: (TimeSeriesSales sales, _) => sales.sales - 5,
        measureUpperBoundFn: (TimeSeriesSales sales, _) => sales.sales + 5,
        data: data,
      )
    ];
  }
}

/// Sample time series data type.
class TimeSeriesSales {
  TimeSeriesSales(this.time, this.sales);
  final DateTime time;
  final int sales;
}
