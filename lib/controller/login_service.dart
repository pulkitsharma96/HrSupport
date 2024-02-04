import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../server/login/login_api.dart';
import '../server/login/login_api_impl.dart';
import '../server/request/login_req.dart';
import '../server/response/login_res.dart';
import '../sharedpreferences/SessionManagement.dart';
import '../utils/AppAssets.dart';
import '../utils/CommonString.dart';
import 'application_controller.dart';
import 'base_controller.dart';


class LoginController extends BaseController {
  final LoginApi loginApi = Get.find<LoginApiImpl>();
  final controller = Get.find<ApplicationController>();

  login(String name, String password) async {
    LoginReq req = LoginReq(name, password, "Testing", "Android");
    await consumeApi<LoginReq>(loginApi.login, req, onConfirm: handleLogin);
  }

  handleLogin(LoginRes loginRes) async {
    if (isSuccess.isTrue) {
      if (loginRes.roles.isNotEmpty) {
        controller.accessToken = loginRes.accessToken;
        var nurseRole = loginRes.roles.where((e) => e.id == 3 || e.id == 4);
        if (nurseRole.isEmpty) {
          var list = loginRes.roles.where((e) => e.id == 1).toList();
          controller.isDirector = list.isEmpty ? false : true;
          AppAssets.appToast("Login Sucessfully");
          print("PULKIT${loginRes.userId}");
          // SessionManagement.setSession(
          //     CommonString.USERNAME, loginRes.userName.toString());
          // SessionManagement.setIntSession(
          //     CommonString.USERID, loginRes.userId??0);
          // SessionManagement.setSession(
          //     CommonString.ACCESS_TOKEN, loginRes.accessToken.toString());
          // SessionManagement.setSession(
          //     CommonString.REFRESH_TOKEN, loginRes.refreshToken.toString());
          // SessionManagement.setSession(
          //     CommonString.FIRSTNAME, loginRes.name.toString());
          // SessionManagement.setSessionRoleList(
          //     CommonString.USER_ROLES, loginRes.roles);
          // if (controller.isDirector) {
          //   Get.offNamed("/homepage");
          // } else {
          //   Get.offNamed("/nurserostermanagement");
          // }
        // } else {
        //   AppAssets.appToast("Nurses are not allowed to use this application");
        }
      }
    } else {

    }
    if (kDebugMode) {
      print(loginRes);
    }
  }
}
