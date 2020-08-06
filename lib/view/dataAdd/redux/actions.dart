class DatePick {
  DatePick({this.date, this.index});
  final DateTime date;
  final int index;
}

class InputVal {
  InputVal({this.inputLength});
  final int inputLength;
}

class InputValChange {
  InputValChange({this.val, this.key, this.index});
  final String val;
  final String key;
  final int index;
}

class Submit {
  Submit({this.columns, this.currentTable});
  final List columns;
  final String currentTable;
}

class FetchTablesVals {
  FetchTablesVals({this.currentTable});
  final String currentTable;
}

class InitInputVals {
  InitInputVals({this.num});
  final int num;
}

class Location {}
