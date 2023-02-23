import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'utils.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  ListScreenState createState() => ListScreenState();
}

class ListScreenState extends State<ListScreen> {
  late final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  List<dynamic> entries = <Map<String, dynamic>>[];

  Future<void> init() async {
    SharedPreferences prefs = await _prefs;
    await prefs.setStringList('items', <String>[
      '{"name":"Hachiban", "price":"1000", "date":"1.1.20", "is_income":"true"}',
      '{"name":"Food", "price":"1000.5", "date":"1.1.20", "is_income":"false"}',
      '{"name":"Asset", "price":"1000", "date":"1.1.20", "is_income":"true"}'
    ]);
    List<String> get_list = prefs.getStringList('items') ?? [];
    entries = get_list.map((x) => json.decode(x)).toList();
    print(entries[0]['is_income'].runtimeType);
  }

  String total = "0";

  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).padding;
    double baseWidth = MediaQuery.of(context).size.width - padding.top - padding.bottom;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.96;
    return FutureBuilder(
      future: init(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        return Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.fromLTRB(10 * fem, 10 * fem, 10 * fem, 10 * fem),
                padding: EdgeInsets.fromLTRB(7.01 * fem, 7 * fem, 14 * fem, 5.88 * fem),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0x7fd9d9d9),
                  borderRadius: BorderRadius.circular(5 * fem),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 17.66 * fem, 0 * fem),
                      width: 38.08 * fem,
                      height: 41.12 * fem,
                      child: Image.asset(
                        'assets/home-screen/images/auto-group-${ entries[index]['is_income'] == "true" ? "to3d" : "dd6w"}.png', // auto-group-dd6w.png
                        width: 38.08 * fem,
                        height: 41.12 * fem,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 6.75 * fem, 0 * fem),
                      width: 18 * fem,
                      height: 18 * fem,
                      child: Image.asset(
                        'assets/home-screen/images/thailand-baht.png',
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 114 * fem, 0 * fem),
                      child: Text(
                        '${entries[index]['price']}',
                        style: SafeGoogleFont(
                          'Inter',
                          fontSize: 22 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.2125 * ffem / fem,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 2.12 * fem),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              '${entries[index]['name']}\n',
                              style: SafeGoogleFont(
                                'Inter',
                                fontSize: 14 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.2125 * ffem / fem,
                                color: Color(0xff757373),
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
