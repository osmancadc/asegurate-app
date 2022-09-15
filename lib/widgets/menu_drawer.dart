import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils.dart';
import 'menu_drawer_controller.dart';
import 'dart:ui' show ImageFilter;

class MenuDrawer extends GetxController {
  Widget menuDrawer(BuildContext context) {
    MenuDrawerController con = Get.put(MenuDrawerController());
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Drawer(
        backgroundColor: colorSecondary.withAlpha(100),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
              ),
              children: [
                GestureDetector(
                    onTap: () => gotoConsultPage(),
                    child: _iconMenu(Icons.list, 'Consultar', context)),
                GestureDetector(
                    onTap: () => gotoQualififyPage(),
                    child: _iconMenu(Icons.rate_review, 'Calificar', context)),
                // GestureDetector(
                //   onTap: () => gotoReportPage(),
                //   child: _iconMenu(Icons.report, 'Reportar', context),
                // ),
                // GestureDetector(
                //   onTap: () => gotoNewsPage(),
                //   child: _iconMenu(Icons.notifications, 'Noticias', context),
                // ),
                GestureDetector(
                  onTap: () => gotoProfilePage(),
                  child: _iconMenu(Icons.person, 'Perfil', context),
                ),
                // GestureDetector(
                //   onTap: () => gotoSettingsPage(),
                //   child: _iconMenu(Icons.settings, 'Ajustes', context),
                // ),
                GestureDetector(
                  onTap: () => con.logout(),
                  child: _iconMenu(Icons.exit_to_app, 'Salir', context),
                ),
                // GestureDetector(
                //   onTap: () => gotoHelpPage(),
                //   child: _iconMenu(Icons.help, 'Ayuda', context),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }

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
