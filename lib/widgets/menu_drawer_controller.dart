import 'package:get/get.dart';

import 'package:jwt_decode/jwt_decode.dart';
import 'package:get_storage/get_storage.dart';

Map<String, dynamic> payload = Jwt.parseJwt(GetStorage().read('token'));
String rol = payload['role'];

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

void gotoProfilePage() {
  Get.toNamed('/profile');
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
