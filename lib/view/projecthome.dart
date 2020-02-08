
import 'package:flutter/material.dart';
import 'package:sqfentity_sample/view/projects.dart';
import 'package:flare_flutter/flare_actor.dart';

/// This Widget is the main application widget.
class ProjectHome extends StatelessWidget {
  static const String _title = 'Quiknowte';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: _Home(),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class _Home extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                      margin: EdgeInsets.only(left: 75.0),
                      child: FlareActor(
                        'assets/img/quiknowte-name.flr',
                        animation: 'name',
                      ),
                    ),
                  ),
                  Container(
                    height: 400.0,
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
                                  builder: (context) => Projects()),
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
                            return null;
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
                            return null;
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
                                Icon(Icons.info,
                                    size: 60.0, color: Colors.white),
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
