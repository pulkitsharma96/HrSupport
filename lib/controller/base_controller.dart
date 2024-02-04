import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../utils/AppAssets.dart';
import '../utils/dialog_helper.dart';

class BaseController extends GetxController {
  var loadMoreErrorMessage = "".obs;
  var errorMessage = "Fetching...".obs;
  var isSuccess = false.obs;

  consumeApi<T>(Function func, T req, {onConfirm}) async {
    try {
      DialogHelper.showProgressDialog();
      var response = await func(req);
      if (kDebugMode) {
        print(response);
      }
      isSuccess.value = true;
      DialogHelper.hideProgress();
      onConfirm(response);
    } on DioError catch (e) {
      DialogHelper.hideProgress();
      var msg = e.response?.data["status"];
      var errorMsg = e.response?.data["errorMessage"];
      if (errorMsg != null) {
        AppAssets.appToast(errorMsg);
      }
      if (kDebugMode) {
        print(msg);
      }
    } on Exception catch (e) {
      DialogHelper.hideProgress();
      errorMessage.value = e.toString();
    }
  }

}
