import 'package:flutter/material.dart';
import 'package:sunmi/sunmi.dart';

class VeggieScreen extends StatefulWidget {
  const VeggieScreen({Key? key}) : super(key: key);

  @override
  State<VeggieScreen> createState() => _VeggieScreenState();
}

class _VeggieScreenState extends State<VeggieScreen> {
  List<String> buttonNames = [
    'ONION',
    'BELL PPR',
    'TOMATO',
    'CUCUMBER',
    'LETTUCE',
    'BNA PPR',
    'PICKLES',
    'OLIVES',
    'JALOPENO',
    'SPINICH',
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
            buildButtonRow(6),
            buildButtonRow(9),
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
    if (buttonName == 'ONION') {
      printer.printReceiptForONION();
    } else if (buttonName == 'BELL PPR') {
      printer.printReceiptForBELLPPR();
    } else if (buttonName == 'TOMATO') {
      printer.printReceiptForTOMATO();
    } else if (buttonName == 'CUCUMBER') {
      printer.printReceiptForCUCUMBER();
    } else if (buttonName == 'LETTUCE') {
      printer.printReceiptForLETTUCE();
    } else if (buttonName == 'BNA PPR') {
      printer.printReceiptForBNAPPR();
    } else if (buttonName == 'PICKLES') {
      printer.printReceiptForPICKLES();
    } else if (buttonName == 'OLIVES') {
      printer.printReceiptForOLIVES();
    } else if (buttonName == 'JALOPENO') {
      printer.printReceiptForJALOPENO();
    } else if (buttonName == 'SPINICH') {
      printer.printReceiptForSPINICH();
    }
    // Add more conditions as needed for other buttonsr
  }
}
