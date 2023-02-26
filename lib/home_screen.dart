import 'dart:convert';
import 'utils.dart';
import 'list.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  double baseIncome = 0;
  double expenses = 0;
  double balance = 0;

  Future<ListScreen> init() async {
    await reset();

    SharedPreferences prefs = await _prefs;
    baseIncome = (prefs.getDouble('income') ?? baseIncome);
    List<String> getList = prefs.getStringList('items') ?? [];
    if (getList.isNotEmpty) {
      List<dynamic> entries = getList.map((x) => json.decode(x)).toList();
      expenses = entries
          .map((e) => e['is_income'] == 'false' ? double.parse(e['price']) : double.parse("-${e['price']}"))
          .reduce((value, element) => value + element)
          .toDouble();
    } else {
      expenses = 0;
    }
    balance = baseIncome - expenses;
    return ListScreen(update: (){setState(() {});});
  }

  Future<void> saveIncome(double value) async {
    SharedPreferences prefs = await _prefs;
    await prefs.setDouble('income', value);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).padding;
    double baseWidth = MediaQuery.of(context).size.width - padding.top - padding.bottom;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.96;

    return Scaffold(
        body: SafeArea(
      child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xffa79696),
          ),
          child: FutureBuilder(
            future: init(),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData) {
                return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(18 * fem, 22 * fem, 21 * fem, 36 * fem),
                    width: double.infinity,
                    height: 351 * fem,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment(0.056, -0.853),
                        end: Alignment(-0.043, 1.596),
                        colors: <Color>[Color(0xfffff6e5), Color(0x00f7ecd7)],
                        stops: <double>[0, 0.989],
                      ),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(32 * fem),
                        bottomLeft: Radius.circular(32 * fem),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.menu,
                                color: Colors.deepPurple,
                              ),
                              iconSize: 48 * fem,
                              onPressed: () {
                                Navigator.pushNamed(context, "/list");
                              },
                            ),
                            const Spacer(),
                            IconButton(
                              icon: Image.asset(
                                'assets/home-screen/images/add-mZr.png',
                              ),
                              iconSize: 42 * fem,
                              onPressed: () {
                                Navigator.pushNamed(context, "/add");
                              },
                            )
                          ],
                        ),
                        Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                          Container(
                            margin: EdgeInsets.only(top: 19, bottom: 40),
                            child: Center(
                                child: Column(
                              children: [
                                const Text(
                                  "Balance",
                                  style: TextStyle(fontSize: 18, color: Colors.grey),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${balance < 0 && balance > -1 ? "-${balance.truncate()}":balance.truncate()}",
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont(
                                        'Inter',
                                        fontSize: 65 * ffem,
                                        fontWeight: FontWeight.w600,
                                        height: 1.2125 * ffem / fem,
                                        color: Color(0xff161719),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          ".${balance.remainder(1) == 0 ? "00" : (balance.remainder(1) * 100).abs().toStringAsPrecision(2)}",
                                          textAlign: TextAlign.center,
                                          style: SafeGoogleFont(
                                            'Inter',
                                            fontSize: 25 * ffem,
                                            fontWeight: FontWeight.w600,
                                            height: 1.2125 * ffem / fem,
                                            color: Color(0xff161719),
                                          ),
                                        ),
                                        Text(
                                          "THB",
                                          style: SafeGoogleFont(
                                            'Inter',
                                            fontSize: 20 * ffem,
                                            fontWeight: FontWeight.w600,
                                            height: 1.2125 * ffem / fem,
                                            color: Color(0xff161719),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            )),
                          ),
                          //
                          // == EXPENSES CONTAINER VVV
                          //
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(30),
                                            ),
                                            title: Column(
                                              children: [
                                                Text(
                                                  'Set Base Income',
                                                  textAlign: TextAlign.center,
                                                  style: SafeGoogleFont(
                                                    'Inter',
                                                    fontSize: 20 * ffem,
                                                    fontWeight: FontWeight.w600,
                                                    height: 1.2125 * ffem / fem,
                                                  ),
                                                ),
                                                Text(
                                                  'current income: $baseIncome',
                                                  style: SafeGoogleFont(
                                                    'Inter',
                                                    fontSize: 18 * ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.2125 * ffem / fem,
                                                  ),
                                                )
                                              ],
                                            ),
                                            content: TextFormField(
                                              autofocus: true,
                                              textAlign: TextAlign.center,
                                              keyboardType: TextInputType.number,
                                              style: SafeGoogleFont(
                                                'Inter',
                                                fontSize: 20 * ffem,
                                                fontWeight: FontWeight.w300,
                                                height: 1.2125 * ffem / fem,
                                              ),
                                              onChanged: (String value) async {
                                                print(value);
                                                baseIncome = double.parse(value == '' ? '0' : value);
                                              },
                                            ),
                                            actions: <Widget>[
                                              Align(
                                                child: ElevatedButton(
                                                  onPressed: () async {
                                                    await saveIncome(baseIncome).then((value) {
                                                      Navigator.of(context).pop();
                                                    });
                                                    setState(() {
                                                    });
                                                  },
                                                  child: const Text(
                                                    'Save',
                                                    style: TextStyle(fontSize: 24),
                                                  ),
                                                ),
                                              )
                                            ],
                                          );
                                        });
                                  },
                                  child: SizedBox(
                                    height: baseWidth / 4.4,
                                    width: baseWidth / 2.1,
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 8 * fem, 1 * fem),
                                      padding: EdgeInsets.fromLTRB(16 * fem, 17 * fem, 17 * fem, 15 * fem),
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                            'assets/home-screen/images/vector.png',
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 11 * fem, 0 * fem),
                                            width: 48 * fem,
                                            height: 48 * fem,
                                            child: Image.asset(
                                              'assets/home-screen/images/auto-group-rp43.png',
                                              width: 48 * fem,
                                              height: 48 * fem,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(0 * fem, 5 * fem, 0 * fem, 0 * fem),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0.12 * fem, 0 * fem, 0 * fem, 4.85 * fem),
                                                  width: 47.34 * fem,
                                                  height: 10.34 * fem,
                                                  child: Image.asset(
                                                    'assets/home-screen/images/vector-PDa.png',
                                                    width: 47.34 * fem,
                                                    height: 10.34 * fem,
                                                  ),
                                                ),
                                                FittedBox(
                                                  fit: BoxFit.cover,
                                                  child: Text(
                                                    '$baseIncome',
                                                    style: SafeGoogleFont(
                                                      'Inter',
                                                      fontSize: 15 * ffem,
                                                      fontWeight: FontWeight.w600,
                                                      height: 1.2125 * ffem / fem,
                                                      color: Color(0xfffbfbfb),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: baseWidth / 4.4,
                                  width: baseWidth / 2.1,
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 8 * fem, 1 * fem),
                                    padding: EdgeInsets.fromLTRB(16 * fem, 17 * fem, 17 * fem, 15 * fem),
                                    decoration: BoxDecoration(
                                      color: Color(0xfffd3c4a),
                                      borderRadius: BorderRadius.circular(28 * fem),
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 11 * fem, 0 * fem),
                                          width: 48 * fem,
                                          height: 48 * fem,
                                          child: Image.asset(
                                            'assets/home-screen/images/group-223-p4x.png',
                                            width: 48 * fem,
                                            height: 48 * fem,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.fromLTRB(0 * fem, 2 * fem, 0 * fem, 0 * fem),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                // expensesCAC (5:661)
                                                margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 4 * fem),
                                                child: Text(
                                                  'Expenses',
                                                  style: SafeGoogleFont(
                                                    'Inter',
                                                    fontSize: 14 * ffem,
                                                    fontWeight: FontWeight.w500,
                                                    height: 1.2125 * ffem / fem,
                                                    color: Color(0xfffbfbfb),
                                                  ),
                                                ),
                                              ),
                                              FittedBox(
                                                fit: BoxFit.cover,
                                                child: Text(
                                                  '$expenses',
                                                  style: SafeGoogleFont(
                                                    'Inter',
                                                    fontSize: 15 * ffem,
                                                    fontWeight: FontWeight.w600,
                                                    height: 1.2125 * ffem / fem,
                                                    color: Color(0xfffbfbfb),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ])
                      ],
                    ),
                  ),
                  snapshot.data as ListScreen,
                ]);
              } else {
                return const Text('Loading');
              }
            },
          )),
    ));
  }
}

// Column(
//   children: [
//     Container(
//       margin: const EdgeInsets.only(top: 140, bottom: 60),
//       child: Center(
//         child: Column(
//           children: [
//             const Text(
//               "Spent this Month",
//               style: TextStyle(fontSize: 18, color: Colors.grey),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "${total.truncate()}", style: const TextStyle(fontSize: 65),
//                 ),
//                 Column(
//                   children: [
//                     Text(
//                       ".${(total.remainder(1)*100).toStringAsPrecision(2)}", style: const TextStyle(fontSize: 30),
//                     ),
//                     const Text("THB")
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         )
//       ),
//     ),
//     Container(
//       margin: const EdgeInsets.only(bottom: 60),
//       child: TextButton.icon(
//         onPressed: () {
//           Navigator.pushNamed(context, '/add');
//         },
//         style: ButtonStyle(
//             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                 RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(25),
//                     side: BorderSide(color: Colors.blue)
//                 )
//             )
//         ),
//         icon: const Icon(Icons.add, size: 25),
//         label: Text("ADD EXPENSES", style: TextStyle(fontSize: 25),),
//       ),
//     ),
//     FutureBuilder(
//       future: init(), builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
//         return Expanded(
//           child: ListView.builder(
//             shrinkWrap: true,
//             padding: const EdgeInsets.all(8),
//             itemCount: entries.length,
//             itemBuilder: (BuildContext context, int index) {
//               return ListTile(
//                   leading: const Icon(Icons.local_pizza),
//                   trailing: Text(
//                     "${entries[index]['price']}",
//                     style: TextStyle(color: Colors.redAccent, fontSize: 20),
//                   ),
//                   title: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("${entries[index]['name']}", style: TextStyle(fontSize: 20),),
//                       Text("${entries[index]['date']}", style: TextStyle(fontSize: 17, color: Colors.grey),)
//                   ],
//                 )
//               );
//             },
//           ),
//         );
//       },
//     ),
//   ],
// ),
