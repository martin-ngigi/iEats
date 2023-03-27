//stless
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:i_eats/base/custom_loader.dart';
import 'package:i_eats/controllers/auth_controller.dart';
import 'package:i_eats/controllers/cart_controller.dart';
import 'package:i_eats/controllers/location_controller.dart';
import 'package:i_eats/controllers/user_controller.dart';
import 'package:i_eats/routes/route_helper.dart';
import 'package:i_eats/utils/colors.dart';
import 'package:i_eats/utils/dimensions.dart';
import 'package:i_eats/widgets/account_widget.dart';
import 'package:i_eats/widgets/big_text.dart';

import '../../widgets/app_icon.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if(_userLoggedIn){
      Get.find<UserController>().getUserInfo();
      print("-------[AccountPage] User has logged in");
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: BigText(
          text: "Profile",
          size: 24,
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: GetBuilder<UserController>(builder: (userController){
        return _userLoggedIn? (
                userController.isLoading? Container(
              width: double.maxFinite,
              margin: EdgeInsets.only(top: Dimensions.height20),
              child: Column(
                children: [
                  //profile icon
                  AppIcon(
                    icon: Icons.person,
                    backgroundColor: AppColors.mainColor,
                    iconColor: Colors.white,
                    iconSize: Dimensions.height30+Dimensions.height45, //75
                    size: Dimensions.height15*10, //150
                  ),
                  SizedBox(height: Dimensions.height30,),

                  Expanded(
                    child: SingleChildScrollView( //must be inside Expanded so that to be scrollable
                      child: Column(
                        children: [

                          //Name
                          AccountWidget(
                              appIcon: AppIcon(
                                icon: Icons.person,
                                backgroundColor: AppColors.mainColor,
                                iconColor: Colors.white,
                                iconSize: Dimensions.height10*5/2, //25
                                size: Dimensions.height10*5, //50
                              ),
                              bigText: BigText(
                                /// Name
                                  text: userController.userModel.name
                              )
                          ),
                          SizedBox(height: Dimensions.height20,),

                          //phone
                          AccountWidget(
                              appIcon: AppIcon(
                                icon: Icons.phone,
                                backgroundColor: AppColors.yellowColor,
                                iconColor: Colors.white,
                                iconSize: Dimensions.height10*5/2, //25
                                size: Dimensions.height10*5, //50
                              ),
                              bigText: BigText(
                                  text: userController.userModel.phone
                              )
                          ),
                          SizedBox(height: Dimensions.height20,),

                          //email
                          AccountWidget(
                              appIcon: AppIcon(
                                icon: Icons.email,
                                backgroundColor: AppColors.yellowColor,
                                iconColor: Colors.white,
                                iconSize: Dimensions.height10*5/2, //25
                                size: Dimensions.height10*5, //50
                              ),
                              bigText: BigText(
                                  text: userController.userModel.email
                              )
                          ),
                          SizedBox(height: Dimensions.height20,),

                          //address
                          GetBuilder<LocationController>(builder: (locationController){
                             if(_userLoggedIn && locationController.addressList.isEmpty){
                              return GestureDetector(
                                onTap: (){
                                  //navigate to address page
                                  Get.offNamed(RouteHelper.getAddressPage());
                                },
                                child: AccountWidget(
                                    appIcon: AppIcon(
                                      icon: Icons.location_on,
                                      backgroundColor: AppColors.yellowColor,
                                      iconColor: Colors.white,
                                      iconSize: Dimensions.height10*5/2, //25
                                      size: Dimensions.height10*5, //50
                                    ),
                                    bigText: BigText(
                                        text: "Fill in your address"
                                    )
                                ),
                              );
                            }
                             else{
                               return GestureDetector(
                                 onTap: (){
                                   //navigate to address page
                                   Get.offNamed(RouteHelper.getAddressPage());
                                 },
                                 child: AccountWidget(
                                     appIcon: AppIcon(
                                       icon: Icons.location_on,
                                       backgroundColor: AppColors.yellowColor,
                                       iconColor: Colors.white,
                                       iconSize: Dimensions.height10*5/2, //25
                                       size: Dimensions.height10*5, //50
                                     ),
                                     bigText: BigText(
                                         text: "Your address"
                                     )
                                 ),
                               );
                             }
                          }),
                          SizedBox(height: Dimensions.height20,),

                          //message
                          AccountWidget(
                              appIcon: AppIcon(
                                icon: Icons.message_outlined,
                                backgroundColor: Colors.redAccent,
                                iconColor: Colors.white,
                                iconSize: Dimensions.height10*5/2, //25
                                size: Dimensions.height10*5, //50
                              ),
                              bigText: BigText(
                                  text: "Messages"
                              )
                          ),
                          SizedBox(height: Dimensions.height20,),

                          //log out
                          GestureDetector(
                            onTap: (){
                              if(Get.find<AuthController>().userLoggedIn()){ /// check if user is logged in first
                                ///clear all shared preference data from the local storage.
                                Get.find<AuthController>().clearSharedData();

                                /// clear all cart data
                                Get.find<CartController>().clear();
                                Get.find<CartController>().clearCartHistory();

                                /// Navigate to sign in page
                                Get.offNamed(RouteHelper.getSignInPage());

                                /// show snack bar
                                Get.snackbar("Logged out", "You have logged out successfully");

                              }

                            },
                            child: AccountWidget(
                                appIcon: AppIcon(
                                  icon: Icons.power_settings_new_outlined,
                                  backgroundColor: Colors.redAccent,
                                  iconColor: Colors.white,
                                  iconSize: Dimensions.height10*5/2, //25
                                  size: Dimensions.height10*5, //50
                                ),
                                bigText: BigText(
                                    text: "Log Out"
                                )
                            ),
                          ),
                          SizedBox(height: Dimensions.height20,),

                          //About
                          AccountWidget(
                              appIcon: AppIcon(
                                icon: Icons.info,
                                backgroundColor: Colors.green,
                                iconColor: Colors.white,
                                iconSize: Dimensions.height10*5/2, //25
                                size: Dimensions.height10*5, //50
                              ),
                              bigText: BigText(
                                  text: "About"
                              )
                          ),
                          SizedBox(height: Dimensions.height20,),
                        ],
                      ),
                    ),
                  )

                ],
              ),
            )
                    : CustomLoader()
            )
            : Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: double.maxFinite,
                      height: Dimensions.height20*8,
                      margin: EdgeInsets.only(
                          left: Dimensions.width20,
                          right: Dimensions.width20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                        image: DecorationImage(
                            image: AssetImage("assets/images/signintocontinue.png"),
                        )
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(RouteHelper.getSignInPage());
                      },
                      child: Container(
                        width: double.maxFinite,
                        height: Dimensions.height20*5,
                        margin: EdgeInsets.only(
                            left: Dimensions.width20,
                            right: Dimensions.width20,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(Dimensions.radius20),
                        ),
                        child: Center(
                            child: BigText(text: "SignIn",
                              color: Colors.white,
                              size: Dimensions.font26,
                            )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
      }),
    );
  }
}
