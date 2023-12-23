import 'package:flutter/material.dart';
import 'package:sunmi/main.dart';

class SauceScreen extends StatefulWidget {
  final String employeeName;
  const SauceScreen({Key? key, required this.employeeName}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<SauceScreen> createState() =>
      _SunmiScreenState(employeeName: employeeName);
}

class _SunmiScreenState extends State<SauceScreen> {
  final String employeeName;

  _SunmiScreenState({required this.employeeName});

  List<String> buttonNames = [
    'GRLC AOLI',
    'PPRC RNCH',
    'KTCHP',
    'SWE ONI TERYK',
    'MSTRD',
    'HNY MSTRD',
    'BJA CHPTL',
    'MAYO',
    'MVP PARM VINIG',
    'BFLO',
    'SRCHA',
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
    Sunmi printer = Sunmi(employeeName: employeeName);

    // Customize actions based on the button name
    if (buttonName == 'GRLC AOLI') {
      printer.printReceiptForGRLC();
    } else if (buttonName == 'PPRC RNCH') {
      printer.printReceiptForRanch();
    } else if (buttonName == 'KTCHP') {
      printer.printReceiptForKetchup();
    } else if (buttonName == 'SWE ONI TERYK') {
      printer.printReceiptForSweetOnionTerriyaki();
    } else if (buttonName == 'MSTRD') {
      printer.printReceiptForMustard();
    } else if (buttonName == 'HNY MSTRD') {
      printer.printReceiptForHoneyMustard();
    } else if (buttonName == 'BJA CHPTL') {
      printer.printReceiptForBajaChipotle();
    } else if (buttonName == 'MAYO') {
      printer.printReceiptForMayo();
    } else if (buttonName == 'MVP PARM VINIG') {
      printer.printReceiptForMVP();
    } else if (buttonName == 'BFLO') {
      printer.printReceiptForBuffalo();
    } else if (buttonName == 'SRCHA') {
      printer.printReceiptForSriracha();
    }
    // Add more conditions as needed for other buttons
  }
}
