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

  //font size
  static double font12 = screenHeight/70.33; //12
  static double font16 = screenHeight/52.7; //16
  static double font20 = screenHeight/42.2; //20
  static double font26 = screenHeight/32.46; //26

  //radius
  static double radius15 = screenHeight/56.27; //15
  static double radius20 = screenHeight/42.2; //20
  static double radius30 = screenHeight/28.13; //30

  //icon size
  static double iconSize24 = screenHeight/35.17; //24
  static double iconSize16 = screenHeight/54.75; //16


  //list view size
   static double listViewImgSize =  screenWidth/3.25;
   static double listViewTextContSize =  screenWidth/3.9;

   //popular food
  static double popularFoodImgSize =  screenHeight/2.41; //350

  //bottom height
  static double bottomHeightBar =  screenHeight/7.03; //120

  //splash screen dimensions
  static double splashImg =  screenHeight/3.38; //250

}