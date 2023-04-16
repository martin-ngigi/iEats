import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:i_eats/models/order_model.dart';
import 'package:i_eats/pages/address/add_address_page.dart';
import 'package:i_eats/pages/address/pick_address_map.dart';
import 'package:i_eats/pages/auth/sign_in_page.dart';
import 'package:i_eats/pages/food/popular_food_detail.dart';
import 'package:i_eats/pages/home/main_food_page.dart';
import 'package:i_eats/pages/payment/order_success_page.dart';
import 'package:i_eats/pages/payment/payment_page.dart';
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
  static const String signIn ="/sign-in";
  static const String addAddress ="/add-address";
  static const String pickAddressMap ="/pick-address";
  static const String payment ="/payment";
  static const String orderSuccess ="/order-success";

  static String getSplashPage() =>'$splashPage';
  static String getInitial() =>'$initial';
  static String getPopularFood(int pageId, String page) =>'$popularFood?pageId=$pageId&page=$page';// passing data to next page
  static String getRecommendedFood(int pageId, String page) =>'$recommendedFood?pageId=$pageId&page=$page';// passing data to next page
  static String getCartPage() =>'$cartPage';
  static String getSignInPage() =>'$signIn';
  static String getAddressPage() =>'$addAddress';
  static String getPickAddressPage() =>'$pickAddressMap';
  static String getPaymentPage(String id, int userID) =>'$payment?id=$id&userID=$userID';
  static String getOrderSuccessPage(String orderID, String status) =>'$orderSuccess?id=$orderID&status=$status';

  static List<GetPage> routes = [

    //splash screen
    GetPage(name: splashPage, page: ()=>SplashScreen()),

    GetPage(name: signIn, page: (){
      return SignInPage();
    },
      transition: Transition.rightToLeft,
      transitionDuration:  Duration(milliseconds: 500), // half a second
    ),

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

    //address page
    GetPage(name: addAddress, page: (){
      return AddAddressPage();
    },
      transition: Transition.rightToLeft,
      transitionDuration:  Duration(milliseconds: 500), // half a second
    ),

    //pick address page
    GetPage(name: pickAddressMap, page: (){
      /// passing a widget of screen.
      PickAddressMap _pickAddress = Get.arguments;
      return _pickAddress;
    },
      transition: Transition.rightToLeft,
      transitionDuration:  Duration(milliseconds: 500), // half a second
    ),

    //Payment page
    GetPage(name: payment, page: () => PaymentPage(
        orderModel: OrderModel(
            id: int.parse(Get.parameters['id']!),
            userId: int.parse(Get.parameters['userID']!),
        )
    )),

    // Order Success
    GetPage(name: orderSuccess, page: () => OrderSuccessPage(
      orderID: Get.parameters['id']!,
      status: Get.parameters['status'].toString().contains("success") ? 1 : 0, /// if status contains success text, send 1 else send 0
    )),

  ];
}