
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/Screen/View/HomeScreen.dart';

void main() {
  runApp(
    GetMaterialApp(
      routes: {
        '/': (context) => HomeScreen(),
      },
    )
  );
}


