import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:i_eats/pages/cart/cart_page.dart';
import 'package:i_eats/pages/food/popular_food_detail.dart';
import 'package:i_eats/pages/food/recommended_food_detail.dart';
import 'package:i_eats/pages/home/food_page_body.dart';
import 'package:i_eats/pages/home/main_food_page.dart';
import 'package:i_eats/routes/route_helper.dart';
import 'controllers/popular_product_controller.dart';
import 'controllers/recommended_product_controller.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  //wait till all dependencies are loaded
  WidgetsFlutterBinding.ensureInitialized();

  //load the dependencies
  await dep.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();

    /**
     * "GetMaterialApp" will solve "Each child must be laid out exactly once" error
     */
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
       home: MainFoodPage(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}
