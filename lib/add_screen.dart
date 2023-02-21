import 'package:flutter/material.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:string_validator/string_validator.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  AddScreenState createState() => AddScreenState();
}

class AddScreenState extends State<AddScreen> {

  String total = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          const Text("THB", style: TextStyle(fontSize: 20)),
                          const SizedBox(width: 10),
                          Text(
                            "$total", style: const TextStyle(fontSize: 65),
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
            NumericKeyboard(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
                leftIcon: const Icon(Icons.noise_control_off, size: 18),
                rightIcon: const Icon(Icons.backspace, color: Colors.black,),
                leftButtonFn: _onLeftIconTap,
                rightButtonFn: _onRightIconTap,
                textColor: Colors.black,
                onKeyboardTap: _onKeyboardTap,
            ),
          ],
        ),
      ),
    );
  }

  _onKeyboardTap(String value) {
    setState(() {
      total = isFloat(total + value) ? ltrim(total + value, '0') : total;
    });
  }

  _onLeftIconTap() {
    setState(() {
      total = isFloat("$total.") ? "$total." : total;
    });
  }

  _onRightIconTap() {
    setState(() {
      if(isLength(total, 1)) {
        total = total.substring(0, total.length - 1);
      }
    });
  }
}
