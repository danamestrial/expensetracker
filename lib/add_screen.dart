import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  AddScreenState createState() => AddScreenState();
}

class AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 140, bottom: 60),
              child: Center(
                  child: Column(
                    children: [
                      const Text(
                        "Amount Spent",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("THB", style: TextStyle(fontSize: 20)),
                          SizedBox(width: 10),
                          IntrinsicWidth(
                              child:
                            TextFormField(
                              autofocus: true,
                              style: const TextStyle(fontSize: 65),
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(RegExp(r'[0-9]+[.]{0,1}[0-9]*')),
                                TextInputFormatter.withFunction(
                                      (oldValue, newValue) => newValue.copyWith(),
                                ),
                              ],
                            )
                          ),
                        ],
                      ),
                    ],
                  )
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 60),
              child: TextButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/add');
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: BorderSide(color: Colors.blue)
                        )
                    )
                ),
                icon: const Icon(Icons.add, size: 25),
                label: Text("ADD EXPENSES", style: TextStyle(fontSize: 25),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
