import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sqfentity_sample/samples/psamples.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelper {
  factory DatabaseHelper() => _inst;
  DatabaseHelper.internal();
  static DatabaseHelper _inst = DatabaseHelper.internal();

  List<dynamic> tableName = [];
  List<dynamic> tabname = [];
  List<dynamic> tabval = [];
  List<dynamic> tabdata = [];
  static List<dynamic> columnName = ['username TEXT', 'admnum TEXT'];
  List<dynamic> colnameVar = [];
  List<dynamic> colnameConst = [];
  var comma = ',';
  var equal = ' = ';
  String quote = "'";
  var exten = '.db';
  String date, time, concat;

  static Database _dyn;
// Future<Database>  dyn;

  int get newVersion => null;
  Future<Database> get dyn async {
    if (_dyn != null) {
      return _dyn;
    }
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    final String dbName = prefs.getString('dbName');
    print(dbName);
    return await createDBnxt(dbName);
  }

  Future<Database> createDB(String tabName) async {
    final String databasesPath = await getDatabasesPath();
    final String path = join(databasesPath, tabName);

    final dyn = await openDatabase(path, version: 1);
// createTab(dyn, newVersion);
    return dyn;
  }

  Future<Database> createDBnxt(String tabName) async {
    final String databasesPath = await getDatabasesPath();
    final String path = join(databasesPath, tabName);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    final String dbPath = prefs.getString('dbPath');
    final dyn = await openDatabase(dbPath, version: 1);
    print(path);
    print(dbPath);
    print(dyn);
// createTab(dyn, newVersion);
    return dyn;
  }

  Future<dynamic> table(List tableName, List constants, List variables) async {
    int t;
    String tableVar;
    String tableConst;
    final int num = tableName.length;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String dbPath = prefs.getString('dbPath');
    final dyn = await openDatabase(dbPath, version: 1);

Future createTabConst(Database dyn, int newVersion) async {
   for (int i = 0; i < constants.length; i++) {
        if (constants == null || constants.isEmpty) {
        } else {
          if (i != constants.length - 1) {
            final eye = constants[i] as String;
            // colname.add(quote+eye+quote+comma);
            colnameConst.add(eye + comma);
          } else if (i == constants.length - 1) {
            final eye = constants[i] as String;
            //  colname.add(quote+eye+quote);
            colnameConst.add(eye);
          }
        }
      }
      final colNameConst = colnameConst.join();
      print(colNameConst);
       await dyn.execute(
          //changed
          'CREATE TABLE $tableConst ($colNameConst,Id INTEGER PRIMARY KEY AUTOINCREMENT)');

      colnameConst = [];
      colnameVar = [];
}

    Future createTabVar(Database dyn, int newVersion) async {
      for (int i = 0; i < variables.length; i++) {
        if (variables == null || variables.isEmpty) {
        } else {
          if (i != variables.length - 1) {
            final eye = variables[i] as String;
            // colname.add(quote+eye+quote+comma);
            colnameVar.add(eye + comma);
          } else if (i == variables.length - 1) {
            final eye = variables[i] as String;
            //  colname.add(quote+eye+quote);
            colnameVar.add(eye);
          }
        }
      }
     
      final colNameVar = colnameVar.join();
      print(tableName);
      print(colNameVar);

      await dyn.execute(
          //changed
          'CREATE TABLE $tableVar ($colNameVar,Id INTEGER PRIMARY KEY AUTOINCREMENT)');

      colnameConst = [];
      colnameVar = [];
    }

    Future returnMethod() async {
      final String constExten = '_CONST';
      for (t = 0; t < num; t++) {
        tableVar = tableName[t] as String;
        if(constants == null || constants.isEmpty){
        }else{
          tableConst = tableName[t]+constExten as String;
          createTabConst(dyn, newVersion);
        }
        createTabVar(dyn, newVersion);
        colnameConst = [];
      colnameVar = [];
      }
    }
    return returnMethod();
  }

  // INSERT INTO TABLE!
  Future<dynamic> saveTabVal(String tableName, List samplesTitle, List samplesValue) async {
    final dyClient = await dyn;
//    var result = await dyClient.insert(tableName, sample.toMap());
    String tabVal, tabName;

    for (var i = 0; i < samplesTitle.length; i++) {
      if (i != samplesTitle.length - 1) {
        final eye = samplesTitle[i] as String;
        tabname.add(eye + comma);
      } else if (i == samplesTitle.length - 1) {
        final eye = samplesTitle[i] as String;
        tabname.add(eye);
      }
    }
    for (var i = 0; i < samplesValue.length; i++) {
      if (i != samplesValue.length - 1) {
        final eye = samplesValue[i] as String;
        tabval.add(quote + eye + quote + comma);
      } else if (i == samplesValue.length - 1) {
        final eye = samplesValue[i] as String;
        tabval.add(quote + eye + quote);
      }
    }
    tabName = tabname.join();
    tabVal = tabval.join();
    print(tabName);
    print(tabVal);
    // tableName = sample.tableTitle as List;
    
    // 'INSERT INTO test (\'${sample.samplesTitle[1]}\',\'${sample.samplesTitle[0]}\') '
    //     'VALUES (\'${sample.samplesValue[1]}\',\'${sample.samplesValue[0]}\')');
    tabname = [];
    tabval = [];

    Future resultMethod() async{
      final result = await dyClient.rawInsert(
        //  'INSERT INTO $tableName($tabName)'
        //       'VALUES($tabVal)');
        'INSERT INTO $tableName($tabName)'
        'VALUES($tabVal)');
      tabname = [];
    tabval = [];
      return result;
    }
    return resultMethod();
  }

  // DELETE FROM TABLE!
  Future<int> deleteTabVal(int id, String tabName) async {
    final dyClient = await dyn;
    // return await dyClient.delete(tableName, where: '$columnId = ?', whereArgs: [id]);
    return await dyClient.rawDelete('DELETE FROM $tabName WHERE id = $id');
  }

  // UPDATE TABLE VALUES!
  Future<int> updateTabVal(Psample sample, int id) async {
    final dyClient = await dyn;

    var tabData;

    for (var i = 0; i < sample.samplesTitle.length; i++) {
      if (i != sample.samplesTitle.length - 1) {
        tabdata.add(
            sample.samplesTitle[i] + equal + sample.samplesValue[i] + comma);
      } else if (i == sample.samplesTitle.length - 1) {
        tabdata.add(sample.samplesTitle[i] + equal + sample.samplesValue[i]);
      }
    }

    tabData = tabdata.join();
    date = DateTime.now() as String;
    time = TimeOfDay.now() as String;
    concat = sample.tableTitle[0] + date + time;
    print(tabData);
    print(date);
    print(time);
    print(concat);
    // return await dyClient.update(tableName, sample.toMap(), where: "$columnId = ?", whereArgs: [sample.id]);
    return await dyClient
        .rawUpdate('UPDATE projects SET $tabData WHERE id = $id');
  }

  // GET ALLFROM TABLE!
  Future<List<Map>> getAllSamples(String tabName) async {
    final dyClient = await dyn;
//    var result = await dyClient.query(
//        tableName, columns: [columnId, columnInt[], columnText[]]);
    final result = await dyClient.rawQuery('SELECT * FROM $tabName');
    print(result.toList());
    return result.toList();
  }

  // GET TABLE STRUCTURE!
  Future<List<Map>> getTableInfo(String tabName) async {
    final dyClient = await dyn;
    final result = await dyClient.rawQuery('PRAGMA table_info($tabName)');
    print(result.toList());
    return result.toList();
  }

  // GET ALL TABLES!
  Future<List<Map>> getAllTables() async {
    final dyClient = await dyn;
//    var result = await dyClient.query(
//        tableName, columns: [columnId, columnInt[], columnText[]]);
    final result = await dyClient.rawQuery('SELECT name FROM sqlite_master '
        'WHERE type == "table" AND name NOT LIKE "sqlite_%" AND name NOT LIKE "android%" AND name NOT LIKE "%_CONST"');
    print(result.toList());
    return result.toList();
  }

  // GET ALL FROM AN ID!
  Future<Psample> getProject(int id) async {
    final dyClient = await dyn;
//    List<Map> result = await dyClient.query(tableName,
//        columns: [columnId, columnInt[], columnText[]],
//        where: '$columnId = ?',
//        whereArgs: [id]);
    final result =
        await dyClient.rawQuery('SELECT * FROM projects WHERE id = $id');

    if (result.isNotEmpty) {
      return Psample.fromMap(result.first);
    } else {
      return null;
    }
  }

  // GET NUMBER OF SAMPLES!
  Future<int> getCount() async {
    final dyClient = await dyn;
    return Sqflite.firstIntValue(
        await dyClient.rawQuery('SELECT COUNT(*) FROM projects'));
  }

  //CLOSE DB!
  Future closer() async {
    final dbClient = await dyn;
    return await dbClient.close();
  }
}
