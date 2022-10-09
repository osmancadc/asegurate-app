import 'package:app_asegurate/models/person_score.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DetailpageController extends GetxController {
  Color getColorScale(int score) {
    if (score > 0 && score < 50) {
      return Colors.deepOrangeAccent;
    } else if (score < 80) {
      return Colors.amber;
    } else {
      return Colors.green;
    }
  }

  PersonScore? scoreData = Get.arguments;
  RxString name = "".obs;
  RxString document = "".obs;
  RxInt score = 0.obs;
  RxInt stars = 0.obs;
  RxInt reputation = 0.obs;
  RxBool certified = true.obs;
  RxString photo = "".obs;
  RxString gender = "".obs;

  @override
  void onInit() async {
    super.onInit();
    gender.value = scoreData!.gender;
    photo.value = scoreData!.photo;
    certified.value = scoreData!.certified;
    name.value = scoreData!.name;
    document.value = scoreData!.document;
    stars.value = scoreData!.stars;
    reputation.value = scoreData!.reputation;
    score.value = scoreData!.score;
  }
}
