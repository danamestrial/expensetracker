import 'dart:ui';
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
  @override
  Widget build(BuildContext context) {
    const double total = 899.69;
    double baseWidth = 370;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.96;
    return Scaffold(
        body: SafeArea(
            child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xffa79696),
                ),
                child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Container(
                    // autogrouptmjdsVz (DULCPfnFBwf1EK3zTVTMjd)
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
                    child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                      Container(
                        margin: EdgeInsets.only(top: 65, bottom: 60),
                        child: Center(
                            child: Column(
                              children: [
                                const Text(
                                  "Spent this Month",
                                  style: TextStyle(fontSize: 18, color: Colors.grey),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${total.truncate()}",
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont (
                                        'Inter',
                                        fontSize: 65*ffem,
                                        fontWeight: FontWeight.w600,
                                        height: 1.2125*ffem/fem,
                                        color: Color(0xff161719),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          ".${(total.remainder(1) * 100).toStringAsPrecision(2)}",
                                          textAlign: TextAlign.center,
                                          style: SafeGoogleFont (
                                            'Inter',
                                            fontSize: 25*ffem,
                                            fontWeight: FontWeight.w600,
                                            height: 1.2125*ffem/fem,
                                            color: Color(0xff161719),
                                          ),
                                        ),
                                        // Text(
                                        //   ".${(total.remainder(1) * 100).toStringAsPrecision(2)}",
                                        //   style: const TextStyle(fontSize: 30),
                                        // ),
                                        Text("THB", style: SafeGoogleFont (
                                          'Inter',
                                          fontSize: 20*ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.2125*ffem/fem,
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
                      Container(
                        // autogroupthh1yMz (DULCojvUCZTHhdEnFjthh1)
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // framev2L (5:650)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 8*fem, 1*fem),
                              padding: EdgeInsets.fromLTRB(16*fem, 17*fem, 17*fem, 15*fem),
                              decoration: BoxDecoration (
                                image: DecorationImage (
                                  fit: BoxFit.cover,
                                  image: AssetImage (
                                    'assets/home-screen/images/vector.png',
                                  ),
                                ),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // autogrouprp43CVe (DULD19m85RjozBjyjHRP43)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 11*fem, 0*fem),
                                    width: 48*fem,
                                    height: 48*fem,
                                    child: Image.asset(
                                      'assets/home-screen/images/auto-group-rp43.png',
                                      width: 48*fem,
                                      height: 48*fem,
                                    ),
                                  ),
                                  Container(
                                    // autogroupofnf6L8 (DULDBeTdqFFpkCr63qofnF)
                                    margin: EdgeInsets.fromLTRB(0*fem, 3.82*fem, 0*fem, 0*fem),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          // vectorDfe (5:652)
                                          margin: EdgeInsets.fromLTRB(0.12*fem, 0*fem, 0*fem, 4.85*fem),
                                          width: 47.34*fem,
                                          height: 10.34*fem,
                                          child: Image.asset(
                                            'assets/home-screen/images/vector-PDa.png',
                                            width: 47.34*fem,
                                            height: 10.34*fem,
                                          ),
                                        ),
                                        Text(
                                          // jP6 (5:701)
                                          '25000',
                                          style: SafeGoogleFont (
                                            'Inter',
                                            fontSize: 22*ffem,
                                            fontWeight: FontWeight.w600,
                                            height: 1.2125*ffem/fem,
                                            color: Color(0xfffbfbfb),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              // group3skC (5:659)
                              margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 0*fem, 0*fem),
                              padding: EdgeInsets.fromLTRB(16*fem, 17*fem, 27*fem, 14*fem),
                              decoration: BoxDecoration (
                                color: Color(0xfffd3c4a),
                                borderRadius: BorderRadius.circular(28*fem),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // group223m4t (5:663)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 8*fem, 1*fem),
                                    width: 48*fem,
                                    height: 48*fem,
                                    child: Image.asset(
                                      'assets/home-screen/images/group-223-p4x.png',
                                      width: 48*fem,
                                      height: 48*fem,
                                    ),
                                  ),
                                  Container(
                                    // autogroupeiejfRA (DULDSUNGLvmLMh7ANhEiEj)
                                    margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 0*fem, 0*fem),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          // expensesCAC (5:661)
                                          margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4*fem),
                                          child: Text(
                                            'Expenses',
                                            style: SafeGoogleFont (
                                              'Inter',
                                              fontSize: 14*ffem,
                                              fontWeight: FontWeight.w500,
                                              height: 1.2125*ffem/fem,
                                              color: Color(0xfffbfbfb),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          // toi (5:662)
                                          '11200',
                                          style: SafeGoogleFont (
                                            'Inter',
                                            fontSize: 22*ffem,
                                            fontWeight: FontWeight.w600,
                                            height: 1.2125*ffem/fem,
                                            color: Color(0xfffbfbfb),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]
                    ),
                  ),
                  ListScreen(),
                ]))));
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
