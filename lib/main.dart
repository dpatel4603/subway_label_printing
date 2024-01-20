import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sunmi/bread_screen.dart';
import 'package:sunmi/cheese_screen.dart';
import 'package:sunmi/hotstuff_screen.dart';
import 'package:sunmi/meat_screen.dart';
import 'package:sunmi/sauce_screen.dart';
import 'package:sunmi/veggie_screen.dart';
import 'package:sunmi_cloud_printer/column_maker.dart'
    as sunmi_cloud_columnmaker;
import 'package:sunmi_cloud_printer/enums.dart' as sunmi_cloud_enums;
import 'package:sunmi_cloud_printer/sunmi_cloud_printer.dart';
import 'package:sunmi_cloud_printer/sunmi_style.dart' as sunmi_cloud_style;
import 'package:sunmi_printer_plus/column_maker.dart';
import 'package:sunmi_printer_plus/enums.dart';
import 'package:sunmi_printer_plus/sunmi_printer_plus.dart';
import 'package:sunmi_printer_plus/sunmi_style.dart';

class SunmiScreenHome extends StatelessWidget {
  SunmiScreenHome({Key? key}) : super(key: key);
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sunmi Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Enter Name'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FirstScreen(employeeName: nameController.text),
                  ),
                );
              },
              child: const Text('Sauces'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SecondScreen(employeeName: nameController.text),
                  ),
                );
              },
              child: const Text('Veggies'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ThirdScreen(employeeName: nameController.text),
                  ),
                );
              },
              child: const Text('Meat'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FourthScreen(employeeName: nameController.text),
                  ),
                );
              },
              child: const Text('Breads'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FifthScreen(employeeName: nameController.text),
                  ),
                );
              },
              child: const Text('Cheese'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SixthScreen(employeeName: nameController.text),
                  ),
                );
              },
              child: const Text('Hot Stuff'),
            ),
          ],
        ),
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {
  final String employeeName;
  const FirstScreen({Key? key, required this.employeeName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Subway Sauces Screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SauceScreen(employeeName: employeeName),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final String employeeName;
  const SecondScreen({Key? key, required this.employeeName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Subway Veggie Screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: VeggieScreen(employeeName: employeeName),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  final String employeeName;
  const ThirdScreen({Key? key, required this.employeeName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Subway Meat Screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MeatScreen(employeeName: employeeName),
    );
  }
}

class FourthScreen extends StatelessWidget {
  final String employeeName;
  const FourthScreen({Key? key, required this.employeeName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Subway Bread Screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: BreadScreen(employeeName: employeeName),
    );
  }
}

class FifthScreen extends StatelessWidget {
  final String employeeName;
  const FifthScreen({Key? key, required this.employeeName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Subway Cheeses Screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: CheeseScreen(employeeName: employeeName),
    );
  }
}

class SixthScreen extends StatelessWidget {
  final String employeeName;
  const SixthScreen({Key? key, required this.employeeName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Subway Hot Stuff Screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HotStuffScreen(employeeName: employeeName),
    );
  }
}

class Sunmi {
  final String employeeName;

  Sunmi({required this.employeeName});
  // initialize sunmi printer
  Future<void> initialize() async {
    await SunmiPrinter.bindingPrinter();
    await SunmiPrinter.initPrinter();
    await SunmiPrinter.setAlignment(SunmiPrintAlign.LEFT);

    // Connect to Cloud Printer
    await SunmiCloudPrinter.setNetPrinter("192.168.0.81");
    await SunmiCloudPrinter.connect();
  }

  // print text passed as parameter
  Future<void> printText(String text) async {
    await SunmiPrinter.printText(text,
        style: SunmiStyle(
          fontSize: SunmiFontSize.XL,
          bold: true,
          align: SunmiPrintAlign.LEFT,
        ));

    await SunmiCloudPrinter.printText(text);
  }

  Future<void> printDate(String text) async {
    var cloudStyle = sunmi_cloud_style.SunmiStyle(
      fontSize: sunmi_cloud_enums.SunmiFontSize.LG,
      bold: true,
      align: sunmi_cloud_enums.SunmiPrintAlign.LEFT,
    );

    await SunmiPrinter.printText(text,
        style: SunmiStyle(
          fontSize: SunmiFontSize.LG,
          bold: true,
          align: SunmiPrintAlign.LEFT,
        ));

    await SunmiCloudPrinter.printText(text, style: cloudStyle);
  }

  // print row and 2 columns
  Future<void> printRowAndColumns(
      {String? column1 = "column 1", String? column2 = "column 2"}) async {
    // creates one line space

    // set alignment center
    await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);
    await SunmiCloudPrinter.setAlignment(
        sunmi_cloud_enums.SunmiPrintAlign.CENTER);

    // prints a row with 3 columns
    // total width of columns should be 30
    await SunmiPrinter.printRow(cols: [
      ColumnMaker(
        text: "$column1",
        width: 10,
        align: SunmiPrintAlign.LEFT,
      ),
      ColumnMaker(
        text: "$column2",
        width: 23,
        align: SunmiPrintAlign.CENTER,
      ),
    ]);
    // creates one line space

    await SunmiCloudPrinter.printRow(cols: [
      sunmi_cloud_columnmaker.ColumnMaker(
        text: "$column1",
        width: 10,
        align: sunmi_cloud_enums.SunmiPrintAlign.LEFT,
      ),
      sunmi_cloud_columnmaker.ColumnMaker(
        text: "$column2",
        width: 23,
        align: sunmi_cloud_enums.SunmiPrintAlign.CENTER,
      ),
    ]);
  }

  /* its important to close the connection with the printer once you are done */
  Future<void> closePrinter() async {
    await SunmiPrinter.unbindingPrinter();
  }

  // print one structure
  Future<void> printReceiptForGRLC() async {
    var now = DateTime.now();
    var discardDate = now.add(const Duration(days: 7));
    await initialize();
    await printText("GARLIC AIOLI");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardDate));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardDate));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForRanch() async {
    var now = DateTime.now();
    var discardDate = now.add(const Duration(days: 7));
    await initialize();
    await printText("PEPPERCORN RANCH");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardDate));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardDate));
    await SunmiPrinter.lineWrap(6);
    await SunmiPrinter.paperSize();
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForKetchup() async {
    var now = DateTime.now();
    var discardDate = now.add(const Duration(days: 7));
    await initialize();
    await printText("KETCHUP");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardDate));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardDate));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForSweetOnionTerriyaki() async {
    var now = DateTime.now();
    var discardDate = now.add(const Duration(days: 7));
    await initialize();
    await printText("SWE ONI TERYK");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardDate));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardDate));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForMustard() async {
    var now = DateTime.now();
    var discardDate = now.add(const Duration(days: 7));
    await initialize();
    await printText("MUSTARD");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardDate));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardDate));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForHoneyMustard() async {
    var now = DateTime.now();
    var discardDate = now.add(const Duration(days: 7));
    await initialize();
    await printText("HNY MUSTARD");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardDate));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardDate));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForBajaChipotle() async {
    var now = DateTime.now();
    var discardDate = now.add(const Duration(days: 7));
    await initialize();
    await printText("BAJA CHPTL");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardDate));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardDate));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForMayo() async {
    var now = DateTime.now();
    var discardDate = now.add(const Duration(days: 7));
    await initialize();
    await printText("MAYO");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardDate));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardDate));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForMVP() async {
    var now = DateTime.now();
    var discardDate = now.add(const Duration(days: 7));
    await initialize();
    await printText("MVP PARM VINIG");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardDate));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardDate));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForBuffalo() async {
    var now = DateTime.now();
    var discardDate = now.add(const Duration(days: 7));
    await initialize();
    await printText("BUFFALO");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardDate));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardDate));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForSriracha() async {
    var now = DateTime.now();
    var discardDate = now.add(const Duration(days: 7));
    await initialize();
    await printText("SRIRACHA");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardDate));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardDate));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForONION() async {
    var now = DateTime.now();
    var discardDate = now.add(const Duration(days: 2));
    await initialize();
    await printText("ONION");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardDate));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardDate));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForBELLPPR() async {
    var now = DateTime.now();
    var discardDate = now.add(const Duration(days: 2));
    await initialize();
    await printText("BELL PEPPER");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardDate));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardDate));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForTOMATO() async {
    var now = DateTime.now();
    var discardDate = now.add(const Duration(days: 2));
    await initialize();
    await printText("TOMATO");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardDate));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardDate));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForCUCUMBER() async {
    var now = DateTime.now();
    var discardDate = now.add(const Duration(days: 2));
    await initialize();
    await printText("CUCUMBER");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardDate));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardDate));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForLETTUCE() async {
    var now = DateTime.now();
    var discardDate = now.add(const Duration(days: 2));
    await initialize();
    await printText("LETTUCE");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardDate));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardDate));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForAvacado() async {
    var now = DateTime.now();
    var discardDate = now.add(const Duration(days: 1));
    await initialize();
    await printText("AVOCADO");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardDate));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardDate));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForBNAPPR() async {
    var now = DateTime.now();
    var discardDate = now.add(const Duration(days: 5));
    await initialize();
    await printText("BANNA PEPPER");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardDate));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardDate));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForPICKLES() async {
    var now = DateTime.now();
    var discardDate = now.add(const Duration(days: 5));
    await initialize();
    await printText("PICKLES");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardDate));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardDate));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForOLIVES() async {
    var now = DateTime.now();
    var discardDate = now.add(const Duration(days: 5));
    await initialize();
    await printText("OLIVES");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardDate));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardDate));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForJALOPENO() async {
    var now = DateTime.now();
    var discardDate = now.add(const Duration(days: 5));
    await initialize();
    await printText("JALOPENO");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardDate));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardDate));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForSPINICH() async {
    var now = DateTime.now();
    var discardDate = now.add(const Duration(days: 2));
    await initialize();
    await printText("SPINICH");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardDate));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardDate));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForBacon() async {
    var now = DateTime.now();
    var discardDate = now.add(const Duration(days: 5));
    await initialize();
    await printText("BACON");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardDate));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardDate));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForCapicola() async {
    var now = DateTime.now();
    var discardDate = now.add(const Duration(days: 3));
    await initialize();
    await printText("CAPICOLA");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardDate));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardDate));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForCKNSTRIPS() async {
    var now = DateTime.now();
    var discardDate = now.add(const Duration(days: 3));
    await initialize();
    await printText("CKN STRIP");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardDate));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardDate));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForCKNTERY() async {
    var now = DateTime.now();
    var discardDate = now.add(const Duration(days: 3));
    await initialize();
    await printText("CHICKEN TERYAKI");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardDate));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardDate));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForCKNROTIS() async {
    var now = DateTime.now();
    var discardDate = now.add(const Duration(days: 3));
    await initialize();
    await printText("ROTIS CKN");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardDate));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardDate));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForCOLDCUT() async {
    var now = DateTime.now();
    var discardDate = now.add(const Duration(days: 3));
    await initialize();
    await printText("COLD CUT");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardDate));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardDate));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForEGGS() async {
    var now = DateTime.now();
    var discardDate = now.add(const Duration(days: 3));
    await initialize();
    await printText("EGGS");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardDate));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardDate));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForHAM() async {
    var now = DateTime.now();
    var discardDate = now.add(const Duration(days: 3));
    await initialize();
    await printText("HAM");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardDate));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardDate));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForMEATBALLS() async {
    var now = DateTime.now();
    var discardDate = now.add(const Duration(days: 3));
    await initialize();
    await printText("MEATBALLS");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardDate));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardDate));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForPEPPERONI() async {
    var now = DateTime.now();
    var discardDate = now.add(const Duration(days: 4));
    await initialize();
    await printText("PEPPERONI");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardDate));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardDate));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForRSTBEEF() async {
    var now = DateTime.now();
    var discardDate = now.add(const Duration(days: 3));
    await initialize();
    await printText("RST BEEF");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardDate));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardDate));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForSALAMI() async {
    var now = DateTime.now();
    var discardDate = now.add(const Duration(days: 4));
    await initialize();
    await printText("SALAMI");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardDate));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardDate));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForSTEAK() async {
    var now = DateTime.now();
    var discardDate = now.add(const Duration(days: 3));
    await initialize();
    await printText("STEAK");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardDate));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardDate));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForTuna() async {
    var now = DateTime.now();
    var discardDate = now.add(const Duration(days: 3));
    await initialize();
    await printText("TUNA");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardDate));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardDate));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForBrocCheese() async {
    var now = DateTime.now();
    var discardDate = now.add(const Duration(hours: 4));
    await initialize();
    await printText("BROC & CHEESE NDLS");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardDate));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardDate));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForChickenNoodles() async {
    var now = DateTime.now();
    var discardDate = now.add(const Duration(hours: 4));
    await initialize();
    await printText("CKN NOODLE");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardDate));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardDate));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForMeatBalls() async {
    var now = DateTime.now();
    var discardDate = now.add(const Duration(hours: 4));
    await initialize();
    await printText("MEATBALLS");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardDate));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardDate));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForTurkey() async {
    var now = DateTime.now();
    var discardDate = now.add(const Duration(days: 3));
    await initialize();
    await printText("TURKEY");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardDate));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardDate));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForPizza() async {
    var now = DateTime.now();
    var discardTime = now.add(const Duration(days: 5));
    var readyTime = now.add(const Duration(days: 1));
    await initialize();
    await printText("PIZZA");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Thawed", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Ready", column2: DateFormat.yMd().add_jm().format(readyTime));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardTime));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardTime));
    await SunmiPrinter.lineWrap(5);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForWrap() async {
    var now = DateTime.now();
    var discardTime = now.add(const Duration(days: 5));
    var readyTime = now.add(const Duration(days: 1));
    await initialize();
    await printText("WRAP");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Thawed", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Ready", column2: DateFormat.yMd().add_jm().format(readyTime));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardTime));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardTime));
    await SunmiPrinter.lineWrap(5);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForChurro() async {
    var now = DateTime.now();
    var discardTime = now.add(const Duration(days: 2));
    var readyTime = now.add(const Duration(hours: 2));
    await initialize();
    await printText("CHURRO");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Thawed", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Ready", column2: DateFormat.yMd().add_jm().format(readyTime));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardTime));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardTime));
    await SunmiPrinter.lineWrap(5);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForFlatbread() async {
    var now = DateTime.now();
    var discardTime = now.add(const Duration(days: 5));
    var readyTime = now.add(const Duration(days: 1));
    await initialize();
    await printText("FLATBREAD");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Thawed", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Ready", column2: DateFormat.yMd().add_jm().format(readyTime));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardTime));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardTime));
    await SunmiPrinter.lineWrap(5);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForPretzel() async {
    var now = DateTime.now();
    var discardTime = now.add(const Duration(days: 2));
    var readyTime = now.add(const Duration(hours: 2));
    await initialize();
    await printText("PRETZEL");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Thawed", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Ready", column2: DateFormat.yMd().add_jm().format(readyTime));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardTime));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardTime));
    await SunmiPrinter.lineWrap(5);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForCookie() async {
    var now = DateTime.now();
    var discardTime = now.add(const Duration(days: 7));
    var readyTime = now.add(const Duration(hours: 4));
    await initialize();
    await printText("COOKIE");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Thawed", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Ready", column2: DateFormat.yMd().add_jm().format(readyTime));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardTime));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardTime));
    await SunmiPrinter.lineWrap(5);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForAMERICAN() async {
    var now = DateTime.now();
    var discardDate = now.add(const Duration(days: 5));
    await initialize();
    await printText("AMER CHEESE");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardDate));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardDate));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForPEPPERJACK() async {
    var now = DateTime.now();
    var discardDate = now.add(const Duration(days: 5));
    await initialize();
    await printText("PEPPER JACK");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardDate));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardDate));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForProvolone() async {
    var now = DateTime.now();
    var discardDate = now.add(const Duration(days: 5));
    await initialize();
    await printText("PROVOLONE");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardDate));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardDate));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForMonteryJack() async {
    var now = DateTime.now();
    var discardDate = now.add(const Duration(days: 5));
    await initialize();
    await printText("MONTERY JACK");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardDate));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardDate));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForMoZ() async {
    var now = DateTime.now();
    var discardDate = now.add(const Duration(days: 5));
    await initialize();
    await printText("FRESH MOZZARELLA");
    await printRowAndColumns(column1: "Employee", column2: employeeName);
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(discardDate));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(discardDate));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sunmi Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SunmiScreenHome(),
    );
  }
}
