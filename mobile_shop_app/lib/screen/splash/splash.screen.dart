import 'package:mobile_shop_app/@share/widget/scaffold.widget.dart';
import 'package:mobile_shop_app/screen/splash/splash.controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      titleAppBar: "Demo Get-X",
      body: Text("body"),
    );
  }
}
