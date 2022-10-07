import 'package:app_asegurate/data/authentication_client.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class MenuDrawerController extends GetxController {
  final _authenticationClient = GetIt.instance<AuthenticationClient>();
  logout() {
    _authenticationClient.signOut();
    Get.offAllNamed('/login');
  }
}

void gotoConsultPage() {
  Get.toNamed('/consult');
}

void gotoQualififyPage() {
  Get.toNamed('/qualify');
}

void gotoProfilePage(context) {
  Get.toNamed('/profile');
}

void gotoHelpPage() {
  Get.toNamed('/help');
}
