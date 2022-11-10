

import 'package:get/get.dart';
import 'package:newproject/controller/auth_controller.dart';

import '../controller/location_controller.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<LocationController>(() => LocationController());
  }
}
