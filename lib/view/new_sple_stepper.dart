import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:quiknowte/model/dynsql.dart' as flex;
import 'package:quiknowte/view/tableList.dart';
import 'package:toast/toast.dart';

class NewSample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewSample();
  }
}

class _NewSample extends State<NewSample> {
  int _currentStep = 0;
  final _stepFormKey = GlobalKey<FormState>();
  final dy = flex.DatabaseHelper();
  TextEditingController _controllerSamples;
  TextEditingController _controllerConstants;
  TextEditingController _controllerVariables;
  String _constantType;
  String _variableType;
  List<String> samples = [];
  List<String> constants = [];
  List<String> variables = [];
  List<bool> groupVisible;
  int groups;
  int groupstage;

  @override
  void initState() {
    groupVisible = List.generate(3, (index) => false);
    groups = 0;
    groupstage = 0;
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    _controllerSamples = TextEditingController();
    _controllerConstants = TextEditingController();
    _controllerVariables = TextEditingController();
  }

  Widget _entityTile(String name, String display, dynamic entity) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(color: Colors.blue[300]),
            top: BorderSide(color: Colors.blue[300]),
            left: BorderSide(color: Colors.blue[300]),
            right: BorderSide(color: Colors.blue[300]),
          )),
          child: Padding(
            padding: EdgeInsets.all(3.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.close,
                    size: 20,
                  ),
                  onPressed: () => setState(() => entity.remove(name)),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text(
                    display,
                    textScaleFactor: 1.0,
                    style: TextStyle(fontSize: 16.0),
                  ),
                )
              ],
            ),
          )),
    );
  }

  Widget showGroups(int groups) {
    return Column(
      children: <Widget>[
        constants == null || constants.isEmpty
            ? Container(
                height: 0.0,
              )
            : Container(
                height: 90.0,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children:
                        List<Widget>.generate(constants.length, (int index) {
                      return _entityTile(
                          constants[index],
                          constants[index]
                              .substring(0, constants[index].indexOf(' ')),
                          constants);
                    }),
                  ),
                ),
              ),
        TextField(
          controller: _controllerConstants,
          decoration: InputDecoration(labelText: 'Variable name'),
          onChanged: (String value) => setState(() {}),
        ),
        SizedBox(height: 16),
        DropdownButtonFormField(
          iconSize: 30,
          value: _constantType,
          style: TextStyle(color: Colors.black, fontSize: 16),
          onChanged: (value) {
            setState(() {
              _constantType = value as String;
            });
          },
          hint: Text('Variable Type'),
          items: [
            DropdownMenuItem(value: ' TEXT', child: Text('Text')),
            DropdownMenuItem(value: ' REAL', child: Text('Number')),
            DropdownMenuItem(value: ' VARCHAR(100)', child: Text('Location')),
            DropdownMenuItem(value: ' DATETIME', child: Text('Date/Time')),
          ],
        ),
        Visibility(
          visible: groupVisible[groupstage],
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: <Widget>[
                  NumberPicker.integer(
                      initialValue: 0,
                      minValue: 0,
                      maxValue: 3,
                      onChanged: (value) => setState(() => groups = value)),
                  groups > 0 ? showGroups(groups) : Container()
                ],
              ),
            ),
          ),
        ),
        Center(
          child: IconButton(
            icon: Icon(Icons.add),
            tooltip: 'Add',
            onPressed: _controllerConstants.text.isEmpty
                ? null
                : () => setState(() {
                      constants.add(
                          _controllerConstants.text.toString() + _constantType);
                      _controllerConstants.clear();
                    }),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _stepFormKey,
      child: Stepper(
        type: StepperType.vertical,
        onStepContinue: _currentStep < 2
            ? () => setState(() => _currentStep += 1)
            : _currentStep < 3
                ? () => samples == null ||
                        samples.isEmpty ||
                        variables == null ||
                        variables.isEmpty
                    ? Toast.show(
                        'Sample Name and Variable List cannot be empty',
                        context,
                        duration: Toast.LENGTH_SHORT,
                        gravity: Toast.BOTTOM)
                    : dy.table(samples, constants, variables)
                : () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Samples())),

        // : null,
        onStepCancel:
            _currentStep > 0 ? () => setState(() => _currentStep -= 1) : null,
        currentStep: _currentStep,
        steps: <Step>[
          Step(
            title: Text('Samples Name'),
            subtitle: Text('Add samples with the same data structure!'),
            content: Column(
              children: <Widget>[
                samples == null || samples.isEmpty
                    ? Container(
                        height: 0.0,
                      )
                    : Container(
                        height: 90.0,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: List<Widget>.generate(samples.length,
                                (int index) {
                              return _entityTile(
                                  samples[index], samples[index], samples);
                            }),
                          ),
                        ),
                      ),
                ListTile(
                  // leading: Icon(Icons.people),
                  title: TextField(
                    controller: _controllerSamples,
                    decoration: InputDecoration(labelText: 'Add Sample'),
                    onChanged: (String value) => setState(() {}),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: _controllerSamples.text.isEmpty
                        ? null
                        : () => setState(() {
                              samples.add(_controllerSamples.text.toString());
                              _controllerSamples.clear();
                            }),
                  ),
                ),
              ],
            ),
            isActive: _currentStep >= 0,
            state: _currentStep >= 0 ? StepState.complete : StepState.disabled,
          ),
          Step(
            content: Column(
              children: <Widget>[
                constants == null || constants.isEmpty
                    ? Container(
                        height: 0.0,
                      )
                    : Container(
                        height: 90.0,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: List<Widget>.generate(constants.length,
                                (int index) {
                              return _entityTile(
                                  constants[index],
                                  constants[index].substring(
                                      0, constants[index].indexOf(' ')),
                                  constants);
                            }),
                          ),
                        ),
                      ),
                TextField(
                  controller: _controllerConstants,
                  decoration: InputDecoration(labelText: 'Constant name'),
                  onChanged: (String value) => setState(() {}),
                ),
                SizedBox(height: 16),
                DropdownButtonFormField(
                  iconSize: 30,
                  value: _constantType,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  onChanged: (value) {
                    setState(() {
                      _constantType = value as String;
                    });
                  },
                  hint: Text('Constant Type'),
                  items: [
                    DropdownMenuItem(value: ' TEXT', child: Text('Text')),
                    DropdownMenuItem(value: ' REAL', child: Text('Number')),
                    DropdownMenuItem(
                        value: ' DATETIME', child: Text('Date/Time')),
                  ],
                ),
                Center(
                  child: IconButton(
                    icon: Icon(Icons.add),
                    tooltip: 'Add',
                    onPressed: _controllerConstants.text.isEmpty
                        ? null
                        : () => setState(() {
                              constants.add(
                                  _controllerConstants.text.toString() +
                                      _constantType);
                              _controllerConstants.clear();
                            }),
                  ),
                ),
              ],
            ),
            title: Text('Constant'),
            subtitle: Text('Add constant entities to the sample(s)'),
            isActive: _currentStep >= 0,
            state: _currentStep >= 1 ? StepState.complete : StepState.disabled,
          ),
          Step(
            content: Column(
              children: <Widget>[
                variables == null || variables.isEmpty
                    ? Container(
                        height: 0.0,
                      )
                    : Container(
                        height: 90.0,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: List<Widget>.generate(variables.length,
                                (int index) {
                              return _entityTile(
                                  variables[index],
                                  variables[index].substring(
                                      0, variables[index].indexOf(' ')),
                                  variables);
                            }),
                          ),
                        ),
                      ),
                TextField(
                  controller: _controllerVariables,
                  decoration: InputDecoration(labelText: 'Variable name'),
                  onChanged: (String value) => setState(() {}),
                ),
                SizedBox(height: 16),
                DropdownButtonFormField(
                  iconSize: 30,
                  value: _variableType,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  onChanged: (value) {
                    _variableType == ' VARCHAR(100)'
                        ? setState(() {
                            groupVisible[groupstage] = true;
                            groupstage++;
                          })
                        : setState(() {
                            _variableType = value as String;
                          });
                  },
                  hint: Text('Variable Type'),
                  items: [
                    DropdownMenuItem(value: ' TEXT', child: Text('Text')),
                    DropdownMenuItem(value: ' REAL', child: Text('Number')),
                    // DropdownMenuItem(value: ' BLOB', child: Text('Group')),
                    DropdownMenuItem(
                        value: ' VARCHAR(100)', child: Text('Location')),
                    DropdownMenuItem(
                        value: ' VARCHAR(120)', child: Text('Audio')),
                    DropdownMenuItem(
                        value: ' VARCHAR(127)', child: Text('Image')),
                    DropdownMenuItem(
                        value: ' VARCHAR(132)', child: Text('video')),
                    DropdownMenuItem(
                        value: ' DATETIME', child: Text('Date/Time')),
                  ],
                ),
                Visibility(
                  visible: groupVisible[groupstage],
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                        children: <Widget>[
                          NumberPicker.integer(
                              initialValue: 0,
                              minValue: 0,
                              maxValue: 3,
                              onChanged: (value) =>
                                  setState(() => groups = value)),
                          groups > 0 ? showGroups(groups) : Container()
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: IconButton(
                    icon: Icon(Icons.add),
                    tooltip: 'Add',
                    onPressed: _controllerVariables.text.isEmpty
                        ? null
                        : () => setState(() {
                              groupstage = 0;
                              variables.add(
                                  _controllerVariables.text.toString() +
                                      _variableType);
                              _controllerVariables.clear();
                            }),
                  ),
                ),
              ],
            ),
            title: Text('Variables'),
            subtitle: Text('Add dynamic entities to the sample(s)'),
            isActive: _currentStep >= 0,
            state: _currentStep >= 2 ? StepState.complete : StepState.disabled,
          ),
        ],
      ),
    );
  }
}
