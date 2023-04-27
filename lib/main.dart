/**
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
**/
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:i_eats/controllers/cart_controller.dart';
import 'package:i_eats/helper/notification_helper.dart';
import 'package:i_eats/pages/auth/sign_in_page.dart';
import 'package:i_eats/pages/auth/sign_up_page.dart';
import 'package:i_eats/pages/cart/cart_page.dart';
import 'package:i_eats/pages/examples/check_page_size.dart';
import 'package:i_eats/pages/food/popular_food_detail.dart';
import 'package:i_eats/pages/food/recommended_food_detail.dart';
import 'package:i_eats/pages/home/food_page_body.dart';
import 'package:i_eats/pages/home/main_food_page.dart';
import 'package:i_eats/pages/examples/my_animated_background.dart';
import 'package:i_eats/pages/examples/simple_app_bar_popup_menu_button.dart';
import 'package:i_eats/pages/splash/splash_page.dart';
import 'package:i_eats/routes/route_helper.dart';
import 'package:i_eats/utils/colors.dart';
import 'package:sizer/sizer.dart';
import 'controllers/popular_product_controller.dart';
import 'controllers/recommended_product_controller.dart';
import 'helper/dependencies.dart' as dep;
import 'pages/examples/main_google_maps.dart';

/// FCM Notifications
/**
Future<dynamic> myBackgroundMessageHandler(RemoteMessage message) async{
  print("--------->[main] onBackground: ${message.notification?.title}/${message.notification?.body}"
      "/${message.notification?.titleLocKey}");
}
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
*/
Future<void> main() async {
  //wait till all dependencies are loaded
  WidgetsFlutterBinding.ensureInitialized();

  //load the dependencies
  await dep.init();

  /// FCM Notifications
  /**
  // initialize firebase.
  // setPathUrlStrategy();
  await Firebase.initializeApp();



  try{
    if(GetPlatform.isMobile){
      final RemoteMessage? remoteMessage =  await FirebaseMessaging.instance.getInitialMessage();
      await NotificationHelper.initialize(flutterLocalNotificationsPlugin);
      FirebaseMessaging.onBackgroundMessage(myBackgroundMessageHandler);
    }
  }
  catch(e){
    if(kDebugMode){
      print("--------->[main] onBackground: ${e.toString()}");
    }
  }
  */

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /**
     * "GetMaterialApp" will solve "Each child must be laid out exactly once" error
     */

    /**
     * Use Nested GetBuilder to solve following errors
     * 1.  "PopularProductController" not found. You need to call
        "Get.put(PopularProductController())" or "Get.lazyPut(()=>PopularProductController())"
     * 2. "RecommendedProductController" not found. You need to call
        "Get.put(RecommendedProductController())" or
        "Get.lazyPut(()=>RecommendedProductController())"
     */

    Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(builder: (_){
      return GetBuilder<RecommendedProductController>(builder: (_){
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          //home: SignInPage(),
          //home: SplashScreen(),
          initialRoute: RouteHelper.getSplashPage(),
          getPages: RouteHelper.routes,
          theme: ThemeData(
            primaryColor: AppColors.mainColor,
            fontFamily: "Lato"
          ),
        );
      });
    });
  }
}
