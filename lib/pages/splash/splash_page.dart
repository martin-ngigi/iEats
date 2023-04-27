//stfull
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:i_eats/controllers/auth_controller.dart';
import 'package:i_eats/routes/route_helper.dart';

import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';
import '../../utils/dimensions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {

  late Animation<double> animation;
  late AnimationController controller;

  Future<void> _loadResources() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  void initState() {
    _loadResources();

    /**
     * NOTIFICATIONS
     */
    // Get.find<AuthController>().updateToken();

    super.initState();
    //initialize animation.
    controller = AnimationController(
        vsync: this, // comes from TickerProviderStateMixin
        duration: const Duration(seconds: 2)
    )..forward();
    //type of animation
    animation = CurvedAnimation(
        parent: controller,
        curve: Curves.linear
    );

    Timer(Duration(seconds: 3), () {
      //navigate to home page
      Get.offNamed(RouteHelper.getInitial());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            child: Center(
              child: Image.asset(
                "assets/images/logo part 1.png",
                width: Dimensions.splashImg,
              ),
            ),
          ),
          Center(
            child: Image.asset(
              "assets/images/logo part 2.png",
              width: 250,
            ),
          ),
        ],
      ),
    );
  }
}
