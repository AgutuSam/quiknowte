import 'package:flutter/material.dart';

class AppState{
  AppState({
    this.currentTable,
    this.date,
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
    this.inForm
  });

  factory AppState.initial() => AppState(
  date: 'Not set',
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
}