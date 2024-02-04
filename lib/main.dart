import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:rms/binding/login_binding.dart';
import 'package:rms/screen/login_screen.dart';
import 'package:rms/screen/signup_screen.dart';
import 'package:rms/sharedpreferences/SessionManagement.dart';
import 'package:rms/utils/constants.dart';

import 'binding/signup_binding.dart';
import 'controller/application_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(ApplicationController());
  var isDirector = await SessionManagement.isDirector();
  SessionManagement.getAccessToken()
      .then((value) => {runApp(MyApp(value, isDirector))});
}

class MyApp extends StatelessWidget {
  final String accessToken;
  final bool isDirector;
  final controller = Get.find<ApplicationController>();

  MyApp(this.accessToken, this.isDirector, {super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HrSupport',
      theme: ThemeData(
          primarySwatch: Colors.green,
          textTheme: TEXT_THEME_DEFAULT,
          fontFamily: "Outfit",
          visualDensity: VisualDensity.adaptivePlatformDensity),
          getPages: [
            GetPage(
              name: "/login",
              page: () => const LoginPage(),
              binding:LoginBinding(),
            ),
            GetPage(
              name: "/signup",
              page: () => const SignUpScreen(),
              binding: SignupBinding(),
            ),
          ],
         initialRoute: returnRoute(),
    );
  }
  String returnRoute() {
    if (accessToken.isEmpty) {
      return "/login";
    } else {
      if (isDirector) {
        return "/homepage";
      } else {
        return "/nurserostermanagement";
      }
    }
  }
}

