import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:quiknowte/view/dataAdd/model/app_state.dart';
import 'package:quiknowte/view/dataAdd/redux/actions.dart';
import 'package:quiknowte/view/dataAdd/redux/reducers.dart';
import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:quiknowte/model/dynsql.dart' as flex;
import '../../screen_size.dart';

class DataAdd extends StatefulWidget {
  final Store<AppState> store = Store<AppState>(
    reducer,
    initialState: AppState.initial(),
  );
  @override
  State<StatefulWidget> createState() {
    return _DataAdd(store: store);
  }
}

class _DataAdd extends State<DataAdd> {
  _DataAdd({this.store});
  final Store<AppState> store;
  String currentTable;
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

  @override
  void initState() {
    dbTableName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final TextStyle valueStyle = Theme.of(context).textTheme.bodyText2;
    return StoreProvider<AppState>(
      store: store,
      child: Scaffold(
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(40.0)),
                            color: Colors.white,
                          ),
                          child: ListView.builder(
                              itemCount: snapshot.data == null
                                  ? 0
                                  : snapshot.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  child:
                                      snapshot.data[index]['name'].toString() ==
                                              'Id'
                                          ? null
                                          : Column(
                                              children: <Widget>[
                                                Container(
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal: 20.0),
                                                    child:
                                                        snapshot.data[index]
                                                                        ['type']
                                                                    .toString() ==
                                                                'DATETIME'
                                                            ? StoreConnector<
                                                                    AppState,
                                                                    String>(
                                                                converter: (Store<
                                                                            AppState>
                                                                        store) =>
                                                                    store.state
                                                                        .date,
                                                                builder: (BuildContext
                                                                        context,
                                                                    String
                                                                        date) {
                                                                  return RaisedButton(
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(5.0)),
                                                                    elevation:
                                                                        4.0,
                                                                    onPressed:
                                                                        () {
                                                                      DatePicker.showDatePicker(
                                                                          context,
                                                                          theme:
                                                                              DatePickerTheme(
                                                                            containerHeight:
                                                                                210.0,
                                                                          ),
                                                                          showTitleActions:
                                                                              true,
                                                                          minTime: DateTime(
                                                                              2000,
                                                                              1,
                                                                              1),
                                                                          maxTime: DateTime(
                                                                              2022,
                                                                              12,
                                                                              31),
                                                                          onConfirm:
                                                                              (date) {
                                                                        print(
                                                                            'confirm $date');
                                                                        inputVal[index] =
                                                                            '${date.year} - ${date.month} - ${date.day}';
                                                                        StoreProvider.of<AppState>(context).dispatch(DatePick(
                                                                            date:
                                                                                date));
                                                                      },
                                                                          currentTime: DateTime
                                                                              .now(),
                                                                          locale:
                                                                              LocaleType.en);
                                                                      print(
                                                                          'TTTTTTTTTTTTTTTT');
                                                                      print(inputVal[
                                                                          index]);
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      height:
                                                                          50.0,
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: <
                                                                            Widget>[
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
                                                                                      StoreProvider.of<AppState>(context).state.date,
                                                                                      style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold, fontSize: 18.0),
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
                                                                    color: Colors
                                                                        .white,
                                                                  );
                                                                })
                                                            : TextFormField(
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .blue),
                                                                onChanged:
                                                                    (value) {
                                                                  // if (snapshot.data[index]
                                                                  //             ['type']
                                                                  //         .toString() !=
                                                                  //     'DATETIME') {
                                                                  inputVal[
                                                                          index] =
                                                                      value;
                                                                  // }
                                                                },
                                                                onTap: snapshot
                                                                            .data[index]['type']
                                                                            .toString() ==
                                                                        'DATETIME'
                                                                    ? () {
                                                                        showDatePicker(
                                                                          context:
                                                                              context,
                                                                          initialDate:
                                                                              DateTime.now(),
                                                                          firstDate:
                                                                              DateTime(1900),
                                                                          lastDate:
                                                                              DateTime(2100),
                                                                          locale:
                                                                              Locale('en'),
                                                                        ).then(
                                                                            (val) {
                                                                          inputVal[index] =
                                                                              '${val.day.toString()}-${val.month.toString().padLeft(2, '0')}-${val.year.toString().padLeft(2, '0')}';
                                                                          print(
                                                                              'MMMMMMMM>>>>>>>>>MMMMMMM');
                                                                          print(
                                                                              val);
                                                                          print(
                                                                              inputVal[index]);
                                                                        });
                                                                      }
                                                                    : null,
                                                                keyboardType: snapshot
                                                                            .data[index][
                                                                                'type']
                                                                            .toString() ==
                                                                        'TEXT'
                                                                    ? TextInputType
                                                                        .text
                                                                    : snapshot.data[index]['type'].toString() ==
                                                                            'DATETIME'
                                                                        ? null
                                                                        : snapshot.data[index]['type'].toString() ==
                                                                                'REAL'
                                                                            ? TextInputType.number
                                                                            : TextInputType.text,
                                                                decoration:
                                                                    InputDecoration(
                                                                        hintText: snapshot.data[index]['type'].toString() ==
                                                                                'DATETIME'
                                                                            ? inputVal[index] == null
                                                                                ? snapshot.data[index]['name']
                                                                                    .toString()
                                                                                : inputVal[index]
                                                                                    .toString()
                                                                            : snapshot.data[index]['name']
                                                                                .toString(),
                                                                        hintStyle: TextStyle(
                                                                            color: Colors
                                                                                .blue.shade500),
                                                                        border: InputBorder
                                                                            .none,
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .check,
                                                                          color:
                                                                              Colors.blue,
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
                              for (int i = 0;
                                  i < snapshot.data.length - 1;
                                  i++) {
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
      ),
    );
  }
}
