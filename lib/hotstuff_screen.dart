import 'package:flutter/material.dart';
import 'package:sunmi/main.dart';

class HotStuffScreen extends StatefulWidget {
  final String employeeName;
  const HotStuffScreen({Key? key, required this.employeeName})
      : super(key: key);
  @override
  // ignore: no_logic_in_create_state
  State<HotStuffScreen> createState() =>
      // ignore: no_logic_in_create_state
      _HotStuffScreenState(employeeName: employeeName);
}

class _HotStuffScreenState extends State<HotStuffScreen> {
  final String employeeName;

  _HotStuffScreenState({required this.employeeName});
  List<String> buttonNames = [
    'BRC CHE',
    'CKN NDLS',
    'MEAT BALLS',
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
    if (buttonName == 'BRC CHE') {
      printer.printReceiptForBrocCheese();
    } else if (buttonName == 'CKN NDLS') {
      printer.printReceiptForChickenNoodles();
    } else if (buttonName == 'MEAT BALLS') {
      printer.printReceiptForMeatBalls();
    }
    // Add more conditions as needed for other buttonsr
  }
}
