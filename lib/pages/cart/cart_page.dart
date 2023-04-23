//stless
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_eats/base/common_text_button.dart';
import 'package:i_eats/base/show_custom_snackbar.dart';
import 'package:i_eats/controllers/auth_controller.dart';
import 'package:i_eats/controllers/cart_controller.dart';
import 'package:i_eats/controllers/location_controller.dart';
import 'package:i_eats/controllers/order_controller.dart';
import 'package:i_eats/controllers/popular_product_controller.dart';
import 'package:i_eats/controllers/recommended_product_controller.dart';
import 'package:i_eats/controllers/user_controller.dart';
import 'package:i_eats/models/place_order_model.dart';
import 'package:i_eats/pages/auth/sign_in_page.dart';
import 'package:i_eats/pages/home/main_food_page.dart';
import 'package:i_eats/pages/orders/delivery_options.dart';
import 'package:i_eats/utils/app_constants.dart';
import 'package:i_eats/utils/colors.dart';
import 'package:i_eats/utils/dimensions.dart';
import 'package:i_eats/utils/styles.dart';
import 'package:i_eats/widgets/app_icon.dart';
import 'package:i_eats/widgets/app_text_field.dart';
import 'package:i_eats/widgets/big_text.dart';
import 'package:i_eats/pages/orders/payment_option_button.dart';
import 'package:i_eats/widgets/small_text.dart';

import '../../base/no_data_page.dart';
import '../../routes/route_helper.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _noteController = TextEditingController();
    return Scaffold(
      body: Stack(
        children: [
          //header
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
          //body
          GetBuilder<CartController>(builder: (_cartController){
            //if lenght is empty... then show NoDataPage, else show cart items
            return _cartController.getItems.length>0?Positioned(
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
                                        if(recommendedIndex<0){//product not present from recommended page... this is because one came from cart history. The reason is because: history products may be >1 year old of which they might not be present in the current products(popular/recommended).
                                          //show message
                                          Get.snackbar("History product", "Product review is not available for history product",
                                              backgroundColor: AppColors.mainColor,
                                              colorText: Colors.white
                                          );
                                        }
                                        else{
                                          Get.toNamed(RouteHelper.getRecommendedFood(recommendedIndex, "cartpage"));
                                        }
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
            ):NoDataPage(text: "Your cart is empty!",);
          })
        ],
      ),
      bottomNavigationBar: GetBuilder<OrderController>(builder: (orderController){
        _noteController.text = orderController.foodNote; //set food note that was previously set in case one closes the bottomsheet
        return GetBuilder<CartController>(builder: (cartController){
          return Container(
            height: Dimensions.bottomHeightBar+50,
            padding: EdgeInsets.only(top: Dimensions.height10,
                bottom: Dimensions.height10,
                left: Dimensions.width20,
                right: Dimensions.width20
            ),
            decoration: BoxDecoration(
                color: AppColors.buttonBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20*2),
                  topRight:  Radius.circular(Dimensions.radius20*2),
                )
            ),
            //if cart not empty, show bottom button, else show empty container
            child: cartController.getItems.length>0?Column(
              children: [
                InkWell(
                  onTap: () => showModalBottomSheet(
                      backgroundColor: Colors.transparent, /// Add this line so that to be able to see the top corner
                      context: context,
                      builder: (_){
                        return Column(
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                child: Container(
                                  height: MediaQuery.of(context).size.height*0.9, ///i.e, 500
                                  decoration: BoxDecoration(
                                      color: Colors.yellow[50],
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(Dimensions.radius20),
                                        topRight: Radius.circular(Dimensions.radius20),
                                      )
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        // color: Colors.red,
                                        height: 520,
                                        padding: EdgeInsets.only(
                                          left: Dimensions.width20,
                                          right: Dimensions.width20,
                                          top: Dimensions.height20,
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const PaymentOptionButton(
                                                icon: Icons.money,
                                                title: "Cash on delivery",
                                                subTitle: "You pay after getting the delivery",
                                                index: 0
                                            ),
                                            SizedBox(height: Dimensions.height10,),
                                            const PaymentOptionButton(
                                                icon: Icons.paypal_outlined,
                                                title: "Digital payment",
                                                subTitle: "Safer and faster way to send money",
                                                index: 1
                                            ),
                                            SizedBox(height: Dimensions.height30,),

                                            Text("Delivery options", style: robotoMedium,),
                                            SizedBox(height: Dimensions.height10/2,),
                                            DeliveryOptions(
                                                value: "delivery",
                                                title: "home delivery",
                                                amount: cartController.totalAmount.toDouble(),
                                                isFree: false
                                            ),
                                            SizedBox(height: Dimensions.height10/2,),
                                            DeliveryOptions(
                                                value: "take away",
                                                title: "take away",
                                                amount: cartController.totalAmount.toDouble(),
                                                isFree: true
                                            ),
                                            SizedBox(height: Dimensions.height20,),
                                            Text("Additional notes", style: robotoMedium,),
                                            AppTextField(
                                              textController: _noteController,
                                              hintText: 'add notes...',
                                              icon: Icons.note,
                                              textType: TextInputType.text,
                                              maxLines: true, // this will increase the height size of textfield
                                            )


                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                  ).whenComplete((){
                    // print("${_noteController.text}")
                    orderController.setFoodNote(_noteController.text.trim());
                  }), /// this will print the inserted text when the botomsheet is closes
                  child: SizedBox(
                    width: double.maxFinite,
                    child: CommonTextButton(text: "Payment options"),
                  ),
                ),
                SizedBox(height: Dimensions.height10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius20),
                          color: Colors.white
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: Dimensions.height10/2,),
                          BigText(text: "Ksh "+cartController.totalAmount.toString()),
                          SizedBox(width: Dimensions.height10/2,),
                        ],
                      ),
                    ),
                    GestureDetector(
                        onTap: (){
                          // this will clear the current cart, and store to history cart
                          if(Get.find<AuthController>().userLoggedIn()){
                            /// user is logged in
                            print("----> [Cart Page] Tapped, user is logged in");
                            //cartController.addToHistory();

                            print("Address List is ${Get.find<LocationController>().addressList}");
                            // user addressList is empty
                            if(Get.find<LocationController>().addressList.isEmpty){
                              //Navigate to Address Page
                              Get.toNamed(RouteHelper.getAddressPage());
                            }
                            else{
                              /// navigate to home page
                              //Get.offNamed(RouteHelper.getPaymentPage("100003", Get.find<UserController>().userModel!.id!));
                              //Get.offNamed(RouteHelper.getPaymentPage("100003", 73));

                              var location = Get.find<LocationController>().getUserAddress();
                              var cart = Get.find<CartController>().getItems;
                              var user = Get.find<UserController>().userModel;

                              PlaceOrderBody placeOrder = PlaceOrderBody(
                                  cart: cart,
                                  orderAmount: 100.0,
                                  distance: 10.0,
                                  scheduleAt: '',
                                  orderNote: orderController.foodNote,
                                  address: location.address,
                                  latitude: location.latitude,
                                  longitude: location.longitude,
                                  contactPersonName: user.name,
                                  contactPersonNumber: user.phone,
                                  orderType: orderController.orderType,
                                  paymentMethod: orderController.paymentIndex==0?"cash_on_delivery":"digital_payment",
                              );

                              //print(" \n\n\n\nMy type is: ${placeOrder.toJson()['order_type']}");

                              /**
                               * 1. Place  an Order by calling placeOrder() method in OrderController
                               * 2. if placeOrder() is successful, it will call _callBack function
                               */
                              Get.find<OrderController>().placeOrder(placeOrder, _callBack);

                            }
                          }
                          else{
                            /// user is not logged in so redirect to sign in page
                            print("----> [Cart Page] Tapped, user is NOT logged in");
                            Get.toNamed(RouteHelper.getSignInPage());
                          }
                        },
                        child: CommonTextButton(text: "chek out")
                    )
                  ],
                ),
              ],
            ): Container(),
          );
        });
      }),
    );
  }

  void _callBack(bool isSuccess, String message, String orderID){
    if(isSuccess){
      Get.find<CartController>().clear(); /// clear the cart once the payment was successful
     Get.find<CartController>().removeCartSharedPreference();/// clear local storage
      Get.find<CartController>().addToHistory();
      if(Get.find<OrderController>().paymentIndex == 0){
        /// if one chose "Cash on delivery"
        Get.offNamed(RouteHelper.getOrderSuccessPage(orderID, "success"));

      }
      else{
        /// if one chose "Digital payment"
        Get.offNamed(RouteHelper.getPaymentPage(orderID, Get.find<UserController>().userModel.id));
      }
    }
    else{
      showCustomSnackBar(message);
    }
  }
}
