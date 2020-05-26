import 'package:flutter/material.dart';
import 'package:quiknowte/screen_size.dart';
import 'package:quiknowte/view/dynamic.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:quiknowte/view/representation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'callfilemanager.dart';

/// This Widget is the main application widget.
class ProjectHome extends StatefulWidget {
  ProjectHome({@required this.ptime, @required this.pname, @required this.pid});
  final String ptime;
  final String pname;
  final int pid;

  @override
  State<StatefulWidget> createState() {
    return _ProjectHome(pTime: ptime, pName: pname, pId: pid);
  }
}

/// This is the stateless widget that the main application instantiates.
class _ProjectHome extends State<ProjectHome> {
  _ProjectHome(
      {@required this.pTime, @required this.pName, @required this.pId});
  final String pTime;
  final String pName;
  final int pId;

  Future projectDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance()
      ..setString('projectTime', pTime)
      ..setString('projectName', pName)
      ..setString('projectId', pId.toString());
  }

  @override
  void initState() {
    super.initState();
    projectDetails();
    
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(title: Text(pName)),
      body: SafeArea(
        child: GestureDetector(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bubble.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: SizeConfig.blockSizeVertical * 35,
                    margin: EdgeInsets.only(left: 75.0),
                    child: FlareActor(
                      'assets/img/quiknowte-name.flr',
                      animation: 'name',
                    ),
                  ),
                ),
                Container(
                  height: SizeConfig.blockSizeVertical * 65,
                  width: MediaQuery.of(context).size.width,
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    padding: const EdgeInsets.all(16.0),
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                    children: <Widget>[
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          topRight: Radius.circular(22.0),
                          bottomLeft: Radius.circular(22.0),
                          topLeft: Radius.circular(22.0),
                        )),
                        color: Colors.blueAccent,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Mydine(
                                      extended: pTime,
                                      text: pName,
                                      id: pId,
                                    )),
                          );
                        },
                        textColor: Colors.white,
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(22.0),
                              bottomLeft: Radius.circular(22.0),
                              topLeft: Radius.circular(22.0),
                            ),
                            image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                  Color.fromRGBO(255, 255, 255, 0.6),
                                  BlendMode.dstATop),
                              image: ExactAssetImage('assets/question.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: const <Widget>[
                              Spacer(flex: 1),
                              Icon(Icons.folder_special,
                                  size: 60.0, color: Colors.white),
                              Text(
                                'Data',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Spacer(flex: 1),
                            ],
                          ),
                        ),
                      ),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          topRight: Radius.circular(22.0),
                          bottomRight: Radius.circular(22.0),
                          topLeft: Radius.circular(22.0),
                        )),
                        color: Colors.black54,
                        onPressed: () {
                          Navigator.push(
                            context,
                            //  MaterialPageRoute(builder: (context) => Representation())
                             MaterialPageRoute(builder: (context) => Representation())
                             );
                        },
                        textColor: Colors.white,
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(22.0),
                              bottomRight: Radius.circular(22.0),
                              topLeft: Radius.circular(22.0),
                            ),
                            image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                  Color.fromRGBO(255, 255, 255, 0.6),
                                  BlendMode.dstATop),
                              image: ExactAssetImage('assets/blue.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: const <Widget>[
                              Spacer(flex: 1),
                              Icon(Icons.archive,
                                  size: 60.0, color: Colors.white),
                              Text(
                                'Representation',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Spacer(flex: 1),
                            ],
                          ),
                        ),
                      ),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(22.0),
                          bottomRight: Radius.circular(22.0),
                          topLeft: Radius.circular(22.0),
                        )),
                        color: Colors.greenAccent,
                        onPressed: () {
                          fileManagerMain();
                          // Navigator.push(
                          //   context, 
                          //   MaterialPageRoute(
                          //     builder: (context) => ChartView()
                          //     ));
                        },
                        textColor: Colors.white,
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(22.0),
                              bottomRight: Radius.circular(22.0),
                              topLeft: Radius.circular(22.0),
                            ),
                            image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                  Color.fromRGBO(255, 255, 255, 0.6),
                                  BlendMode.dstATop),
                              image: ExactAssetImage('assets/files.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: const <Widget>[
                              Spacer(flex: 1),
                              Icon(Icons.info, size: 60.0, color: Colors.white),
                              Text(
                                'Storage',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Spacer(flex: 1),
                            ],
                          ),
                        ),
                      ),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(22.0),
                          bottomRight: Radius.circular(22.0),
                          topRight: Radius.circular(22.0),
                        )),
                        color: Colors.lightBlueAccent,
                        onPressed: () {
                          return null;
                        },
                        textColor: Colors.white,
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(22.0),
                              bottomRight: Radius.circular(22.0),
                              topRight: Radius.circular(22.0),
                            ),
                            image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                  Color.fromRGBO(255, 255, 255, 0.6),
                                  BlendMode.dstATop),
                              image: ExactAssetImage('assets/wheel.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: const <Widget>[
                              Spacer(flex: 1),
                              Icon(Icons.settings,
                                  size: 60.0, color: Colors.white),
                              Text(
                                'Structure',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Spacer(flex: 1),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
