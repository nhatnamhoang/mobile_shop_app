import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var pageController = PageController(viewportFraction: 1);

  var indexTab = 0.obs;

  updateIndexTab(val) {
    indexTab.value = val;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
