import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../pages/profile/profile_page_controller.dart';

class MenuDrawerController extends GetxController {
  logout() {
    GetStorage().remove('token');
    GetStorage().remove('user');
    Get.offAllNamed('/login');
  }
}

void gotoConsultPage() {
  Get.toNamed('/consult');
}

void gotoQualififyPage() {
  Get.toNamed('/qualify');
}

void gotoReportPage() {
  Get.toNamed('/report');
}

void gotoNewsPage() {
  Get.toNamed('/news');
}

void gotoProfilePage(context) {
  Get.toNamed('/profile');
  final con = Get.put(ProfilePageController());
  con.getUserById(context);
}

void gotoSettingsPage() {
  Get.toNamed('/settings');
}

void gotoLogoutPage() {
  Get.toNamed('/logout');
}

void gotoHelpPage() {
  Get.toNamed('/help');
}
