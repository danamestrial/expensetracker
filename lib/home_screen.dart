import 'dart:ffi';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I'];
    const double total = 899.69;
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
                      "Spent this Month",
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${total.truncate()}", style: const TextStyle(fontSize: 60),
                        ),
                        Column(
                          children: [
                            Text(
                              ".${(total.remainder(1)*100).toStringAsPrecision(2)}", style: const TextStyle(fontSize: 30),
                            ),
                            const Text("THB")
                          ],
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
                  // Respond to button press
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
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(8),
                itemCount: entries.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      leading: const Icon(Icons.list),
                      trailing: const Text(
                        "GFG",
                        style: TextStyle(color: Colors.green, fontSize: 15),
                      ),
                      title: Text("List item ${entries[index]}"));
                },
              ),
            ),
          ],
        ),
      )
    );
  }
}