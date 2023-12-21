import 'package:flutter/services.dart';
import 'package:sunmi_printer_plus/column_maker.dart';
import 'package:sunmi_printer_plus/enums.dart';
import 'package:sunmi_printer_plus/sunmi_printer_plus.dart';
import 'package:sunmi_printer_plus/sunmi_style.dart';
import 'package:intl/intl.dart'; // for date format
// for other locales
import 'main.dart';

class Sunmi {
  // initialize sunmi printer
  Future<void> initialize() async {
    await SunmiPrinter.bindingPrinter();
    await SunmiPrinter.initPrinter();
    await SunmiPrinter.setAlignment(SunmiPrintAlign.LEFT);
  }

  // print text passed as parameter
  Future<void> printText(String text) async {
    await SunmiPrinter.printText(text,
        style: SunmiStyle(
          fontSize: SunmiFontSize.XL,
          bold: true,
          align: SunmiPrintAlign.LEFT,
        ));
  }

  Future<void> printDate(String text) async {
    await SunmiPrinter.printText(text,
        style: SunmiStyle(
          fontSize: SunmiFontSize.LG,
          bold: true,
          align: SunmiPrintAlign.LEFT,
        ));
  }

  // print row and 2 columns
  Future<void> printRowAndColumns(
      {String? column1 = "column 1", String? column2 = "column 2"}) async {
    // creates one line space

    // set alignment center
    await SunmiPrinter.setAlignment(SunmiPrintAlign.CENTER);

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
  }

  /* its important to close the connection with the printer once you are done */
  Future<void> closePrinter() async {
    await SunmiPrinter.unbindingPrinter();
  }

  // print one structure
  Future<void> printReceiptForGRLC() async {
    var now = DateTime.now();
    var oneWeekLater = now.add(const Duration(days: 7));
    await initialize();
    await printText("GARLIC AIOLI");
    await printRowAndColumns(column1: "Employee", column2: "Jay");
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(oneWeekLater));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(oneWeekLater));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForRanch() async {
    var now = DateTime.now();
    var oneWeekLater = now.add(const Duration(days: 7));
    await initialize();
    await printText("PEPPERCORN RANCH");
    await printRowAndColumns(column1: "Employee", column2: "Jay");
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(oneWeekLater));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(oneWeekLater));
    await SunmiPrinter.lineWrap(6);
    await SunmiPrinter.paperSize();
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForKetchup() async {
    var now = DateTime.now();
    var oneWeekLater = now.add(const Duration(days: 7));
    await initialize();
    await printText("KETCHUP");
    await printRowAndColumns(column1: "Employee", column2: "Jay");
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(oneWeekLater));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(oneWeekLater));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForSweetOnionTerriyaki() async {
    var now = DateTime.now();
    var oneWeekLater = now.add(const Duration(days: 7));
    await initialize();
    await printText("SWE ONI TERYK");
    await printRowAndColumns(column1: "Employee", column2: "Jay");
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(oneWeekLater));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(oneWeekLater));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForMustard() async {
    var now = DateTime.now();
    var oneWeekLater = now.add(const Duration(days: 7));
    await initialize();
    await printText("MUSTARD");
    await printRowAndColumns(column1: "Employee", column2: "Jay");
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(oneWeekLater));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(oneWeekLater));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForHoneyMustard() async {
    var now = DateTime.now();
    var oneWeekLater = now.add(const Duration(days: 7));
    await initialize();
    await printText("HNY MUSTARD");
    await printRowAndColumns(column1: "Employee", column2: "Jay");
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(oneWeekLater));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(oneWeekLater));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForBajaChipotle() async {
    var now = DateTime.now();
    var oneWeekLater = now.add(const Duration(days: 7));
    await initialize();
    await printText("BAJA CHPTL");
    await printRowAndColumns(column1: "Employee", column2: "Jay");
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(oneWeekLater));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(oneWeekLater));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForMayo() async {
    var now = DateTime.now();
    var oneWeekLater = now.add(const Duration(days: 7));
    await initialize();
    await printText("MAYO");
    await printRowAndColumns(column1: "Employee", column2: "Jay");
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(oneWeekLater));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(oneWeekLater));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForMVP() async {
    var now = DateTime.now();
    var oneWeekLater = now.add(const Duration(days: 7));
    await initialize();
    await printText("MVP PARM VINIG");
    await printRowAndColumns(column1: "Employee", column2: "Jay");
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(oneWeekLater));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(oneWeekLater));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForBuffalo() async {
    var now = DateTime.now();
    var oneWeekLater = now.add(const Duration(days: 7));
    await initialize();
    await printText("BUFFALO");
    await printRowAndColumns(column1: "Employee", column2: "Jay");
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(oneWeekLater));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(oneWeekLater));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForSriracha() async {
    var now = DateTime.now();
    var oneWeekLater = now.add(const Duration(days: 7));
    await initialize();
    await printText("SRIRACHA");
    await printRowAndColumns(column1: "Employee", column2: "Jay");
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(oneWeekLater));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(oneWeekLater));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForONION() async {
    var now = DateTime.now();
    var oneWeekLater = now.add(const Duration(days: 5));
    await initialize();
    await printText("ONION");
    await printRowAndColumns(column1: "Employee", column2: "Jay");
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(oneWeekLater));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(oneWeekLater));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForBELLPPR() async {
    var now = DateTime.now();
    var oneWeekLater = now.add(const Duration(days: 5));
    await initialize();
    await printText("BELL PEPPER");
    await printRowAndColumns(column1: "Employee", column2: "Jay");
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(oneWeekLater));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(oneWeekLater));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForTOMATO() async {
    var now = DateTime.now();
    var oneWeekLater = now.add(const Duration(days: 5));
    await initialize();
    await printText("TOMATO");
    await printRowAndColumns(column1: "Employee", column2: "Jay");
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(oneWeekLater));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(oneWeekLater));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForCUCUMBER() async {
    var now = DateTime.now();
    var oneWeekLater = now.add(const Duration(days: 5));
    await initialize();
    await printText("CUCUMBER");
    await printRowAndColumns(column1: "Employee", column2: "Jay");
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(oneWeekLater));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(oneWeekLater));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForLETTUCE() async {
    var now = DateTime.now();
    var oneWeekLater = now.add(const Duration(days: 5));
    await initialize();
    await printText("LETTUCE");
    await printRowAndColumns(column1: "Employee", column2: "Jay");
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(oneWeekLater));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(oneWeekLater));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForAvacado() async {
    var now = DateTime.now();
    var oneWeekLater = now.add(const Duration(days: 5));
    await initialize();
    await printText("AVACADO");
    await printRowAndColumns(column1: "Employee", column2: "Jay");
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(oneWeekLater));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(oneWeekLater));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForBNAPPR() async {
    var now = DateTime.now();
    var oneWeekLater = now.add(const Duration(days: 5));
    await initialize();
    await printText("BANNA PEPPER");
    await printRowAndColumns(column1: "Employee", column2: "Jay");
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(oneWeekLater));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(oneWeekLater));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForPICKLES() async {
    var now = DateTime.now();
    var oneWeekLater = now.add(const Duration(days: 5));
    await initialize();
    await printText("PICKLES");
    await printRowAndColumns(column1: "Employee", column2: "Jay");
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(oneWeekLater));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(oneWeekLater));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForOLIVES() async {
    var now = DateTime.now();
    var oneWeekLater = now.add(const Duration(days: 5));
    await initialize();
    await printText("OLIVES");
    await printRowAndColumns(column1: "Employee", column2: "Jay");
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(oneWeekLater));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(oneWeekLater));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForJALOPENO() async {
    var now = DateTime.now();
    var oneWeekLater = now.add(const Duration(days: 5));
    await initialize();
    await printText("JALOPENO");
    await printRowAndColumns(column1: "Employee", column2: "Jay");
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(oneWeekLater));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(oneWeekLater));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForSPINICH() async {
    var now = DateTime.now();
    var oneWeekLater = now.add(const Duration(days: 5));
    await initialize();
    await printText("SPINICH");
    await printRowAndColumns(column1: "Employee", column2: "Jay");
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(oneWeekLater));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(oneWeekLater));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForBacon() async {
    var now = DateTime.now();
    var oneWeekLater = now.add(const Duration(days: 3));
    await initialize();
    await printText("BACON");
    await printRowAndColumns(column1: "Employee", column2: "Jay");
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(oneWeekLater));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(oneWeekLater));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForCapicola() async {
    var now = DateTime.now();
    var oneWeekLater = now.add(const Duration(days: 3));
    await initialize();
    await printText("CAPICOLA");
    await printRowAndColumns(column1: "Employee", column2: "Jay");
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(oneWeekLater));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(oneWeekLater));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForCKNSTRIPS() async {
    var now = DateTime.now();
    var oneWeekLater = now.add(const Duration(days: 3));
    await initialize();
    await printText("CKN STRIP");
    await printRowAndColumns(column1: "Employee", column2: "Jay");
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(oneWeekLater));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(oneWeekLater));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForCKNROTIS() async {
    var now = DateTime.now();
    var oneWeekLater = now.add(const Duration(days: 3));
    await initialize();
    await printText("ROTIS CKN");
    await printRowAndColumns(column1: "Employee", column2: "Jay");
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(oneWeekLater));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(oneWeekLater));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForCOLDCUT() async {
    var now = DateTime.now();
    var oneWeekLater = now.add(const Duration(days: 3));
    await initialize();
    await printText("COLD CUT");
    await printRowAndColumns(column1: "Employee", column2: "Jay");
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(oneWeekLater));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(oneWeekLater));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForEGGS() async {
    var now = DateTime.now();
    var oneWeekLater = now.add(const Duration(days: 3));
    await initialize();
    await printText("EGGS");
    await printRowAndColumns(column1: "Employee", column2: "Jay");
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(oneWeekLater));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(oneWeekLater));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForHAM() async {
    var now = DateTime.now();
    var oneWeekLater = now.add(const Duration(days: 3));
    await initialize();
    await printText("HAM");
    await printRowAndColumns(column1: "Employee", column2: "Jay");
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(oneWeekLater));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(oneWeekLater));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForMEATBALLS() async {
    var now = DateTime.now();
    var oneWeekLater = now.add(const Duration(days: 3));
    await initialize();
    await printText("MEATBALLS");
    await printRowAndColumns(column1: "Employee", column2: "Jay");
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(oneWeekLater));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(oneWeekLater));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForPEPPERONI() async {
    var now = DateTime.now();
    var oneWeekLater = now.add(const Duration(days: 3));
    await initialize();
    await printText("PEPPERONI");
    await printRowAndColumns(column1: "Employee", column2: "Jay");
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(oneWeekLater));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(oneWeekLater));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForRSTBEEF() async {
    var now = DateTime.now();
    var oneWeekLater = now.add(const Duration(days: 3));
    await initialize();
    await printText("RST BEEF");
    await printRowAndColumns(column1: "Employee", column2: "Jay");
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(oneWeekLater));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(oneWeekLater));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForSALAMI() async {
    var now = DateTime.now();
    var oneWeekLater = now.add(const Duration(days: 3));
    await initialize();
    await printText("SALAMI");
    await printRowAndColumns(column1: "Employee", column2: "Jay");
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(oneWeekLater));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(oneWeekLater));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForSTEAK() async {
    var now = DateTime.now();
    var oneWeekLater = now.add(const Duration(days: 3));
    await initialize();
    await printText("STEAK");
    await printRowAndColumns(column1: "Employee", column2: "Jay");
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(oneWeekLater));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(oneWeekLater));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForTuna() async {
    var now = DateTime.now();
    var oneWeekLater = now.add(const Duration(days: 3));
    await initialize();
    await printText("TUNA");
    await printRowAndColumns(column1: "Employee", column2: "Jay");
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(oneWeekLater));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(oneWeekLater));
    await SunmiPrinter.lineWrap(6);
    //await SunmiPrinter.cut();
    await closePrinter();
  }

  Future<void> printReceiptForTurkey() async {
    var now = DateTime.now();
    var oneWeekLater = now.add(const Duration(days: 3));
    await initialize();
    await printText("TURKEY");
    await printRowAndColumns(column1: "Employee", column2: "Jay");
    await printRowAndColumns(
        column1: "Prepped", column2: DateFormat.yMd().add_jm().format(now));
    await printRowAndColumns(
        column1: "Discard",
        column2: DateFormat.yMd().add_jm().format(oneWeekLater));
    await SunmiPrinter.lineWrap(2);
    await printDate(DateFormat.EEEE().format(oneWeekLater));
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
    await printRowAndColumns(column1: "Employee", column2: "Jay");
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
    await printRowAndColumns(column1: "Employee", column2: "Jay");
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
    await printRowAndColumns(column1: "Employee", column2: "Jay");
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
    await printRowAndColumns(column1: "Employee", column2: "Jay");
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
    await printRowAndColumns(column1: "Employee", column2: "Jay");
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
}
