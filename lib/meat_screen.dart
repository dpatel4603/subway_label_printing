import 'package:flutter/material.dart';
import 'package:sunmi/sunmi.dart';

class MeatScreen extends StatefulWidget {
  const MeatScreen({Key? key}) : super(key: key);

  @override
  State<MeatScreen> createState() => _SunmiScreenState();
}

class _SunmiScreenState extends State<MeatScreen> {
  List<String> buttonNames = [
    'BACON',
    'CAPICOLA',
    'CKN STRPS',
    'CKN ROTIS',
    'COLD CUT',
    'EGGS',
    'HAM',
    'MEATBALLS',
    'PEPPERONI',
    'RST BEEF',
    'SALAMI',
    'STEAK',
    'TUNA',
    'TURKEY',
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
            buildButtonRow(12),
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
    if (buttonName == 'BACON') {
      printer.printReceiptForBacon();
    } else if (buttonName == 'CAPICOLA') {
      printer.printReceiptForCapicola();
    } else if (buttonName == 'CKN STRPS') {
      printer.printReceiptForCKNSTRIPS();
    } else if (buttonName == 'CKN ROTIS') {
      printer.printReceiptForCKNROTIS();
    } else if (buttonName == 'COLD CUT') {
      printer.printReceiptForCOLDCUT();
    } else if (buttonName == 'EGGS') {
      printer.printReceiptForEGGS();
    } else if (buttonName == 'HAM') {
      printer.printReceiptForHAM();
    } else if (buttonName == 'MEATBALLS') {
      printer.printReceiptForMEATBALLS();
    } else if (buttonName == 'PEPPERONI') {
      printer.printReceiptForPEPPERONI();
    } else if (buttonName == 'RST BEEF') {
      printer.printReceiptForRSTBEEF();
    } else if (buttonName == 'SALAMI') {
      printer.printReceiptForSALAMI();
    } else if (buttonName == 'STEAK') {
      printer.printReceiptForSTEAK();
    } else if (buttonName == 'TUNA') {
      printer.printReceiptForTuna();
    } else if (buttonName == 'TURKEY') {
      printer.printReceiptForTurkey();
    }
    // Add more conditions as needed for other buttons
  }
}
