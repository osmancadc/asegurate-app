import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:app_asegurate/enviroment/enviroment.dart';

var firstColor = HexColor('#583BB6');
var secondColor = HexColor('#664FB2');
var thirdColor = HexColor('#3FD7B2');
var fourthColor = HexColor('#00FFB4');
var fifthColor = HexColor('#E2E4E5');

var textTitle = Row(mainAxisAlignment: MainAxisAlignment.center, children: [
  Text(
    'ASEGUR4TE',
    style: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        color: fifthColor,
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

String encryptText(String text) {
  final String encryptionKey = Environment.ENCRYPTION_KEY;

  final key = encrypt.Key.fromUtf8(encryptionKey);
  final iv = encrypt.IV.fromLength(16);
  final encrypter = encrypt.Encrypter(encrypt.AES(key));
  final encrypted = encrypter.encrypt(text, iv: iv);

  return encrypted.base64;
}
