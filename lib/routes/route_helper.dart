import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:i_eats/pages/food/popular_food_detail.dart';
import 'package:i_eats/pages/home/main_food_page.dart';
import 'package:i_eats/pages/splash/splash_page.dart';

import '../pages/cart/cart_page.dart';
import '../pages/food/recommended_food_detail.dart';
import '../pages/home/home_page.dart';

class RouteHelper{
  static const String splashPage ="/splash-page";
  static const String initial ="/";
  static const String popularFood ="/popular-food";
  static const String recommendedFood ="/recommended-food";
  static const String cartPage ="/cart-page";

  static String getSplashPage() =>'$splashPage';
  static String getInitial() =>'$initial';
  static String getPopularFood(int pageId, String page) =>'$popularFood?pageId=$pageId&page=$page';// passing data to next page
  static String getRecommendedFood(int pageId, String page) =>'$recommendedFood?pageId=$pageId&page=$page';// passing data to next page
  static String getCartPage() =>'$cartPage';

  static List<GetPage> routes = [

    //splash screen
    GetPage(name: splashPage, page: ()=>SplashScreen()),

    //initial
    //GetPage(name: initial, page: ()=>MainFoodPage()),
    GetPage(name: initial, page: (){
      return HomePage();
    },
      transition: Transition.rightToLeft,
      transitionDuration:  Duration(milliseconds: 500), // half a second
    ),

    //popularFood
    GetPage(name: popularFood, page: (){
      var pageId = Get.parameters['pageId'];
      var page = Get.parameters['page'];
        return PopularFoodDetail(pageId: int.parse(pageId!), page:page!);
      },
      transition: Transition.rightToLeft,
      transitionDuration:  Duration(milliseconds: 500), // half a second
    ),

    //recommendedFood
    GetPage(name: recommendedFood, page: (){
      var pageId = Get.parameters['pageId'];
      var page = Get.parameters['page'];
      return RecommendedFoodDetail(pageId: int.parse(pageId!), page:page!);
    },
      transition: Transition.rightToLeft,
      transitionDuration:  Duration(milliseconds: 500), // half a second
    ),

    //cart page
    GetPage(name: cartPage, page: (){
      return CartPage();
    },
      transition: Transition.rightToLeft,
      transitionDuration:  Duration(milliseconds: 500), // half a second
    ),
  ];
}