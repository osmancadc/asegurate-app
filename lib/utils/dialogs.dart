import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:blur/blur.dart';
import 'package:app_asegurate/utils/utils.dart';
import 'package:liquid_progress_indicator_ns/liquid_progress_indicator.dart';

abstract class ResultDialog {
  static show(BuildContext context, String message, bool isError) {
    var icon = isError ? Icons.error : Icons.done_all_sharp;
    var color = isError ? Colors.redAccent.shade700 : Colors.green.shade600;

    showDialog(
      context: context,
      builder: (BuildContext context) {
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
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static dismiss(BuildContext context) {
    Navigator.pop(context);
  }
}

abstract class CertificationDialog {
  static show(BuildContext context, String message, bool isCertified) {
    var icon = isCertified ? Icons.done_all_sharp : Icons.warning_amber;
    var color = isCertified ? Colors.green.shade600 : Colors.amber.shade900;

    showDialog(
      context: context,
      builder: (BuildContext context) {
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
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static dismiss(BuildContext context) {
    Navigator.pop(context);
  }
}

abstract class LoadingDialog {
  static show(BuildContext context) async {
    showCupertinoModalPopup(
        context: context,
        builder: (_) {
          return WillPopScope(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
            ).blurred(
              colorOpacity: 0.5,
              blur: 8,
              blurColor: secondColor,
              overlay: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.width * 0.4,
                child: LiquidCircularProgressIndicator(
                  value: 0.75,
                  borderColor: fifthColor,
                  borderWidth: 1,
                  backgroundColor: fifthColor,
                  valueColor: AlwaysStoppedAnimation(fourthColor),
                  center: Icon(
                    Icons.admin_panel_settings_outlined,
                    color: Colors.black,
                    size: MediaQuery.of(context).size.width * 0.2,
                  ),
                ),
              ),
              // CircularProgressIndicator(color: Colors.white),
            ),
            onWillPop: () async => false,
          );
        });
  }

  static dismiss(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop("Discard");
  }
}
