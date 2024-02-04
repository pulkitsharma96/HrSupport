import 'package:get/get.dart';
import 'package:rms/controller/base_controller.dart';

import '../server/request/signup/signup_req.dart';
import '../server/response/common_response.dart';
import '../server/signup/signup_api.dart';
import '../server/signup/signup_api_impl.dart';
import '../utils/AppAssets.dart';

class SignupController extends BaseController {
  final SignupApi signupApi = Get.find<SignupApiImpl>();
  // var roleList = <Roles>[].obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onInit() {
    super.onInit();
  }

  signup(SignUpReq req) async {
    await consumeApi<SignUpReq>(signupApi.signup, req,
        onConfirm: handleSignUpResponse);
  }

  handleSignUpResponse(CommonRes res) {
    if (isSuccess.isTrue) {
      AppAssets.appToast(res.message);
      Get.back(canPop: true);
    }
  }
}

