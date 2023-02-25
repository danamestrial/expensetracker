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
    List<String> getList = prefs.getStringList('items') ?? [];
    entries = getList.map((x) => json.decode(x)).toList();
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 18 * fem,
                              height: 18 * fem,
                              child: Image.asset(
                                'assets/home-screen/images/thailand-baht.png',
                              ),
                            ),
                            Text(
                              '${entries[index]['price']}',
                              style: SafeGoogleFont(
                                'Inter',
                                fontSize: 22 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.2125 * ffem / fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5 * fem),
                          child: Text(
                            '${DateTime.parse(entries[index]['date'])}',
                            textAlign: TextAlign.left,
                            style: SafeGoogleFont(
                              'Inter',
                              fontSize: 14 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1 * ffem / fem,
                              color: Color(0xff757373),
                            ),
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 8 * fem),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '${entries[index]['name']}\n',
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 14 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1 * ffem / fem,
                                  ),
                                ),
                              )
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 8 * fem),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '${entries[index]['description']}',
                                  style: SafeGoogleFont(
                                    'Inter',
                                    fontSize: 14 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1 * ffem / fem,
                                    color: Color(0xff757373),
                                  ),
                                ),
                              )
                            )
                          ],
                        )
                      ),
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
