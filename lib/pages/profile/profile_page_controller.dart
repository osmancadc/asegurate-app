import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePageController extends GetxController {
  TextEditingController textIdentification = TextEditingController();
  
}

void gotoProfilePageEdit(BuildContext context) async {
   Get.toNamed('/edit');
}
