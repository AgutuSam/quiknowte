import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:quiknowte/samples/common.dart';
import 'package:quiknowte/view/file_manager.dart';

void fileManagerMain() {
  WidgetsFlutterBinding.ensureInitialized();
  Future<void> getSDCardDir() async {
    // Common().sDCardDir = (await getExternalStorageDirectory()).path;
    Common().sDCardDir = (Directory('/data/user/0/com.example.sqfentity/files/')).path;
  }

  // Permission check
  Future<void> getPermission() async {
    if (Platform.isAndroid) {
      final PermissionStatus permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
      if (permission != PermissionStatus.granted) {
        await PermissionHandler().requestPermissions([PermissionGroup.storage]);
      }
      await getSDCardDir();
    } else if (Platform.isIOS) {
      await getSDCardDir();
    }
  }

  Future.wait([initializeDateFormatting('zh_CN', null), getPermission()]).then((result) {
    runApp(CallFileManager());
  });
}

class CallFileManager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiknowte File Manager',
      theme: ThemeData(
//        platform: TargetPlatform.iOS,
        primarySwatch: Colors.blue,
      ),
      home: FileManager(),
    );
  }
}
