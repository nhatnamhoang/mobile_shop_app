import 'package:mobile_shop_app/screen/discover/discover.controller.dart';
import 'package:get/get.dart';

class DiscoverBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DiscoverController());
  }
}
