class Ptable{
   Ptable(
      this._tableName,
      );

       Ptable.map(dynamic obj){
    _tableName = obj['tableName'] as String;
  }

 Ptable.fromMap(Map<String, dynamic> map) {
     _tableName = map['tableName'] as String;
   }

  String _tableName;

    dynamic get  tableName => _tableName;

   Map<String, dynamic> toMap() {
     final map =Map<String, dynamic>();
     
     map['tableName'] = _tableName;

     return map;
   }

  }

