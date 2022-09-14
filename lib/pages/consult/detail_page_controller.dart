import 'dart:io' as Io;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailpageController extends GetxController {
  var arguments = Get.arguments;
  var name = "".obs;
  var document = "".obs;
  var score = 0.obs;
  var stars = 0.obs;
  var reputation = 0.obs;
  var certified = true.obs;
  var photo = "".obs;

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
  }
}
