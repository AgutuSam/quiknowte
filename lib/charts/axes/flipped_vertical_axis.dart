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

/// Bar chart example
// EXCLUDE_FROM_GALLERY_DOCS_START
import 'dart:math';
// EXCLUDE_FROM_GALLERY_DOCS_END
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

/// Example of flipping the vertical measure axis direction so that larger
/// values render downward instead of the usual rendering up.
///
/// flipVerticalAxis, when set, flips the vertical axis from its default
/// direction.
///
/// Note: primary and secondary may flip left and right positioning when
/// RTL.flipAxisLocations is set.
class FlippedVerticalAxis extends StatelessWidget {
  FlippedVerticalAxis(this.seriesList, {this.animate});

  factory FlippedVerticalAxis.withSampleData() {
    return FlippedVerticalAxis(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  // EXCLUDE_FROM_GALLERY_DOCS_START
  // This section is excluded from being copied to the gallery.
  // It is used for creating random series data to demonstrate animation in
  // the example app only.
  factory FlippedVerticalAxis.withRandomData() {
    return FlippedVerticalAxis(_createRandomData());
  }
  final List<charts.Series<dynamic, String>> seriesList;
  final bool animate;

  /// Create random data.
  static List<charts.Series<RunnerRank, String>> _createRandomData() {
    final random = Random();

    const runners = ['Smith', 'Jones', 'Brown', 'Doe'];

    // Randomly assign runners, but leave the order of the places.
    final raceData = [
      RunnerRank(runners.removeAt(random.nextInt(runners.length)), 1),
      RunnerRank(runners.removeAt(random.nextInt(runners.length)), 2),
      RunnerRank(runners.removeAt(random.nextInt(runners.length)), 3),
      RunnerRank(runners.removeAt(random.nextInt(runners.length)), 4),
    ];

    return [
      charts.Series<RunnerRank, String>(
        id: 'Race Results',
        domainFn: (RunnerRank row, _) => row.name,
        measureFn: (RunnerRank row, _) => row.place,
        data: raceData,
      ),
    ];
  }
  // EXCLUDE_FROM_GALLERY_DOCS_END

  // Known Issue, the bar chart cannot render negative direction bars at this
  // time so the result is an empty chart.
  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: animate,
      flipVerticalAxis: true,
    );
  }

  /// Create series list with multiple series
  static List<charts.Series<RunnerRank, String>> _createSampleData() {
    final raceData = [
      RunnerRank('Smith', 1),
      RunnerRank('Jones', 2),
      RunnerRank('Brown', 3),
      RunnerRank('Doe', 4),
    ];

    return [
      charts.Series<RunnerRank, String>(
          id: 'Race Results',
          domainFn: (RunnerRank row, _) => row.name,
          measureFn: (RunnerRank row, _) => row.place,
          data: raceData),
    ];
  }
}

/// Datum/Row for the chart.
class RunnerRank {
  RunnerRank(this.name, this.place);
  final String name;
  final int place;
}
