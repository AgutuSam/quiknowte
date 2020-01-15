import 'dart:async';
// import 'dart:async' as prefix0;
import 'package:sqfentity_sample/samples/sample.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// import 'dart:convert';

class DatabaseHelper {
  factory DatabaseHelper() => _instance;
   DatabaseHelper.internal();
 static final DatabaseHelper _instance =  DatabaseHelper.internal();
   static var tableName;
  String columnId = 'id';

//changed 
  static List<dynamic> columnText= ['time INTEGER','speed INTEGER','name TEXT'];
  var fix = columnText.forEach((note) =>  print(note));

 List<dynamic> tabname = [];
 List<dynamic> colText = [];
 var tabName;
 var comma = ',';
 List<dynamic> tabval = [];
 var tabVal;
  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    // _db = await initDb();

    return await initDb();
  }

  Future<Database> initDb() async {
    final String databasesPath = await getDatabasesPath();
    final String path = join(databasesPath, 'mydeebee.db');

//    await deleteDatabase(path); // just for testing

    final db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {

for (int i = 0; i<columnText.length;i++){
    if(i != columnText.length-1){
       colText.add(columnText[i]+comma);
     }else if(i == columnText.length-1){
    colText.add(columnText[i]);
  }
  }
  final colName = colText.join();
 print(colName);
 await db.execute(
        //changed
          'CREATE TABLE $tableName ($colName,id INTEGER PRIMARY KEY)'
      );
 
  }

  Future<int> saveSample(Sample sample) async {
    final dbClient = await db;
//    var result = await dbClient.insert(tableName, sample.toMap());
var tabVal,tabName;

for (var i = 0; i < sample.samplesTitle.length; i++)  {
   if(i != sample.samplesTitle.length-1){
       tabname.add(sample.samplesTitle[i]+comma);
     }else if(i == sample.samplesTitle.length-1){
    tabname.add(sample.samplesTitle[i]);
    }
}
for (var i = 0; i < sample.samplesText.length; i++) {
  
  if(i != sample.samplesText.length-1){
       tabval.add(sample.samplesText[i]+comma);
     }else if(i == sample.samplesText.length-1){
    tabval.add(sample.samplesText[i]);
    }
}
tabName = tabname.join();
tabVal = tabval.join();
print(tabName);
print(tabVal);

    final result = await dbClient.rawInsert(
       'INSERT INTO $tableName ($tabName) '
            'VALUES ($tabVal)');
        // 'INSERT INTO $tableName (\'${sample.samplesTitle[1]}\',\'${sample.samplesTitle[0]}\',\'${sample.samplesTitle[2]}\') '
            // 'VALUES (\'${sample.samplesText[1]}\',\'${sample.samplesText[0]}\',\'${sample.samplesText[2]}\')');
    print(result);
    return result;
  }

  Future<List> getAllSamples() async {
    final dbClient = await db;
//    var result = await dbClient.query(
//        tableName, columns: [columnId, columnInt[], columnText[]]);
    final result = await dbClient.rawQuery('SELECT * FROM $tableName');

    print(result.toList);
    print(result);
    return result.toList();
  }

  Future<int> getCount() async {
    final dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery('SELECT COUNT(*) FROM $tableName'));
  }

  Future<Sample> getSample(int id) async {
    final dbClient = await db;
//    List<Map> result = await dbClient.query(tableName,
//        columns: [columnId, columnInt[], columnText[]],
//        where: '$columnId = ?',
//        whereArgs: [id]);
    final result = await dbClient.rawQuery('SELECT * FROM $tableName WHERE $columnId = $id');

    if (result.isNotEmpty) {
      return Sample.fromMap(result.first);
    }

print(result);
print(result.first);
    return null;
  }

//   Future<int> deleteSample(int id) async {
//     final dbClient = await db;
//     return await dbClient.delete(tableName, where: '$columnId = ?', whereArgs: [id]);
// //    return await dbClient.rawDelete('DELETE FROM $tableName WHERE $columnId = $id');
//   }

//   Future<int> updateSample(Sample sample) async {
//     final dbClient = await db;
//     return await dbClient.update(tableName, sample.toMap(), where: "$columnId = ?", whereArgs: [sample.id]);
// //    return await dbClient.rawUpdate(
// //        'UPDATE $tableName SET $columnInt = \'${sample.samplesInt}\', $columnText = \'${sample.samplesText}\' WHERE $columnId = ${sample.id}');
//   }

  Future close() async {
    final dbClient = await db;
    return dbClient.close();
  }
}
