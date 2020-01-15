class Ptitle{
   Ptitle(
      this._tableTitle,
      );

       Ptitle.map(dynamic obj){
    _tableTitle = obj['tableTitle'] as List<String>;
  }

 Ptitle.fromMap(Map<String, dynamic> map) {
     _tableTitle = map['tableTitle'] as List<String>;
   }

  List<String> _tableTitle;

  List<dynamic> get  tableTitle => _tableTitle;

   Map<String, dynamic> toMap() {
     final map =Map<String, dynamic>();
     
     map['tableTitle'] = _tableTitle;

     return map;
   }

  }

