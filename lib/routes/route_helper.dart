import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:i_eats/pages/food/popular_food_detail.dart';
import 'package:i_eats/pages/home/main_food_page.dart';

import '../pages/cart/cart_page.dart';
import '../pages/food/recommended_food_detail.dart';

class RouteHelper{
  static const String initial ="/";
  static const String popularFood ="/popular-food";
  static const String recommendedFood ="/recommended-food";
  static const String cartPage ="/cart-page";

  static String getInitial() =>'$initial';
  static String getPopularFood(int pageId) =>'$popularFood?pageId=$pageId';// passing data to next page
  static String getRecommendedFood(int pageId) =>'$recommendedFood?pageId=$pageId';// passing data to next page
  static String getCartPage() =>'$cartPage';

  static List<GetPage> routes = [

    //initial
    //GetPage(name: initial, page: ()=>MainFoodPage()),
    GetPage(name: initial, page: (){
      return MainFoodPage();
    },
      transition: Transition.rightToLeft,
      transitionDuration:  Duration(milliseconds: 500), // half a second
    ),

    //popularFood
    GetPage(name: popularFood, page: (){
      var pageId = Get.parameters['pageId'];
        return PopularFoodDetail(pageId: int.parse(pageId!));
      },
      transition: Transition.rightToLeft,
      transitionDuration:  Duration(milliseconds: 500), // half a second
    ),

    //recommendedFood
    GetPage(name: recommendedFood, page: (){
      var pageId = Get.parameters['pageId'];
      return RecommendedFoodDetail(pageId: int.parse(pageId!));
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