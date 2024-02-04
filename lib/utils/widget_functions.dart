import 'package:flutter/material.dart';

Widget addVerticalSpace(double height) {
  return SizedBox(height: height);
}

Widget addHorizontalSpace(double width) {
  return SizedBox(width: width);
}

Widget editIconsShow(){
  return const Icon(
    Icons.edit,
    size: 20,
    color: Colors.grey,
  );
}
