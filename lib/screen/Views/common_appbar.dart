

import 'package:flutter/material.dart';


import '../../utils/CustomTextStyle.dart';

commonAppBar(String title){
  return AppBar(
    backgroundColor: Colors.blue,
    title: Text('$title', style: CustomTextStyle.headingTextStyle),
    actions: title != "A"
        ? []
        : [
      IconButton(
        iconSize: 26,
        icon: const Icon(Icons.person_add_alt_outlined),
        onPressed: () {
          // ...
        },
      ),
    ],
  );
}
