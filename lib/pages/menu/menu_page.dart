import 'package:flutter/material.dart';

import 'package:app_asegurate/pages/menu/menu_page_controller.dart';
import 'package:app_asegurate/utils.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorSecondary,
        body: Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
            child: SafeArea(child: _buildGrid(context))));
  }

  Widget _buildGrid(context) => GridView.extent(
        maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.50,
        padding: const EdgeInsets.all(29),
        mainAxisSpacing: 0.0,
        crossAxisSpacing: 0.0,
        children: [
          GestureDetector(
              onTap: () => gotoConsultPage(),
              child: _iconMenu(Icons.list, 'Consultar', context)),
          GestureDetector(
              onTap: () => gotoQualififyPage(),
              child: _iconMenu(Icons.rate_review, 'Calificar', context)),
          GestureDetector(
            onTap: () => gotoReportPage(),
            child: _iconMenu(Icons.report, 'Reportar', context),
          ),
          GestureDetector(
            onTap: () => gotoNewsPage(),
            child: _iconMenu(Icons.notifications, 'Noticias', context),
          ),
          GestureDetector(
            onTap: () => gotoProfilePage(),
            child: _iconMenu(Icons.person, 'Perfil', context),
          ),
          GestureDetector(
            onTap: () => gotoSettingsPage(),
            child: _iconMenu(Icons.settings, 'Ajustes', context),
          ),
          GestureDetector(
            onTap: () => gotoLogoutPage(),
            child: _iconMenu(Icons.exit_to_app, 'Salir', context),
          ),
          GestureDetector(
            onTap: () => gotoHelpPage(),
            child: _iconMenu(Icons.help, 'Ayuda', context),
          ),
        ],
      );

  Widget _iconMenu(IconData icon, String text, context) => Column(
        children: [
          Icon(
            icon,
            color: colorFontIcon,
            size: MediaQuery.of(context).size.width * 0.22,
          ),
          Text(
            text,
            style: TextStyle(
              color: colorFontIcon,
              fontSize: 20,
            ),
          ),
        ],
      );
}
