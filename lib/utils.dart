import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';
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
var colorOnSecondaryVariant = HexColor('#888888');
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
  int documentNumber = int.parse(document);
  return intl.NumberFormat.decimalPattern()
      .format(documentNumber)
      .replaceAll(",", ".");
}
