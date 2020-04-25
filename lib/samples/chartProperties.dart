
class ChartProps{
   ChartProps(
      this._choicebtn,
      this._samplesTitle,
      this._samplesValue,
      );

       ChartProps.map(dynamic obj){
    _choicebtn = obj['choiceBtn'] as String; 
    _samplesTitle = obj['samplesTitle;'] as List<dynamic>;
    _samplesValue = obj['samplesValue'] as List<dynamic>;
  }

 ChartProps.fromMap(Map<String, dynamic> map) {
     _choicebtn = map['choiceBtn'] as String;
     _samplesTitle = map['samplesTitle'] as List<dynamic>;
     _samplesValue = map['samplesValue'] as List<dynamic>;
   }

  String _choicebtn;
   List<dynamic> _samplesTitle;
   List<dynamic> _samplesValue;

  
  String get  choiceBtn => _choicebtn;
  List<dynamic> get samplesTitle => _samplesTitle;
  List<dynamic> get samplesValue => _samplesValue;

   Map<String, dynamic> toMap() {
     final map =Map<String, dynamic>();
    
     map['choiceBtn'] = _choicebtn;
     map['samplesTitle'] = _samplesTitle;
     map['samplesValue'] = _samplesValue;

     return map;
   }

  }

