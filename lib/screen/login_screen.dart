import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../controller/login_service.dart';
import '../utils/AppAssets.dart';
import '../utils/CommonString.dart';
import '../utils/CustomTextStyle.dart';
import '../utils/widget_functions.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = Get.find<LoginController>();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
          backgroundColor: Colors.blue,
          title: const Text(CommonString.Log_in,
              style: CustomTextStyle.textStyleBig)
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            addVerticalSpace(10),
            FittedBox(
                fit: BoxFit.fill,
                child: _buildlogo()),
            _buildUsernamePassword(),
            addVerticalSpace(20),
            _buildSignup(),
            const Padding(padding: EdgeInsets.only(bottom: 20)),
          ],
        ),
      ),
    );
  }
  Widget _buildUsernamePassword(){
    return  Column(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          child: TextFormField(
            style: CustomTextStyle.normalTextViewStyle,
            controller: nameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: CommonString.username,
            ),
          ),
        ),
        addVerticalSpace(20),
        Container(
          padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
          child: TextFormField(
            obscureText: true,
            style: CustomTextStyle.normalTextViewStyle,
            controller: passwordController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: CommonString.password,
            ),
          ),
        ),
        addVerticalSpace(25),
        MaterialButton(
          minWidth: MediaQuery.of(context).size.width/2,
          padding: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(5.0) ),
          color: Colors.blue,
          onPressed: () {
             validation();
          },
          child: const Text(
            CommonString.Log_in,
            style: CustomTextStyle.buttonStyle,
          ),
        ),
        addVerticalSpace(40),
        InkWell(
          child:  Container(
            width: double.infinity,
            child: const Text(CommonString.forgot_password,
              textAlign: TextAlign.right,
              style: CustomTextStyle.headingTextViewStyle,),
          ),
          onTap: (){
            // _navigateToForgotScreen(context);
          },
        ),
      ],
    );
  }
  Widget _buildSignup(){
    return  GestureDetector(
      onTap: () {
         Get.toNamed("/signup");
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                CommonString.need_account,
                style: CustomTextStyle.headingTextViewStyle,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                CommonString.sign_up,
                style: CustomTextStyle.normalSignupTextStyle,
              )
            ],
          ),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }
  Widget _buildlogo(){
    return  ClipRRect(
      borderRadius: BorderRadius.circular(150.0),
      child:
      Image.asset(
        'assets/icons/hr-case-management.jpg',
        height: 400.0,
        width: 400.0,
      ),
    );
  }
  void validation() async {
    bool isConnection = await AppAssets.isNetwork();
    if (isConnection) {
      if (nameController.text.isEmpty) {
        AppAssets.appToast("Enter User Name");
      } else if (passwordController.text.isEmpty || passwordController.text.length<6) {
        AppAssets.appToast("Enter 6 Digit Password");
      } else {
        //Get.toNamed("/homepage");
        controller.login(nameController.text, passwordController.text);
      }
    } else {
      AppAssets.appToast("Check Internet Connection !!");
    }
  }
}
