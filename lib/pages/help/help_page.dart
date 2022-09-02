import 'package:app_asegurate/utils.dart';
import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  HelpPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimary,
        title: Text('HelpPage'),
      ),
      body: Center(
        child: Text('HelpPage'),
      ),
    );
  }
}
