//stless
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_eats/controllers/cart_controller.dart';
import 'package:i_eats/controllers/popular_product_controller.dart';
import 'package:i_eats/controllers/recommended_product_controller.dart';
import 'package:i_eats/pages/home/main_food_page.dart';
import 'package:i_eats/utils/app_constants.dart';
import 'package:i_eats/utils/colors.dart';
import 'package:i_eats/utils/dimensions.dart';
import 'package:i_eats/widgets/app_icon.dart';
import 'package:i_eats/widgets/big_text.dart';
import 'package:i_eats/widgets/small_text.dart';

import '../../routes/route_helper.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.height20*3,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
                SizedBox(width: Dimensions.width20*5,),
                GestureDetector(
                  onTap: (){
                    //navigate to ome
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
              ],
            ),
          ),
          Positioned(
              top: Dimensions.height20*5,
              left: Dimensions.width20,
              right: Dimensions.width20,
              bottom: 0,
              child: Container(
                margin: EdgeInsets.only(top: Dimensions.height15),
                //color: Colors.red,
                //MediaQuery.removePadding will remove the top padding from the ListView.builder
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  //MediaQuery.removePadding will remove the top padding from the ListView.builder
                  child: GetBuilder<CartController>(builder: (cartController){
                    var _cartList = cartController.getItems;
                    return ListView.builder(
                        itemCount: _cartList.length,
                        itemBuilder: (_, index){
                          return Container(
                            width: double.maxFinite,
                            height: Dimensions.height20*5,
                            //color: Colors.blue,
                            //margin: EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    //get popular Index from popularProductList
                                    var popularIndex = Get.find<PopularProductController>()
                                        .popularProductList.indexOf(_cartList[index].product!);
                                    if(popularIndex>=0){
                                      //navigate to popular food page
                                      Get.toNamed(RouteHelper.getPopularFood(popularIndex, "cartpage"));
                                    }
                                    else{
                                      //could not get popular Index from popularProductList so the index is less 0,
                                      var recommendedIndex = Get.find<RecommendedProductController>()
                                          .recommendedProductList.indexOf(_cartList[index].product!);
                                      //navigate to recommended food page
                                      Get.toNamed(RouteHelper.getRecommendedFood(recommendedIndex, "cartpage"));
                                    }
                                  },
                                  child: Container(
                                    width: Dimensions.height20*5,
                                    height: Dimensions.height20*5,
                                    margin: EdgeInsets.only(bottom: Dimensions.height10),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          // image: AssetImage(
                                          //     "assets/images/food1.png"
                                          // )
                                        image: NetworkImage(
                                          AppConstants.BASE_URL+AppConstants.UPLOAD_URL+ cartController.getItems[index].img!
                                        ),
                                      ),
                                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(width: Dimensions.width10,),
                                //Container inside Expanded will take the entire width
                                Expanded(child: Container(
                                  height: Dimensions.height20*5,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      BigText(text: cartController.getItems[index].name!, color: Colors.black54,),
                                      SmallText(text: "Spicy"),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          BigText(text: cartController.getItems[index].price!.toString(), color: Colors.redAccent,),
                                          Container(
                                            padding: EdgeInsets.only(top: Dimensions.height10, bottom: Dimensions.height10, left: Dimensions.width10, right: Dimensions.width10),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(Dimensions.radius20),
                                                color: Colors.white
                                            ),
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                    onTap: (){
                                                      cartController.addItem(_cartList[index].product!, -1); //decrease
                                                    },
                                                    child: Icon(Icons.remove, color: AppColors.signColor,)
                                                ),
                                                SizedBox(width: Dimensions.height10/2,),
                                                BigText(text: _cartList[index].quantity.toString()), //popularProduct.inCartItems.toString()),
                                                SizedBox(width: Dimensions.height10/2,),
                                                GestureDetector(
                                                    onTap: (){
                                                      cartController.addItem(_cartList[index].product!, 1); //increase
                                                      print("increase ++");
                                                    },
                                                    child: Icon(Icons.add, color: AppColors.signColor,)
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                              ],
                            ),
                          );
                        }
                    );
                  }),
                ),
              )
          )
        ],
      ),
    );
  }
}
