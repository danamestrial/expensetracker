import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'utils.dart';

const List<String> list = <String>['Food', 'Drinks', 'Alcohol', 'Clothes', 'Travels'];

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  AddScreenState createState() => AddScreenState();
}

class AddScreenState extends State<AddScreen> {
  double total = 0;
  String dropdownValue = list.first;
  late final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Map<String, dynamic> map = {"name": list.first, "description":"", "price": 0, "is_income":false, "date":DateTime.now()};

  Future<bool> save() async {
    try {
      SharedPreferences prefs = await _prefs;
      List<String> getList = prefs.getStringList('items') ?? [];
      String strMap = json.encode(map.map((key, value) => MapEntry(key, value.toString())));
      // print(strMap);
      getList.insert(0, strMap);
      await prefs.setStringList('items', getList);
      print(getList);
      Navigator.pushNamed(context, '/');
      return true;
    } catch(e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).padding;
    double baseWidth = MediaQuery.of(context).size.width - padding.top - padding.bottom;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.96;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              child: Container(
                padding: EdgeInsets.fromLTRB(0 * fem, 19 * fem, 0 * fem, 0 * fem),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  gradient: LinearGradient(
                    begin: Alignment(0.056, -0.853),
                    end: Alignment(-0.043, 1.596),
                    colors: <Color>[Color(0xfffff6e5), Color(0x00f7ecd7)],
                    stops: <double>[0, 0.989],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(60 * fem),
                    bottomLeft: Radius.circular(60 * fem),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // frame78yQL (6:1060)
                      margin: EdgeInsets.fromLTRB(9 * fem, 0 * fem, 8 * fem, 10 * fem),
                      padding: EdgeInsets.fromLTRB(4 * fem, 0 * fem, 4.99 * fem, 0 * fem),
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_left),
                            onPressed: () {
                              Navigator.pushNamed(context, "/");
                            },
                          ),
                          Center(
                            child: Text(
                              'Add Transaction',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'Inter',
                                fontSize: 18 * ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.2125 * ffem / fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(21 * fem, 0 * fem, 0 * fem, 17 * fem),
                      child: Text(
                        'How much?',
                        style: SafeGoogleFont(
                          'Inter',
                          fontSize: 18 * ffem,
                          fontWeight: FontWeight.w600,
                          height: 1.2125 * ffem / fem,
                          color: Color(0xff090000),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(21 * fem, 0 * fem, 165 * fem, 24 * fem),
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0 * fem, 2 * fem, 5 * fem, 0 * fem),
                            width: 34 * fem,
                            height: 37 * fem,
                            child: Image.asset(
                              'assets/home-screen/images/thailand-baht.png',
                              width: 34 * fem,
                              height: 37 * fem,
                            ),
                          ),
                          Expanded(
                              child:  Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextField(
                                    autofocus: true,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none
                                    ),
                                    onChanged: (value) {
                                      total = double.parse(value != ''?value:'0.0');
                                      map['price'] = total;
                                    },
                                    style: SafeGoogleFont(
                                      'Inter',
                                      fontSize: 35 * ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.2125 * ffem / fem,
                                    ),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]+[.]{0,1}[0-9]*')),
                                    ], // Only numbers can be entered
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 15 * fem),
                      padding: EdgeInsets.fromLTRB(0 * fem, 42 * fem, 0 * fem, 40 * fem),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xfffcfcfc),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50 * fem),
                          topRight: Radius.circular(50 * fem),
                          bottomLeft: Radius.circular(50 * fem),
                          bottomRight: Radius.circular(50 * fem),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(3 * fem, 0 * fem, 0 * fem, 37 * fem),
                            padding: EdgeInsets.fromLTRB(16 * fem, 12.5 * fem, 16 * fem, 12.5 * fem),
                            width: 330 * fem,
                            height: 57 * fem,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff25255c)),
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(16 * fem),
                            ),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(0 * fem, 7 * fem, 6.57 * fem, 7 * fem),
                              width: double.infinity,
                              height: double.infinity,
                              child: DropdownButton<String>(
                                menuMaxHeight: 200,
                                borderRadius: BorderRadius.circular(16 * fem),
                                underline: Container(),
                                isExpanded: true,
                                value: dropdownValue,
                                icon: const Icon(Icons.arrow_downward),
                                elevation: 16,
                                onChanged: (String? value) {
                                  // This is called when the user selects an item.
                                  setState(() {
                                    dropdownValue = value ?? 'Boom';
                                    map['name'] = value ?? 'Boom';
                                  });
                                },
                                items: list.map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(3 * fem, 0 * fem, 0 * fem, 24 * fem),
                            padding: EdgeInsets.fromLTRB(16 * fem, 12.5 * fem, 16 * fem, 12.5 * fem),
                            width: 332 * fem,
                            height: 57 * fem,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff262653)),
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(16 * fem),
                            ),
                            child: Container(
                              // padding: EdgeInsets.fromLTRB(0 * fem, 7 * fem, 6.57 * fem, 7 * fem),
                              width: double.infinity,
                              height: double.infinity,
                              child: TextField(
                                decoration: const InputDecoration(
                                    border: InputBorder.none
                                ),
                                onChanged: (value) {
                                  map['description'] = value;
                                },
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 20 * ffem,
                                  fontWeight: FontWeight.w600,
                                  // height: 1 * ffem / fem,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(16 * fem, 0 * fem, 16 * fem, 24 * fem),
                            width: double.infinity,
                            // height: 25 * fem,
                            child: ToggleSwitch(
                              minWidth: double.infinity,
                              cornerRadius: 20.0,
                              initialLabelIndex: 1,
                              totalSwitches: 2,
                              labels: ['Income', 'Expense'],
                              activeBgColors: [[Colors.green],[Colors.red]],
                              onToggle: (index) {
                                map['is_income'] = index == 0;
                                // print(map['is_income']);
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 3 * fem, 0 * fem),
                            width: 332 * fem,
                            height: 120 * fem,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff25255c)),
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(16 * fem),
                            ),
                            child: CupertinoDatePicker(
                              mode: CupertinoDatePickerMode.dateAndTime,
                              initialDateTime: DateTime.now(),
                              onDateTimeChanged: (DateTime newDateTime) {
                                map['date'] = newDateTime.toString();
                                // print(map['date']);
                              },
                              use24hFormat: false,
                              minuteInterval: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        await save();
                      },
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10 * fem, 0 * fem, 10 * fem, 0 * fem),
                        width: double.infinity,
                        height: 56 * fem,
                        decoration: BoxDecoration(
                          color: Color(0xff7e3dff),
                          borderRadius: BorderRadius.circular(16 * fem),
                        ),
                        child: Center(
                          child: Text(
                            'Continue',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Inter',
                              fontSize: 18 * ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.2125 * ffem / fem,
                              color: Color(0xfffbfbfb),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}
