import 'package:get/get.dart';

import '../controller/signup_controller.dart';
import '../server/base/server_impl.dart';
import '../server/signup/signup_api_impl.dart';


class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ServerImpl());
    Get.put(SignupApiImpl());
    Get.put(SignupController());
  }
}
