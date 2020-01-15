
class Psample{
   Psample(
      this._tableTitle,
      this._samplesTitle,
      this._samplesValue,
      );

       Psample.map(dynamic obj){
    _tableTitle = obj['tableTitle'] as String;
    _samplesTitle = obj['samplesTitle;'] as List<dynamic>;
    _samplesValue = obj['samplesValue'] as List<dynamic>;
  }

 Psample.fromMap(Map<String, dynamic> map) {
     _tableTitle = map['tableTitle'] as String;
     _samplesTitle = map['samplesTitle'] as List<dynamic>;
     _samplesValue = map['samplesValue'] as List<dynamic>;
   }

  String _tableTitle;
   List<dynamic> _samplesTitle;
   List<dynamic> _samplesValue;

  
  String get  tableTitle => _tableTitle;
  List<dynamic> get samplesTitle => _samplesTitle;
  List<dynamic> get samplesValue => _samplesValue;

   Map<String, dynamic> toMap() {
     final map =Map<String, dynamic>();
    
     map['tableTitle'] = _tableTitle;
     map['samplesTitle'] = _samplesTitle;
     map['samplesValue'] = _samplesValue;

     return map;
   }

  }

