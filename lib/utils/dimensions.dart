import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  //  Containers Sizes
  // Factor 844/220=3.84
  static double pageView = screenHeight / 2.64;
  static double pageViewController = screenHeight / 3.84;
  static double pageViewTextController = screenHeight / 7.03;

  //Dynamic Heights
  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.27;
  static double height20 = screenHeight / 42.2;
  static double height30 = screenHeight / 28.13;
  static double height45 = screenHeight / 18.76;

  //Dynamic Widths
  static double width10 = screenHeight / 84.4;
  static double width15 = screenHeight / 56.27;
  static double width20 = screenHeight / 42.2;
  static double width30 = screenHeight / 28.13;

//  Font Sizes
  static double font10 = screenHeight / 84.4;
  static double font16 = screenHeight / 52.75;
  static double font20 = screenHeight / 42.2;
  static double font26 = screenHeight / 32.46;

  //Radius
  static double radius15 = screenHeight / 56.27;
  static double radius20 = screenHeight / 42.2;
  static double radius30 = screenHeight / 28.13;

//Icon
static double icon24=screenHeight/35.17;
static double icon16=screenHeight/52.75;

//List View Size
static double listViewImgSize=screenWidth/3.25;
static double listViewTextContSize=screenWidth/3.9;

//Popular Food
static double popularFoodImgSize=screenHeight/2.41;

//Bottom Heights
  static double bottomHeightBar=screenHeight/7.03;

}
