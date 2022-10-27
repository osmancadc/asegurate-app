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

void showSnackbar(String message, bool isError) {
  final color = isError
      ? Colors.redAccent.shade700.withOpacity(0.5)
      : Colors.greenAccent.shade700.withOpacity(0.5);

  final title = isError ? '¡Atención!' : '¡Genial!';

  final icon = isError ? Icons.warning : Icons.published_with_changes_outlined;

  Get.snackbar(
    title,
    message,
    colorText: Colors.white,
    barBlur: 15,
    backgroundColor: color,
    icon: Icon(
      icon,
      color: Colors.white,
    ),
  );
}

String formatDocument(String document) {
  if (document.isEmpty) {
    return "";
  }

  int documentNumber = int.parse(document);
  return intl.NumberFormat.decimalPattern().format(documentNumber).replaceAll(",", ".");
}

String formatName(String name) {
  String formatedName = "";
  if (name.isEmpty || name == ' ') {
    return 'el usuario no se pudo encontrar';
  }

  List<String> fullName = name.split(" ");

  for (String s in fullName) {
    formatedName += "${s[0]}${s.substring(1).toLowerCase()} ";
  }
  return formatedName;
}

String encryptText(String text) {
  final String encryptionKey = Environment.ENCRYPTION_KEY;

  final key = encrypt.Key.fromUtf8(encryptionKey);
  final iv = encrypt.IV.fromLength(16);
  final encrypter = encrypt.Encrypter(encrypt.AES(key));
  final encrypted = encrypter.encrypt(text, iv: iv);

  return encrypted.base64;
}

String? validateDocument(String? value) {
  if (value!.isNotEmpty && !value.contains(RegExp(r'^[0-9]{8,10}$'))) {
    return 'Ingresa un documento válido';
  }
  return null;
}

String? validateEmail(String? value) {
  if (value!.isNotEmpty &&
      !value.contains(RegExp(r'^[^@\s]+@(hotmail|gmail|live|outlook|yahoo)\.[a-zA-Z]{2,4}$'))) {
    return 'Ingresa un correo electronico válido';
  }
  return null;
}

String? validatePhone(String? value) {
  if (value!.isNotEmpty && !RegExp(r'^3[0-9]{9}$').hasMatch(value)) {
    return 'Ingresa un número de celular válido';
  }

  return null;
}

String? validatePassword(String? value) {
  if (!value!.isNotEmpty) {
    return null;
  }

  if (value.length < 8) {
    return "La contraseña debe tener minimo 8 caracteres";
  }

  if (value.contains(RegExp(r'[\s]'))) {
    return "La contraseña no debe tener espacios en blanco";
  }

  if (!value.contains(RegExp(r'.*[A-Z].*'))) {
    return "La contraseña debe tener al menos una Mayuscula";
  }

  if (!value.contains(RegExp(r'.*[a-z].*'))) {
    return "La contraseña debe tener al menos una minuscula";
  }

  if (!value.contains(RegExp(r'.*[0-9].*'))) {
    return "La contraseña debe tener al menos un numero";
  }
  if (!value.contains(RegExp(r'.*[@$!%*?&].*'))) {
    return "La contraseña debe tener minimo uno de los \nsiguientes caracteres especiales @ \$ ! % * ? &";
  }

  return null;
}

String? validateMatchingPasswords(String? value1, String? value2) {
  return value1! == value2! ? null : "Las contraseñas no coinciden";
}

String hideEmailAddress(String email) {
  final splittedEmail = email.split('@');
  final splittedBefore = splittedEmail[0].split('');
  final splittedAfter = splittedEmail[1];
  int shownBefore = 0;

  String finalEmail = '';

  for (var c in splittedBefore) {
    if (shownBefore < 3) {
      finalEmail += c;
    } else {
      finalEmail += '*****';
      break;
    }
    shownBefore += 1;
  }

  finalEmail += '@' + splittedAfter;

  return finalEmail;
}
