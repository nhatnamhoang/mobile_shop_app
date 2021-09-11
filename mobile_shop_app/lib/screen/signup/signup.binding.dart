import 'package:get/get.dart';
import 'package:mobile_shop_app/screen/signup/signup.controller.dart';


class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SignUpController());
  }
}
