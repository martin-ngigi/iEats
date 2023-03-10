//stless
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:i_eats/controllers/popular_product_controller.dart';
import 'package:i_eats/routes/route_helper.dart';
import 'package:i_eats/utils/colors.dart';
import 'package:i_eats/widgets/app_icon.dart';
import 'package:i_eats/widgets/big_text.dart';
import 'package:i_eats/widgets/expandable_text_widgett.dart';

import '../../controllers/cart_controller.dart';
import '../../controllers/recommended_product_controller.dart';
import '../../utils/app_constants.dart';
import '../../utils/dimensions.dart';
import '../cart/cart_page.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;
  const RecommendedFoodDetail({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<RecommendedProductController>().recommendedProductList[pageId]!;
    Get.find<PopularProductController>().initProduct(product, Get.find<CartController>());

    return  Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,//dont show back arrow
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: (){
                      //navigate to main page
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(icon: Icons.clear)
                ),
                //AppIcon(icon: Icons.shopping_cart_outlined),

                //cart icon
                GetBuilder<PopularProductController>(builder: (controller){
                  return Stack(
                    children: [
                      AppIcon(icon: Icons.shopping_cart_outlined,),
                      //totalItems is greater than 1, show number of items, else dont show number items
                      Get.find<PopularProductController>().totalItems>=1?
                      Positioned(
                          right: 0, top: 0,
                          child: GestureDetector(
                            onTap: (){
                              Get.to(()=>CartPage());
                            },
                            child: AppIcon(
                              icon: Icons.circle,
                              size: 20,
                              iconColor: Colors.transparent,
                              backgroundColor: AppColors.mainColor,
                            ),
                          )
                      ):
                      Container(),
                      Get.find<PopularProductController>().totalItems>=1?
                      Positioned(
                        right: 3, top: 3,
                        child: BigText(text: Get.find<PopularProductController>().totalItems.toString(),
                          size: 12, color: Colors.black,
                        ),
                      ):
                      Container(),
                    ],
                  );
                }),

              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                //margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, ),
                child: Center( child:  BigText(size: Dimensions.font26, text: product.name!),),
                width: double.maxFinite,//complete width
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  )
                ),
              ),
            ),
            pinned: true,
            backgroundColor: Colors.yellow,
            expandedHeight: 300, //expands from 300 to 350
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                  //"assets/images/food1.png",
                AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),

            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  child: ExpandableTextWidget(
                    text: product.description,
                  ),
                  margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
                ),
              ],
            )
          )
        ],
      ),

      //used "PopularProductController" since it contains cart methods
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (controller){
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(
                left: Dimensions.width20*2.5, // 50
                right: Dimensions.width20*2.5, // 50
                top: Dimensions.height10,
                bottom: Dimensions.height10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //DECREASE CART
                  GestureDetector(
                    onTap: (){
                      controller.setQuantity(false);
                    },
                    child: AppIcon(
                        iconSize: Dimensions.iconSize24,
                        iconColor: Colors.white,
                        backgroundColor: AppColors.mainColor,
                        icon: Icons.remove
                    ),
                  ),
                  BigText(text: "Ksh ${product.price!} X ${controller.inCartItems} ", color: AppColors.titleColor, size: Dimensions.font26,),
                  //INCREASE CART
                  GestureDetector(
                    onTap: (){
                      controller.setQuantity(true);
                    },
                    child: AppIcon(
                        iconSize: Dimensions.iconSize24,
                        iconColor: Colors.white,
                        backgroundColor: AppColors.mainColor,
                        icon: Icons.add
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: Dimensions.bottomHeightBar,
              padding: EdgeInsets.only(top: Dimensions.height30, bottom: Dimensions.height30, left: Dimensions.width20, right: Dimensions.width20),
              decoration: BoxDecoration(
                  color: AppColors.buttonBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20*2),
                    topRight:  Radius.circular(Dimensions.radius20*2),
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                        color: Colors.white
                    ),
                    child: Icon(
                      Icons.favorite,
                      // color: AppColors.mainColor,
                      color: Colors.red,
                    ),
                  ),
                  /**
                   * ADD TO CART
                   */
                  GestureDetector(
                    onTap: (){
                      controller.addItem(product);
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
                      child: BigText(text: "Ksh ${product.price!} | Add to cart", color: Colors.white,),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                        color: AppColors.mainColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
