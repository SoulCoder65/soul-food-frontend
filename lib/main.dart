import 'package:flutter/material.dart';
import 'package:food_delivery/screens/food_section/popular_food_detail.dart';
import 'package:food_delivery/screens/food_section/recommended_foo_detail.dart';
import 'package:food_delivery/screens/home/main_home_page.dart';
import 'package:get/get.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Soul Food',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RecommendedFoodDetail(),
    );
  }
}

