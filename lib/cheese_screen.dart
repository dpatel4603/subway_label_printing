import 'package:flutter/material.dart';
import 'package:sunmi/main.dart';

class CheeseScreen extends StatefulWidget {
  final String employeeName;
  const CheeseScreen({Key? key, required this.employeeName}) : super(key: key);
  @override
  // ignore: no_logic_in_create_state
  State<CheeseScreen> createState() =>
      // ignore: no_logic_in_create_state
      _CheeseScreenState(employeeName: employeeName);
}

class _CheeseScreenState extends State<CheeseScreen> {
  final String employeeName;

  _CheeseScreenState({required this.employeeName});
  List<String> buttonNames = [
    'AMER',
    'MOZZ',
    'MONT JACK',
    'PPR JACK',
    'PROVOLONE',
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
    Sunmi printer = Sunmi(employeeName: employeeName);

    // Customize actions based on the button name
    if (buttonName == 'AMER') {
      printer.printReceiptForAMERICAN();
    } else if (buttonName == 'MOZZ') {
      printer.printReceiptForMoZ();
    } else if (buttonName == 'PROVOLONE') {
      printer.printReceiptForProvolone();
    } else if (buttonName == 'MONT JACK') {
      printer.printReceiptForMonteryJack();
    } else if (buttonName == 'PPR JACK') {
      printer.printReceiptForPEPPERJACK();
    }
    // Add more conditions as needed for other buttonsr
  }
}
