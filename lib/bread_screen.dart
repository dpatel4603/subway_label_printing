import 'package:flutter/material.dart';
import 'package:sunmi/sunmi.dart';

class BreadScreen extends StatefulWidget {
  const BreadScreen({Key? key}) : super(key: key);

  @override
  State<BreadScreen> createState() => _BreadScreenState();
}

class _BreadScreenState extends State<BreadScreen> {
  List<String> buttonNames = [
    'WRAP',
    'PIZZA',
    'CHURRO',
    'COOKIE',
    'PRETZEL',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subway Label Printer'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            buildButtonRow(0),
            buildButtonRow(3),
          ],
        ),
      ),
    );
  }

  Widget buildButtonRow(int startIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            handleButtonPress(buttonNames[startIndex]);
          },
          child: Text(buttonNames[startIndex]),
        ),
        if (startIndex + 1 <
            buttonNames.length) // Check if index is within range
          ElevatedButton(
            onPressed: () {
              handleButtonPress(buttonNames[startIndex + 1]);
            },
            child: Text(buttonNames[startIndex + 1]),
          ),
        if (startIndex + 2 <
            buttonNames.length) // Check if index is within range
          ElevatedButton(
            onPressed: () {
              handleButtonPress(buttonNames[startIndex + 2]);
            },
            child: Text(buttonNames[startIndex + 2]),
          ),
      ],
    );
  }

  void handleButtonPress(String buttonName) {
    Sunmi printer = Sunmi();

    // Customize actions based on the button name
    if (buttonName == 'WRAP') {
      printer.printReceiptForWrap();
    } else if (buttonName == 'PIZZA') {
      printer.printReceiptForPizza();
    } else if (buttonName == 'CHURRO') {
      printer.printReceiptForChurro();
    } else if (buttonName == 'PRETZEL') {
      printer.printReceiptForPretzel();
    } else if (buttonName == 'COOKIE') {
      printer.printReceiptForCookie();
    }
    // Add more conditions as needed for other buttonsr
  }
}
