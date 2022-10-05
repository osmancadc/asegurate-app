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

  var arguments = Get.arguments;
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
    name.value = arguments['name'];
    document.value = arguments['document'];
    stars.value = arguments['stars'];
    reputation.value = arguments['reputation'];
    score.value = arguments['score'];
    certified.value = arguments['certified'];
    photo.value = arguments['photo'];
    gender.value = arguments['gender'];
  }
}
