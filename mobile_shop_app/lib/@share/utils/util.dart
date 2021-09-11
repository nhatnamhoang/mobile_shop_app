import 'package:mobile_shop_app/@share/constants/language.constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

getLocalize(String key, { List<String>? args}) => key.trArgs(args!);

widthScreen({int? percent}) =>
    percent != null ? (Get.width * percent) / 100 : Get.width;

heightScreen({int? percent}) =>
    percent != null ? (Get.height * percent) / 100 : Get.height;

Widget heightSpace(double value) => SizedBox(height: value);

Widget widthSpace(double value) => SizedBox(width: value);

goTo({@required String? screen, dynamic argument}) =>
    Get.toNamed(screen!, arguments: argument);

goToAndRemoveAll({@required String? screen, dynamic argument}) =>
    Get.offAllNamed(screen!, arguments: argument);

goBack({dynamic argument}) => Get.back(result: argument);

getArgument() => Get.arguments;

openDialog({@required Widget? dialog, bool dismiss = false}) =>
    Get.dialog(dialog!, barrierDismissible: dismiss);

showToast(String content) =>
    EasyLoading.showToast(getLocalize(content) ?? content);

showLoading([String? content]) => EasyLoading.show(
    status: content != null ? getLocalize(content) : getLocalize(loading));

hideLoading() => EasyLoading.dismiss();
