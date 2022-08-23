import 'package:get/get.dart';

class LogoutPageController extends GetxController {
  void gotoRegisterPage() {
    Get.toNamed('/register');
  }

  void gotoInitiPage() {
    Get.toNamed('/');
  }
}
