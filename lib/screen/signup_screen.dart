import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/signup_controller.dart';
import '../utils/AppAssets.dart';
import '../utils/CommonString.dart';
import '../utils/CustomTextStyle.dart';
import '../utils/constants.dart';
import '../utils/widget_functions.dart';
import 'Views/common_appbar.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
   final controller = Get.find<SignupController>();
  TextEditingController nameController = TextEditingController();
  TextEditingController employeeIDController = TextEditingController();
  TextEditingController sexController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String _dateTime = "";
  String _dob = "";

  final List<String> usertype = [
    'Employee',
    'Manager',
    'Others',
  ];
  final List<String> items = [
    'Male',
    'Female',
    'Others',
  ];
  String selectedgender = "Male";
  String selectedValue = "Employee";
  DateTime selectedData = DateTime.now();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: commonAppBar(CommonString.sign_up),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            children: [
              userName(),
              addVerticalSpace(15),
              userID(),
              addVerticalSpace(15),
              selectusertype(),
              addVerticalSpace(15),
              userDOB(),
              addVerticalSpace(15),
              userGender(),
              addVerticalSpace(15),
              userPhoneNumber(),
              addVerticalSpace(15),
              userEmail(),
              addVerticalSpace(15),
              userPassword(),
              addVerticalSpace(15),
              userConfirmPassword(),
              addVerticalSpace(20),
              buildSignupButton(),
            ],
          ),
        ),
      ),
    );

  }

  Widget userName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          CommonString.fullname,
          style: CustomTextStyle.headingTextViewStyle,
        ),
        addVerticalSpace(5),
        SizedBox(
          height: 35,
          child: TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    vertical: 0, horizontal: 10),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey))),
          ),
        ),
      ],
    );
  }

  Widget selectusertype(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          CommonString.select_user_type,
          style: CustomTextStyle.headingTextViewStyle,
        ),
        addVerticalSpace(5),
        DropdownButtonHideUnderline(
          child: Container(
            height: 35,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.grey
              ),
              borderRadius: const BorderRadius.all(
                  Radius.circular(5.0) //                 <--- border radius here
              ),

            ),

            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: DropdownButton2(
                hint: Text(
                  CommonString.select_item,
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme
                        .of(context)
                        .hintColor,
                  ),
                ),
                items: usertype
                    .map((item) =>
                    DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                    .toList(),
                value: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value as String;
                  });
                },
                buttonHeight: 30,
                buttonWidth: 350,
                itemHeight: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget userDOB() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(CommonString.date_of_birth,
          style: CustomTextStyle.headingTextViewStyle,
        ),
       addVerticalSpace(5),
        SizedBox(
          child: InkWell(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: const BorderRadius.all(
                      Radius.circular(5))),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  crossAxisAlignment:
                  CrossAxisAlignment.center,
                  children: [
                    Text(_dob),
                    const Spacer(),
                    const Icon(Icons.date_range)
                  ],
                ),
              ),
            ),
            onTap: () {
              datePicker(1);
            },
          ),
        ),
      ],
    );
  }

  Widget buildSignupButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        onPressed: (){},
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
        ),
        child: const Text(CommonString.sign_up,
        style: CustomTextStyle.buttonColorStyle,),
      ),
    );
  }

  Widget userGender(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(CommonString.sex,
          style: CustomTextStyle.headingTextViewStyle,
        ),

        addVerticalSpace(5),

        DropdownButtonHideUnderline(
          child: Container(
            height: 35,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.grey
              ),
              borderRadius: const BorderRadius.all(
                  Radius.circular(5.0) //                 <--- border radius here
              ),

            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: DropdownButton2(
                items: items
                    .map((item) =>
                    DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                    .toList(),
                value: selectedgender,
                onChanged: (value) {
                  setState(() {
                    selectedgender = value as String;
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget userPhoneNumber(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(CommonString.phone_no,
          style: CustomTextStyle.headingTextViewStyle,
        ),
        addVerticalSpace(5),
        SizedBox(
            height: 35,
            child: TextFormField(
              controller: phoneController,
              style: CustomTextStyle.normalTextViewStyle,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                ),
              ),
            )
        ),
      ],
    );
  }

  Widget userEmail(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(CommonString.email_id,
          style: CustomTextStyle.headingTextViewStyle,
        ),
        addVerticalSpace(5),
        SizedBox(
            height: 35,
            child: TextFormField(
              style: CustomTextStyle.normalTextViewStyle,
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                ),
              ),
            )
        ),
      ],
    );
  }

  Widget userID(){
   return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(CommonString.employee_id,
          style: CustomTextStyle.headingTextViewStyle,
        ),

       addVerticalSpace(5),

        SizedBox(
            height: 35,
            child: TextFormField(
              style: CustomTextStyle.normalTextViewStyle,
              controller: employeeIDController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            )
        ),
      ],
    );
  }

  Widget userPassword(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(CommonString.password,
          style: CustomTextStyle.headingTextViewStyle,
        ),
        addVerticalSpace(5),
        SizedBox(
            height: 35,
            child: TextFormField(
              style: CustomTextStyle.normalTextViewStyle,
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                ),
              ),
              obscureText: true,
            )
        ),
      ],
    );
  }

  Widget userConfirmPassword(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(CommonString.confirm_password,
          style: CustomTextStyle.headingTextViewStyle,
        ),
        addVerticalSpace(5),
        SizedBox(
            height: 35,
            child: TextFormField(
              style: CustomTextStyle.normalTextViewStyle,
              controller: confirmPasswordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                ),
              ),
              obscureText: true,
            )
        ),


      ],
    );
  }

  void datePicker(int value){
    showDatePicker(
        context: context,
        initialDate: DateTime(2009),
        firstDate: DateTime(1920),
        lastDate: DateTime(2009))
        .then((date) {
      setState(() {
        String formattedDate = DateFormat('MMMM dd,yyyy').format(date!);
        _dob=formattedDate;
      });
    });
  }

  }


