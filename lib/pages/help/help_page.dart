import 'package:app_asegurate/utils.dart';
import 'package:flutter/material.dart';

class HelpPage extends StatefulWidget {
  HelpPage({Key? key}) : super(key: key);

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  String? _selected;

  List<Map> _myJson = [
    {
      'id': '1',
      'video': 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
      'title': '¿Cómo funciona el servicio de aseguradora?',
    },
    {
      'id': '2',
      'video': 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
      'title': '¿Cómo funciona el servicio de aseguradora?',
    },
    {
      'id': '3',
      'video': 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
      'title': '¿Cómo funciona el servicio de aseguradora?',
    },
    {
      'id': '4',
      'video': 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
      'title': '¿Cómo funciona el servicio de aseguradora?',
    },
    {
      'id': '5',
      'video': 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
      'title': '¿Cómo funciona el servicio de aseguradora?',
    },
    {
      'id': '6',
      'video': 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
      'title': '¿Cómo funciona el servicio de aseguradora?',
    },
    {
      'id': '7',
      'video': 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
      'title': '¿Cómo funciona el servicio de aseguradora?',
    },
    {
      'id': '8',
      'video': 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
      'title': '¿Cómo funciona el servicio de aseguradora?',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimary,
        title: Text('HelpPage'),
      ),
      body: Center(
        child: Container(
            decoration: BoxDecoration(
              color: colorSecondary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton<dynamic>(
                          hint: Text('Select an option'),
                          value: _selected,
                          onChanged: (dynamic newValue) {
                            setState(
                              () {
                                _selected = newValue;
                              },
                            );
                          },
                          items: _myJson.map((Map map) {
                            return DropdownMenuItem(
                              child: Row(
                                children: [
                                  Text(map['title']),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  )
                ])),
      ),
    );
  }
}
