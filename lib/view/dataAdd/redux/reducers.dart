import 'package:geolocator/geolocator.dart';
import 'package:quiknowte/view/dataAdd/model/app_state.dart';
import 'package:quiknowte/view/dataAdd/redux/actions.dart';
import 'package:quiknowte/model/dynsql.dart' as flex;

AppState reducer(AppState prev, dynamic action) {
  if (action is InitInputVals) {
    prev.inputVal = List(action.num - 1);
  } else if (action is Location) {
    Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((cordinates) {
      prev.location = cordinates;
      print('______________________________________________________________');
      print(cordinates);
      print('______________________________________________________________');
    });
  } else if (action is DatePick) {
    prev.date = '${action.date.year}-${action.date.month}-${action.date.day}';
  } else if (action is InputVal) {
    prev.inputVal = List(action.inputLength);
  } else if (action is InputValChange) {
    prev.inputVal.add({action.key: action.val});
  } else if (action is Submit) {
    flex.DatabaseHelper()
        .saveTabVal(action.currentTable, action.columns, prev.inputVal);
    print('KKKKK<<<<<<<<>>>>>>>>>>>KKKK');
    print(prev.currentTable);
    print(prev.columns.toString());
    print(prev.inputVal.toString());
    print('KKKKK<<<<<<<<>>>>>>>>>>>KKKK');
  }

  return prev;
}
