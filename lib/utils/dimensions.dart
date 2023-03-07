import 'package:get/get.dart';
class Dimensions{
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageView = screenHeight/2.64; //"is the scaling factor"
  static double pageViewContainer = screenHeight/3.84; //"is the scaling factor"
  static double pageViewTextController = screenHeight/7.83; //"is the scaling factor"

  //dynamic height padding and margin
  static double height10 = screenHeight/84.4; //10
  static double height15 = screenHeight/56.27; //15
  static double height20 = screenHeight/42.2; //20
  static double height30 = screenHeight/28.13; //30
  static double height45 = screenHeight/18.76; //45

  //dynamic width padding and margin
  static double width10 = screenHeight/84.4; //10
  static double width15 = screenHeight/56.27; //15
  static double width20 = screenHeight/42.2; //20
  static double width30 = screenHeight/28.13; //30
  static double widtht45 = screenHeight/18.76; //45

  static double font20 = screenHeight/42.2; //20

  //radius
  static double radius15 = screenHeight/56.27; //15
  static double radius20 = screenHeight/42.2; //20
  static double radius30 = screenHeight/28.13; //30

  //icon size
  static double iconSize24 = screenHeight/35.17; //24




}