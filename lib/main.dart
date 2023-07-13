import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:suitmedia_test/screen/screen_1_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Screen1Page(),
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
    );
    ;
  }
}
