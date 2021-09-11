import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController with WidgetsBindingObserver {


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
  }

  @override
  void onInit() {
    WidgetsBinding.instance!.addObserver(this);
    Get.log("onInit");
    super.onInit();
  }


  @override
  void onReady() {
    super.onReady();
    Get.log("onReady");
  }

  @override
  void onClose() {
    Get.log("onClose");
    WidgetsBinding.instance!.removeObserver(this);
    super.onClose();
  }
}
