import 'package:charts_flutter/flutter.dart' as charts;

class Properties {
  Properties(this.domain, this.measure, {this.color});
  final String domain;
  final int measure;
  final charts.Color color;
}

class PropertiesDateTime {
  PropertiesDateTime(this.dtDomain, this.measure);
  final DateTime dtDomain;
  final int measure;
}

class PropertiesInt {
  PropertiesInt(this.dtDomain, this.measure);
  final int dtDomain;
  final int measure;
}