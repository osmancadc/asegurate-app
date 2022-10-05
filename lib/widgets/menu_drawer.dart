import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_asegurate/utils.dart';
import 'menu_drawer_controller.dart';
import 'dart:ui' show ImageFilter;

class MenuDrawer extends GetxController {
  Widget menuDrawer(BuildContext context) {
    MenuDrawerController con = Get.put(MenuDrawerController());
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Drawer(
        backgroundColor: colorSecondary.withOpacity(0.3),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
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
                    child: _iconMenu(
                        Icons.person_search_sharp, 'Consultar', context)),
                GestureDetector(
                    onTap: () => gotoQualififyPage(),
                    child: _iconMenu(
                        Icons.rate_review_outlined, 'Calificar', context)),
                GestureDetector(
                  onTap: () => gotoProfilePage(context),
                  child: _iconMenu(Icons.person_pin, 'Perfil', context),
                ),
                // GestureDetector(
                //   onTap: () => gotoHelpPage(),
                //   child:
                //       _iconMenu(Icons.info_outline_rounded, 'Ayuda', context),
                // ),
                GestureDetector(
                  onTap: () => con.logout(),
                  child: _iconMenu(Icons.exit_to_app, 'Cerrar sesión', context),
                ),
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
            size: MediaQuery.of(context).size.width * 0.20,
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
