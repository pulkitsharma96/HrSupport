import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogHelper {
  static void showProgressDialog() {
    Get.dialog(const Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    ));
  }

  static void hideProgress() {
    var isDialogOpen = Get.isDialogOpen;
    if (isDialogOpen != null && isDialogOpen) {
      Get.back();
    }
  }
}
