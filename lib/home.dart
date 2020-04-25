import 'package:flutter/material.dart';
import 'package:quiknowte/utils/navbar1.dart';
import 'package:quiknowte/view/newproject.dart';
import 'package:quiknowte/view/projects.dart';

class StartHomePage extends StatelessWidget {
  static final String path = 'lib/src/pages/todo/todo_home1.dart';
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  final Color color1 = Color(0xffFA696C);
  final Color color2 = Color(0xffFA8165);
  final Color color3 = Color(0xffFB8964);
  final Color primary = Colors.white;
  final Color active = Colors.grey.shade800;
  final Color divider = Colors.grey.shade600;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      key: _key,
      drawer: NavBar1(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildHeader(),
            SizedBox(height: 15.0),
            Container(
              height: 450.0,
              width: MediaQuery.of(context).size.width,
              child: GridView.count(
                crossAxisCount: 1,
                childAspectRatio: 2.5,
                padding: const EdgeInsets.all(16.0),
                mainAxisSpacing: 15.0,
                crossAxisSpacing: 15.0,
                children: <Widget>[
                  RaisedButton(
                    elevation: 2.0,
                    highlightElevation: 2.0,
                    onPressed: () {
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewProject()),
                            );
                                          },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.white,
                    textColor: Colors.white70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.create_new_folder, color: Colors.black45, size: 32),
                        SizedBox(height: 5.0),
                        Text(
                          'Create New Project',
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          style: TextStyle(
                            color: Colors.black45,
                      fontSize: 32.0,
                      fontWeight: FontWeight.w700
                          ),
                        ),
                      ],
                    ),
                  ),
                  RaisedButton(
                    elevation: 2.0,
                    highlightElevation: 2.0,
                    onPressed: () {
                       Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Projects()));
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.white,
                    textColor: Colors.white70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.dashboard, color: Colors.black45, size: 32),
                        SizedBox(height: 5.0),
                        Text(
                          'View Projects',
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          style: TextStyle(
                            color: Colors.black45,
                      fontSize: 32.0,
                      fontWeight: FontWeight.w700
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Container(
            //       height: 450.0,
            //       width: MediaQuery.of(context).size.width,
            //   child: OverflowBox(
            //     maxWidth: MediaQuery.of(context).size.width,
            //     alignment: Alignment.centerLeft,
            //     child: Row(
            //       children: <Widget>[
            //         Card(
            //         elevation: 5.0,
            //         margin: const EdgeInsets.symmetric(
            //             horizontal: 16.0, vertical: 8.0),
            //         child: Padding(
            //           padding: const EdgeInsets.all(16.0),
            //           child: Row(children: [
            //             Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: <Widget>[
            //                 Text('Birthday Party'),
            //                 Text('Event Name'),
            //               ],
            //             ),
            //             Spacer(),
            //             Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               mainAxisSize: MainAxisSize.min,
            //               children: <Widget>[
            //                 Text('2019/3/4'),
            //                 Text('Event Date')
            //               ],
            //             ),
            //           ]),
            //         ),
            //       ),

            //       ],
            //     ),
            //   ),
            // ),
            SizedBox(height: 30.0),
          ],
        ),
      ),
    );
  }

  Container _buildHeader() {
    return Container(
      height: 270,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            left: -100,
            top: -150,
            child: Container(
              width: 350,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      // colors: [color1, color2]
                      colors: [Colors.blueGrey, Colors.cyan]),
                  boxShadow: [
                    BoxShadow(
                        color: color2,
                        offset: Offset(4.0, 4.0),
                        blurRadius: 10.0)
                  ]),
            ),
          ),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    // colors: [color3,color2]
                    colors: [Colors.cyan, Colors.blueGrey]),
                boxShadow: [
                  BoxShadow(
                      color: color3, offset: Offset(1.0, 1.0), blurRadius: 4.0)
                ]),
          ),
          Positioned(
            top: 100,
            right: 200,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      // colors: [color3,color2]
                      colors: [Colors.deepPurple.shade200, Colors.blueGrey]),
                  boxShadow: [
                    BoxShadow(
                        color: color3,
                        offset: Offset(1.0, 1.0),
                        blurRadius: 4.0)
                  ]),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30, left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.menu, color: Colors.white, size: 32),
                  onPressed: () {
                    _key.currentState.openDrawer();
                  },
                ),
                Text(
                  'Quiknowte',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 32.0,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Record.\tDisplay.\tStore.\tShare.',
                  style: TextStyle(color: Colors.white, fontSize: 14.0),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
