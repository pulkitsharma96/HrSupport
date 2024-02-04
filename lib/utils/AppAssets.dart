
import 'dart:math';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';


class AppAssets {
  static bool validateEmail(String value) {
    String patttern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = new RegExp(patttern);
    if (value.isEmpty) {
      print("lenth 0");
      return false;
    } else if (!regExp.hasMatch(value)) {
      print("not valid number 0");
      return false;
    }
    return true;
  }

  static int generateOTP() {
    Random random = Random();
    int randomNumber = random.nextInt(10000);
    print("number $randomNumber");
    return randomNumber;
  }

  static Future isNetwork() async
  {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      print("Mobile");
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      print("Wifi");
      return true;
    } else {
      return false;
    }
  }

  static appToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        fontSize: 16.0
    );
  }

  static ProgressDialog progressDialogue(BuildContext context,String progessText)  {

    var dio = new Dio();
    ProgressDialog pd = ProgressDialog(context: context);
    pd.show(max: 100, msg: "$progessText",
    );

    return pd;
  }

  static hideProgessBar(
      BuildContext context,
      ) {
    ProgressDialog pd = ProgressDialog(context: context);
    pd.close();
  }

  static String getCurrentDate() {
    DateTime dateTime = DateTime.now();
    String formattedDate = DateFormat('MMMM dd,yyyy').format(dateTime);
    return formattedDate;
  }

  static String getCurrentDate2() {
    DateTime dateTime = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
    return formattedDate;
  }

  static String getDateFormat(String date) {
    DateTime tempDate = new DateFormat("MMMM dd,yyyy").parse(date);
    String formattedDate = DateFormat('yyyy-MM-dd').format(tempDate);
    return formattedDate;
  }

  static String getDateFormatyear(String date) {
    DateTime tempDate = new DateFormat("yyyy-MM-dd").parse(date);
    String formattedDate = DateFormat('MMMM dd,yyyy').format(tempDate);
    return formattedDate;
  }

  static String getDateFormatData() {
    DateTime dateTime = DateTime.now();
    String formattedDate = DateFormat('MMM yyyy').format(dateTime);
    return formattedDate;
  }

  static String getDateFormatDateDay() {
    DateTime dateTime = DateTime.now();
    String formattedDate = DateFormat('MMM dd,yyyy').format(dateTime);
    return formattedDate;
  }

  static int timeDiffrence(DateTime day){
    final date2 = DateTime.now();
    int difference = day.difference(date2).inDays;
    return difference;
  }

  static String getAddStringFormateDate(String date) {
    DateTime tempDate =  DateFormat("MMMM dd,yyyy").parse(date);
    tempDate=tempDate.add(const Duration(days: 1));
    String formattedDate = DateFormat('MMMM dd,yyyy').format(tempDate);
    return formattedDate;
  }

  static String getSubStringFormateDate(String date) {
    DateTime tempDate =  DateFormat("MMMM dd,yyyy").parse(date);
    tempDate=tempDate.subtract(const Duration(days: 1));
    String formattedDate = DateFormat('MMMM dd,yyyy').format(tempDate);
    return formattedDate;
  }

  TimeOfDay parseTimeStringToTimeOfDay(String timeString) {
    List<String> parts = timeString.split(':');
    int hour = int.parse(parts[0]);
    int minute = int.parse(parts[1]);

    return TimeOfDay(hour: hour, minute: minute);
  }
}