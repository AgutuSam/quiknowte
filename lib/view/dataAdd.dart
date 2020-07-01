import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
// import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quiknowte/model/dynsql.dart' as flex;
// import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import '../screen_size.dart';
// import 'package:quiknowte/samples/psamples.dart';
// import 'package:intl/intl.dart';

class DataAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DataAdd();
  }
}

class _DataAdd extends State<DataAdd> {
  String currentTable;
  String _date;
  // final format = DateFormat('yyyy-MM-dd');
  List inputVal;
  final _formKey = GlobalKey();
  String labelText;
  DateTime selectedDate;
  TimeOfDay selectedTime;
  ValueChanged<DateTime> selectDate;
  ValueChanged<TimeOfDay> selectTime;

  Future dbTableName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    currentTable = prefs.getString('dbTable');
  }

  Future<List<Map>> fetchFromTable() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    currentTable = prefs.getString('dbTable');
    return flex.DatabaseHelper().getTableInfo(currentTable);
  }

  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime picked = await showDatePicker(
  //       context: context,
  //       initialDate: selectedDate,
  //       firstDate: DateTime(1970, 8),
  //       lastDate:  DateTime(2101));
  //   if (picked != null && picked != selectedDate) selectDate(picked);
  // }

  @override
  void initState() {
    dbTableName();
    _date = 'Not set';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final TextStyle valueStyle = Theme.of(context).textTheme.bodyText2;
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: SingleChildScrollView(
        child: FutureBuilder<List<Map>>(
            future: fetchFromTable(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                inputVal = List(snapshot.data.length);
                return Container(
                  padding: EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(children: <Widget>[
                      Container(
                        height: SizeConfig.blockSizeVertical * 50,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          color: Colors.white,
                        ),
                        child: ListView.builder(
                            itemCount: snapshot.data == null
                                ? 0
                                : snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                child: snapshot.data[index]['name']
                                            .toString() ==
                                        'Id'
                                    ? null
                                    : Column(
                                        children: <Widget>[
                                          Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.0),
                                              child: snapshot.data[index]
                                                                ['type']
                                                            .toString() ==
                                                        'DATETIME'
                                                         ? RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                elevation: 4.0,
                onPressed: () {
                  DatePicker.showDatePicker(context,
                      theme: DatePickerTheme(
                        containerHeight: 210.0,
                      ),
                      showTitleActions: true,
                      minTime: DateTime(2000, 1, 1),
                      maxTime: DateTime(2022, 12, 31), 
                      onConfirm: (date) {
                    print('confirm $date');
                    // _date = '${date.year}-${date.month}-${date.day}';
                    inputVal[index] = '${date.year} - ${date.month} - ${date.day}';
                    // setState(() {
                      _date = '${date.year}-${date.month}-${date.day}';
                      inputVal[index] = '${date.year} - ${date.month} - ${date.day}';
                    // });
                  }, currentTime: DateTime.now(), locale: LocaleType.en);
                  // setState(() {});
                  print('TTTTTTTTTTTTTTTT');
                  print(inputVal[index]);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.date_range,
                                  size: 18.0,
                                  color: Colors.teal,
                                ),
                                Text(
                                  '$_date' 
                                  ,
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Text(
                        '  Change',
                        style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                    ],
                  ),
                ),
                color: Colors.white,
              )
                                                         : 
                                                         TextFormField(
                                                style: TextStyle(
                                                    color: Colors.blue),
                                                onChanged: (value) {
                                                  // if (snapshot.data[index]
                                                  //             ['type']
                                                  //         .toString() !=
                                                  //     'DATETIME') {
                                                    inputVal[index] = value;
                                                  // }
                                                },
                                                onTap: snapshot.data[index]
                                                                ['type']
                                                            .toString() ==
                                                        'DATETIME'
                                                    ? () {
                                                        showDatePicker(
                                                          context: context,
                                                          initialDate:
                                                              DateTime.now(),
                                                          firstDate:
                                                              DateTime(1900),
                                                          lastDate:
                                                              DateTime(2100),
                                                          locale: Locale('en'),
                                                        ).then((val) {
                                                          inputVal[index] =
                                                              '${val.day.toString()}-${val.month.toString().padLeft(2, '0')}-${val.year.toString().padLeft(2, '0')}';
                                                          print(
                                                              'MMMMMMMM>>>>>>>>>MMMMMMM');
                                                          print(val);
                                                          print(
                                                              inputVal[index]);
                                                        });
                                                      }
                                                    : null,
                                                keyboardType: snapshot
                                                            .data[index]['type']
                                                            .toString() ==
                                                        'TEXT'
                                                    ? TextInputType.text
                                                    : snapshot.data[index]
                                                                    ['type']
                                                                .toString() ==
                                                            'DATETIME'
                                                        ? null
                                                        : snapshot.data[index]
                                                                        ['type']
                                                                    .toString() ==
                                                                'REAL'
                                                            ? TextInputType
                                                                .number
                                                            : TextInputType
                                                                .text,
                                                decoration: InputDecoration(
                                                    hintText: snapshot
                                                                .data[index]
                                                                    ['type']
                                                                .toString() ==
                                                            'DATETIME'
                                                        ? inputVal[index] == null
                                                            ? snapshot
                                                                .data[index]
                                                                    ['name']
                                                                .toString()
                                                            :  inputVal[index]
                                                                .toString()
                                                        : snapshot.data[index]
                                                                ['name']
                                                            .toString(),
                                                    hintStyle: TextStyle(
                                                        color: Colors
                                                            .blue.shade500),
                                                    border: InputBorder.none,
                                                    icon: Icon(
                                                      Icons.check,
                                                      color: Colors.blue,
                                                    )),
                                              )),
                                          Container(
                                            child: Divider(
                                              color: Colors.blue.shade400,
                                            ),
                                            padding: EdgeInsets.only(
                                                left: 20.0,
                                                right: 20.0,
                                                bottom: 10.0),
                                          ),
                                        ],
                                      ),
                              );
                            }),
                      ),
                      Center(
                        child: MaterialButton(
                          child: Text('Submit'),
                          color: Colors.cyan,
                          elevation: 8,
                          highlightElevation: 4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0)),
                          onPressed: () {
                            final List<dynamic> cols = [];
                            final List<dynamic> vals = [];
                            for (int i = 0; i < snapshot.data.length - 1; i++) {
                              cols.add(snapshot.data[i]['name']);
                              vals.add(inputVal[i]);
                            }
                            print('KKKKK<<<<<<<<>>>>>>>>>>>KKKK');
                            print(currentTable);
                            print(cols);
                            print(vals);
                            flex.DatabaseHelper()
                                .saveTabVal(currentTable, cols, vals);
                          },
                        ),
                      ),
                    ]),
                  ),
                );

                //
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return Container(
                alignment: AlignmentDirectional.center,
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }

  // Widget datetimepicker() {
  //   showDatePicker(
  //       context: context,
  //       initialDate: DateTime.now(),
  //       firstDate: DateTime(1900),
  //       lastDate: DateTime(2100));
  // }
}

// class _InputDropdown extends StatelessWidget {
//   const _InputDropdown(
//       {Key key,
//       this.child,
//       this.labelText,
//       this.valueText,
//       this.valueStyle,
//       this.onPressed})
//       : super(key: key);

//   final String labelText;
//   final String valueText;
//   final TextStyle valueStyle;
//   final VoidCallback onPressed;
//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onPressed,
//       child:  InputDecorator(
//         decoration:  InputDecoration(
//           labelText: labelText,
//         ),
//         baseStyle: valueStyle,
//         child:  Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//              Text(valueText, style: valueStyle),
//              Icon(Icons.arrow_drop_down,
//                 color: Theme.of(context).brightness == Brightness.light
//                     ? Colors.grey.shade700
//                     : Colors.white70),
//           ],
//         ),
//       ),
//     );
//   }
// }