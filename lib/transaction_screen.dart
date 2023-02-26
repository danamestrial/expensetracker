import 'package:flutter/material.dart';
import 'package:project_one/utils.dart';
import 'list.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TransactionScreenState();
}

class TransactionScreenState extends State<TransactionScreen> {
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
          child: Container(
            padding: EdgeInsets.fromLTRB(9 * fem, 22 * fem, 9 * fem, 36 * fem),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_left, color: Colors.deepPurple,),
                      iconSize: 40 * fem,
                      onPressed: () {
                        Navigator.pushNamed(context, "/");
                      },
                    ),
                    const Spacer(),
                    Text("Transactions",
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 30 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.2125 * ffem / fem,
                        color: Colors.black87,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.restart_alt_outlined, color: Colors.deepPurple,),
                      iconSize: 40 * fem,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),),
                                  title: Column(
                                    children: [
                                      Text(
                                        'Reset Transaction History?',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont(
                                          'Inter',
                                          fontSize: 25 * ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.2125 * ffem / fem,
                                        ),
                                      ),
                                      Text(
                                        "(can't be undone)",
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont(
                                          'Inter',
                                          fontSize: 15 * ffem,
                                          fontWeight: FontWeight.w300,
                                          height: 1.2125 * ffem / fem,
                                        ),
                                      ),
                                    ],
                                  ),
                                  actions: <Widget>[
                                    Align(
                                        child: ElevatedButton(
                                            onPressed: () async {
                                              reset(clear: true, debug: false).then((value) => {
                                                Navigator.pushNamed(context, '/')
                                              });
                                            },
                                            child: const Text(
                                              'Clear',
                                              style: TextStyle(fontSize: 24),
                                            ),
                                        ),
                                    )
                                  ],
                              );
                            });
                      },
                    ),
                  ],
                ),
                ListScreen(update: (){setState(() {});}),
              ],
            ),
          )
        ),
      ),
    );
  }

}