class Sample{
   Sample(
      this._id,
      this._tableTitle,
      this._samplesTitle,
      this._samplesText,
      );

       Sample.map(dynamic obj){
    _id = obj['id'] as int;
    _tableTitle = obj['tableTitle'] as String;
    _samplesTitle = obj['samplesTitle;'] as List<String>;
    _samplesText = obj['samplesText'] as List<String>;
  }

 Sample.fromMap(Map<String, dynamic> map) {
     _id = map['id'] as int;
     _tableTitle = map['tableTitle'] as String;
     _samplesTitle = map['samplesTitle'] as List<String>;
     _samplesText = map['samplesText'] as List<String>;
   }
  int _id;
  String _tableTitle;
   List<String> _samplesTitle;
   List<String> _samplesText;

  int get id => _id;
  dynamic get  tableTitle => _tableTitle;
  List<dynamic> get samplesTitle => _samplesTitle;
  List<dynamic> get samplesText => _samplesText;

   Map<String, dynamic> toMap() {
     final map =Map<String, dynamic>();
     if (_id != null) {
       map['id'] = _id;
     }
     map['tableTitle'] = _tableTitle;
     map['samplesTitle'] = _samplesTitle;
     map['samplesText'] = _samplesText;

     return map;
   }

  }

