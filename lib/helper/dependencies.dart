import 'package:get/get.dart';
import 'package:i_eats/controllers/auth_controller.dart';
import 'package:i_eats/controllers/location_controller.dart';
import 'package:i_eats/controllers/order_controller.dart';
import 'package:i_eats/controllers/user_controller.dart';
import 'package:i_eats/data/repository/auth_repo.dart';
import 'package:i_eats/data/repository/location_repo.dart';
import 'package:i_eats/data/repository/order_repo.dart';
import 'package:i_eats/data/repository/user_repo.dart';

import '../controllers/cart_controller.dart';
import '../controllers/popular_product_controller.dart';
import '../controllers/recommended_product_controller.dart';
import '../data/api/api_client.dart';
import '../data/repository/cart_repo.dart';
import '../data/repository/popular_product_repo.dart';
import '../data/repository/recommended_product_repo.dart';
import '../utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
Future<void> init() async{

  // Obtain shared preferences.
  final sharedPreference =await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreference);

  //api client
  //http://mvs.bslmeiyu.com/api/v1/products/popular
  //appBaseUrl: http://mvs.bslmeiyu.com
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL, sharedPreferences:Get.find()));

  //repos
  Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => UserRepo(apiClient: Get.find(),));
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences:Get.find()));
  Get.lazyPut(() => LocationRepo(apiClient: Get.find(),sharedPreferences:Get.find()));
  Get.lazyPut(() => OrderRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => UserController(userRepo: Get.find()));
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
  Get.lazyPut(() => LocationController(locationRepo: Get.find()));
  Get.lazyPut(() => OrderController(orderRepo: Get.find()));
}