import 'dart:async';
import 'dart:io';
import 'package:sqfentity_sample/samples/ptitles.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqfentity_sample/model/dynsql.dart' as flex;

class DatabaseHelper {
  factory DatabaseHelper() => _instance;
  DatabaseHelper.internal();
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  final daync = flex.DatabaseHelper();

  static Database _db;
  List<dynamic> tabname = [];
  List<dynamic> tabval = [];
  List<dynamic> tabdata = [];
  var comma = ',';
  var equal = ' = ';
  String quote = '"';
  final String exten = '.db';
  var date, time, concat;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    return await initDb();
  }

  Future<Database> initDb() async {
    final String databasesPath = await getDatabasesPath();
    final String path = join(databasesPath, 'projects.db');

//    await deleteDatabase(path); // just for testing

    final db = await openDatabase(path, version: 1, onCreate: _onCreate);
    final result = await db.rawQuery('SELECT name FROM sqlite_master '
    'WHERE type == "table" AND name NOT LIKE "sqlite_%" AND name NOT LIKE "android%"');
print(result.toList());
    print(db);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        //changed
        'CREATE TABLE projects (Id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,note TEXT,time TEXT)');
  }

  // ADD NEW PROJECT!
  Future<dynamic> saveProject(Ptitle sample) async {
    // final String databasesPath = await getDatabasesPath();
    final dbClient = await db;
//    var result = await dbClient.insert(tableName, sample.toMap());
    var tabName;
// final String table = sample.tableTitle[0] as String;
    for (var i = 0; i < sample.tableTitle.length; i++) {
      if (i != sample.tableTitle.length - 1) {
        final eye = sample.tableTitle[i] as String;
        tabname.add(quote + eye + quote + comma);
      } else if (i == sample.tableTitle.length - 1) {
        final eye = sample.tableTitle[i] as String;
        tabname.add(quote + eye + quote);
      }
    }

    tabName = tabname.join();
// date = DateTime.now();
    date = '271019';
// time = TimeOfDay.now();
    final DateTime today = DateTime.now();
    final String nameTime =
        "$quote${sample.tableTitle[0]}${today.year.toString()}${today.month.toString().padLeft(2, '0')}${today.day.toString().padLeft(2, '0')}${today.hour.toString().padLeft(2, '0')}${today.minute.toString().padLeft(2, '0')}$quote";
// time = '1120';
// concat = sample.tableTitle[0]+date+time;
    concat = 'haunahoo';
    print(tabName);
// print(date);
// print(time);
// print(concat);

    final result =
        await dbClient.rawInsert('INSERT INTO projects(name,note,time)'
            'VALUES($tabName,$nameTime)');
    // 'INSERT INTO projects (\'${sample.tableTitle[1]}\',\'${sample.tableTitle[0]}\',\'${sample.tableTitle[2]}\') '
    // 'VALUES (\'${sample.samplesValue[1]}\',\'${sample.samplesValue[0]}\',\'${sample.samplesValue[2]}\')');
    tabname = [];
    tabName = [];
    print(result);
    daync.createDB(nameTime);
    return result;
  }

  // REMOVE A PROJECT!
  Future<dynamic> deleteProject(int id, String name) async {
    final dbClient = await db;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    final String dbPath = prefs.getString('dbPath');
    final dir = Directory(dbPath);
    print(id);
    print(name);
    final bool exist = await databaseExists(dbPath);
    print(exist);
    // return await dbClient.delete(tableName, where: '$columnId = ?', whereArgs: [id]);
    await dbClient.rawDelete('DELETE FROM projects WHERE Id = $id');
    dir.deleteSync(recursive: true);
    await deleteDatabase(dbPath);
    print(exist);
  }

// // UPDATE TABLE VALUES!
//   Future<int> updateProject(Psample sample,int id) async {
//     final dbClient = await db;

// var tabData;

// for (var i = 0; i < sample.samplesTitle.length; i++)  {
//    if(i != sample.samplesTitle.length-1){
//        tabdata.add(sample.samplesTitle[i]+equal+sample.samplesValue[i]+comma);
//      }else if(i == sample.samplesTitle.length-1){
//     tabdata.add(sample.samplesTitle[i]+equal+sample.samplesValue[i]);
//     }
// }

// tabData = tabdata.join();
// date = DateTime.now() as String;
// time = TimeOfDay.now() as String;
// concat = sample.tableTitle[0]+date+time;
// print(tabData);
// print(date);
// print(time);
// print(concat);
//     // return await dbClient.update(tableName, sample.toMap(), where: "$columnId = ?", whereArgs: [sample.id]);
//    return await dbClient.rawUpdate(
//        'UPDATE projects SET $tabData WHERE id = $id');
//   }

// GET ALLFROM TABLE!
  Future<List<Map>> getAllSamples() async {
    final dbClient = await db;
//    var result = await dbClient.query(
//        tableName, columns: [columnId, columnInt[], columnText[]]);
    final result = await dbClient.rawQuery('SELECT * FROM projects');

    print(result.toList());
    // print(result);
    return result.toList();
  }

  // GET ALL FROM AN ID!
  Future<Ptitle> getProject(int id) async {
    final dbClient = await db;
//    List<Map> result = await dbClient.query(tableName,
//        columns: [columnId, columnInt[], columnText[]],
//        where: '$columnId = ?',
//        whereArgs: [id]);
    final result =
        await dbClient.rawQuery('SELECT * FROM projects WHERE Id = $id');

    if (result.isNotEmpty) {
      print(Ptitle.fromMap(result.first));
      print(result);
      return Ptitle.fromMap(result.first);
    } else {
      return null;
    }
  }

  // GET NUMBER OF PROJECTS!
  Future<int> getCount() async {
    final dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient.rawQuery('SELECT COUNT(*) FROM projects'));
  }

  Future closer() async {
    final dbClient = await db;
    return await dbClient.close();
  }
}
