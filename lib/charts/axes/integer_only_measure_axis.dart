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

/// Example of timeseries chart forcing the measure axis to have whole number
/// ticks. This is useful if the measure units don't make sense to present as
/// fractional.
///
/// This is done by customizing the measure axis and setting
/// [dataIsInWholeNumbers] on the tick provider.
// EXCLUDE_FROM_GALLERY_DOCS_START
import 'dart:math';
// EXCLUDE_FROM_GALLERY_DOCS_END
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class IntegerOnlyMeasureAxis extends StatelessWidget {
  IntegerOnlyMeasureAxis(this.seriesList, {this.animate});

  /// Creates a [TimeSeriesChart] with sample data and no transition.
  factory IntegerOnlyMeasureAxis.withSampleData() {
    return IntegerOnlyMeasureAxis(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  // EXCLUDE_FROM_GALLERY_DOCS_START
  // This section is excluded from being copied to the gallery.
  // It is used for creating random series data to demonstrate animation in
  // the example app only.
  factory IntegerOnlyMeasureAxis.withRandomData() {
    return IntegerOnlyMeasureAxis(_createRandomData());
  }
  final List<charts.Series<dynamic, DateTime>> seriesList;
  final bool animate;

  /// Create random data.
  static List<charts.Series<MyRow, DateTime>> _createRandomData() {
    final random = Random();

    final data = [
      MyRow(DateTime(2017, 9, 25), random.nextDouble().round()),
      MyRow(DateTime(2017, 9, 26), random.nextDouble().round()),
      MyRow(DateTime(2017, 9, 27), random.nextDouble().round()),
      MyRow(DateTime(2017, 9, 28), random.nextDouble().round()),
      MyRow(DateTime(2017, 9, 29), random.nextDouble().round()),
      MyRow(DateTime(2017, 9, 30), random.nextDouble().round()),
      MyRow(DateTime(2017, 10, 01), random.nextDouble().round()),
      MyRow(DateTime(2017, 10, 02), random.nextDouble().round()),
      MyRow(DateTime(2017, 10, 03), random.nextDouble().round()),
      MyRow(DateTime(2017, 10, 04), random.nextDouble().round()),
      MyRow(DateTime(2017, 10, 05), random.nextDouble().round()),
    ];

    return [
      charts.Series<MyRow, DateTime>(
        id: 'Headcount',
        domainFn: (MyRow row, _) => row.timeStamp,
        measureFn: (MyRow row, _) => row.headcount,
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
      // Provides a custom axis ensuring that the ticks are in whole numbers.
      primaryMeasureAxis: charts.NumericAxisSpec(
          tickProviderSpec: charts.BasicNumericTickProviderSpec(
              // Make sure we don't have values less than 1 as ticks
              // (ie: counts).
              dataIsInWholeNumbers: true,
              // Fixed tick count to highlight the integer only behavior
              // generating ticks [0, 1, 2, 3, 4].
              desiredTickCount: 5)),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<MyRow, DateTime>> _createSampleData() {
    final data = [
      MyRow(DateTime(2017, 9, 25), 0),
      MyRow(DateTime(2017, 9, 26), 0),
      MyRow(DateTime(2017, 9, 27), 0),
      MyRow(DateTime(2017, 9, 28), 0),
      MyRow(DateTime(2017, 9, 29), 0),
      MyRow(DateTime(2017, 9, 30), 0),
      MyRow(DateTime(2017, 10, 01), 1),
      MyRow(DateTime(2017, 10, 02), 1),
      MyRow(DateTime(2017, 10, 03), 1),
      MyRow(DateTime(2017, 10, 04), 1),
      MyRow(DateTime(2017, 10, 05), 1),
    ];

    return [
      charts.Series<MyRow, DateTime>(
        id: 'Headcount',
        domainFn: (MyRow row, _) => row.timeStamp,
        measureFn: (MyRow row, _) => row.headcount,
        data: data,
      )
    ];
  }
}

/// Sample time series data type.
class MyRow {
  MyRow(this.timeStamp, this.headcount);
  final DateTime timeStamp;
  final int headcount;
}
