import 'package:app_asegurate/models/person_score.dart';
import 'package:app_asegurate/utils/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailpageController extends GetxController {
  Color getColorScale(int score) {
    if (score > 0 && score < 50) {
      return Colors.deepOrangeAccent;
    } else if (score == 50) {
      return Colors.grey.shade600;
    } else if (score < 80) {
      return Colors.amber;
    } else {
      return Colors.green;
    }
  }

  PersonScore? scoreData = Get.arguments;
  RxString name = ''.obs;
  RxString document = ''.obs;
  RxString photo = ''.obs;
  RxString gender = ''.obs;
  RxString certificationMessage = ''.obs;
  RxInt score = 0.obs;
  RxInt stars = 0.obs;
  RxInt reputation = 0.obs;
  RxBool certified = true.obs;

  @override
  void onInit() async {
    super.onInit();
    gender.value = scoreData!.gender;
    if (gender.value == '') {
      gender.value = 'male';
    }
    photo.value = scoreData!.photo;
    certified.value = ((scoreData!.score + scoreData!.reputation) / 2 > 75);
    name.value = scoreData!.name;
    document.value = scoreData!.document;
    stars.value = scoreData!.stars;
    reputation.value = scoreData!.reputation;
    score.value = scoreData!.score;
  }

  void showCertificationMessage(BuildContext context) {
    if (certified.value) {
      CertificationDialog.show(context, 'La persona esta certificada como confiable', true);
    } else {
      CertificationDialog.show(
          context, 'La persona no se encuentra certificada como confiable', false);
    }
  }
}
