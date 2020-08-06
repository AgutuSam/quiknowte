import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class AppState {
  AppState(
      {this.currentTable,
      this.date,
      this.location,
      this.placemark,
      this.inputVal,
      this.inputBool,
      this.labelText,
      this.selectedDate,
      this.selectedTime,
      this.selectDate,
      this.selectTime,
      this.columns,
      this.valuez,
      this.snapshot,
      this.image,
      this.audio,
      this.video,
      this.inForm});

  factory AppState.initial() => AppState(
        date: 'Not set',
        image: 'No Image set',
        location: null,
        placemark: null,
        columns: [],
        valuez: [],
        inputVal: [],
        inputBool: false,
        inForm: Container(
          padding: EdgeInsets.all(20.0),
        ),
      );

  String currentTable;
  String date;
  String audio;
  String image;
  String video;
  Position location;
  List<Placemark> placemark;
  List inputVal;
  bool inputBool;
  List columns;
  List valuez;
  Future<List<Map>> snapshot;
  int snapshotLength;
  Widget inForm;
  String labelText;
  DateTime selectedDate;
  TimeOfDay selectedTime;
  ValueChanged<DateTime> selectDate;
  ValueChanged<TimeOfDay> selectTime;
  Position locat;
}
