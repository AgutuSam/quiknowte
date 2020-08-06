import 'dart:async';
import 'dart:io';
// import 'package:flutter/foundation.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';
import 'package:quiknowte/auth/route.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:path/path.dart' as p;
import 'package:quiknowte/home.dart';

import 'auth/auth.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // var dir;
  // List<FileSystemEntity> files = [];
  // Directory parentDir;
  // final List<FileSystemEntity> _files = [];
  // final List<FileSystemEntity> _folder = [];
  // final RegExp dotdb = RegExp(r'([A-Za-z])\w+.db');
  // final RegExp extended = RegExp(r'(?<=databases/)(.*)');
  // // var re = RegExp(r'(?<=quick)(.*)(?=over)');  //after 'quick' and before 'over'

  // Directory('/data/user/0/com.example.quiknowte/databases/')
  //     ?.exists()
  //     ?.then((dirExistence) {
  //   if (!dirExistence) {
  //     Directory('/data/user/0/com.example.quiknowte/databases/')
  //         .create()
  //         .then((directory) {
  //       dir = directory?.path;
  //     });
  //   } else {
  //     // dir = Directory('/data/user/0/com.example.quiknowte/databases/').path;
  //   }
  // });

  // parentDir = Directory(dir);

  // for (var v in parentDir?.listSync()) {
  //   if (p.basename(v?.path)?.substring(0, 1) == '.') {
  //     continue;
  //   }
  //   if (FileSystemEntity.isFileSync(v?.path)) {
  //     if (extended.firstMatch(v?.path.toString())?.group(0) ==
  //             dotdb.firstMatch(v?.path.toString())?.group(0) &&
  //         extended.firstMatch(v?.path.toString())?.group(0) != 'projects.db') {
  //       _files.add(v);
  //     }
  //   } else
  //     _folder?.add(v);
  // }

  // _files?.sort(
  //     (a, b) => a?.path?.toLowerCase()?.compareTo(b?.path?.toLowerCase()));
  // _folder?.sort(
  //     (a, b) => a?.path?.toLowerCase()?.compareTo(b?.path?.toLowerCase()));
  // files
  //   ..clear()
  //   ..addAll(_files);

  // if (files.isNotEmpty && files != null) {
  //   for (var i = 0; i < files.length; i++) {
  //     final StorageReference ref = FirebaseStorage.instance.ref().child(
  //         '/databases/${dotdb.firstMatch(files[i]?.path?.toString())?.group(0)}');
  //     final StorageUploadTask task = ref.putFile(files[i]);
  //     // var uploadTask = storageRef.child('images/' + new Date().getTime() + file.name).put(file, metadata);
  //   }
  // }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.blue,
      home: Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> {
  Future checkFirstSeen() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context)
          // .pushReplacement(MaterialPageRoute(builder: (context) => StartHomePage()));
          .pushReplacement(
              MaterialPageRoute(builder: (context) => RoutePage(auth: Auth())));
    } else {
      prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => SplashScreen()));
    }
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 200), () {
      checkFirstSeen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future startTime() async {
    final _duration = Duration(seconds: 17);
    return Timer(_duration, navigationPage);
  }

  Future navigationPage() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => StartHomePage()));
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/beach.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: FlareActor(
            'assets/img/quiknowte.flr',
            animation: 'quick1',
          ),
        ),
      ),
    );
  }
}

// Future main() async {
//   List<dynamic> notes;
//   final db = DatabaseHelper();

//   DatabaseHelper.tableName ='cars';
//   await db.saveSample(Sample(45,'cars',['speed','time','name'],['86','7','"hutsb"']));

//   print('=== getAllNotes() ===');
//   notes = await db.getAllSamples() // notes = await db.getAllSamples();
//   ..forEach((note) => print(note));  //notes.forEach((note) => print(note));

//   final count = await db.getCount();
//   print('Count: $count');

//   print('=== getNote(2) ===');
//   final Sample note = await db.getSample(1);
//   print(note.toMap());

//   // print('=== updateNote[id:1] ===');
//   // final Sample updatedSample =
//   // Sample.fromMap({'id': 1, 'title': 'Flutter Tuts', 'description': 'Create SQLite Tut'});
//   // await db.updateSample(updatedSample);

//   // notes = await db.getAllSamples();
//   // notes.forEach((note) => print(note));

//   // print('=== deleteNote(2) ===');
//   // await db.deleteSample(2);
//   // notes = await db.getAllSamples();
//   // notes.forEach((note) => print(note));

//   await db.close();
// }
