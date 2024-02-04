import 'package:get/get.dart';
import '../controller/login_service.dart';
import '../server/base/server_impl.dart';
import '../server/login/login_api_impl.dart';


class LoginBinding extends Bindings {
  @override
  void dependencies() {
    // Create Injectable Singleton here
    Get.put(ServerImpl());
    Get.put(LoginApiImpl());
    Get.put(LoginController());
  }
}
