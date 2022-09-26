import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;

var colorPrimary = HexColor('#583BB6');
var colorSecondary = HexColor('#664FB2');
var colorError = HexColor('#ff0000');
var colorBackground = HexColor('#E2E4E5');
var colorFontIcon = HexColor('#E2E4E5');
var colorOnBackground = HexColor('#000000');
var colorErrorText = HexColor('#3FD7B2');
var colorOnPrimary = HexColor('#000000');
var colorOnSecondary = HexColor('#000000');
var colorOnSurface = HexColor('#000000');
var colorOnError = HexColor('#000000');
var colorOnPrimaryVariant = HexColor('#3FD7B2');
var colorOnSecondaryVariant = HexColor('#666666');
var colorOnSurfaceVariant = HexColor('#000000');
var colorOnErrorVariant = HexColor('#000000');
var colorOnBackgroundVariant = HexColor('#000000');
var colorFont = HexColor('#E2E4E5');

var textTitle = Row(mainAxisAlignment: MainAxisAlignment.center, children: [
  Text(
    'ASEGUR4TE',
    style: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: colorFontIcon,
        fontFamily: "TradeGothicInline"),
  )
]);

String formatDocument(String document) {
  if (document.isEmpty) {
    return "";
  }

  int documentNumber = int.parse(document);
  return intl.NumberFormat.decimalPattern()
      .format(documentNumber)
      .replaceAll(",", ".");
}

String formatName(String name) {
  String formatedName = "";
  if (name.isEmpty) {
    return formatedName;
  }

  List<String> fullName = name.split(" ");

  for (String s in fullName) {
    formatedName += "${s[0]}${s.substring(1).toLowerCase()} ";
  }
  return formatedName;
}

Widget Function(BuildContext) getContext(String message, bool error) {
  var icon = error ? Icons.error : Icons.done_all_sharp;
  var color = error ? Colors.redAccent.shade700 : Colors.green.shade600;

  return (BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Icon(
            icon,
            size: MediaQuery.of(context).size.width * 0.15,
            color: color,
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
              child: Text(
            message,
            style: TextStyle(
              fontSize: 14,
              color: color,
            ),
          )),
        ],
      ),
    );
  };
}

void showSnackbar(String message) {
  Get.snackbar(
    '¡Atención!',
    message,
    colorText: Colors.white,
    barBlur: 15,
    backgroundColor: Colors.redAccent.shade700.withOpacity(0.5),
    icon: Icon(
      Icons.warning,
      color: Colors.white,
    ),
  );
}
