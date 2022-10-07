import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_asegurate/utils/utils.dart';

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

abstract class LoadingDialog {
  static show(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (_) {
          return WillPopScope(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: secondColor.withOpacity(0.7),
              child: Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            ),
            onWillPop: () async => false,
          );
        });
  }

  static dismiss(BuildContext context) {
    Navigator.pop(context);
  }
}
