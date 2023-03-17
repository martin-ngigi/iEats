//stless
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_eats/utils/colors.dart';
import 'package:i_eats/utils/dimensions.dart';
import 'package:i_eats/widgets/account_widget.dart';
import 'package:i_eats/widgets/big_text.dart';

import '../../widgets/app_icon.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: Container(
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
                            text: "Martin Wainaina"
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
                            text: "+254 797 292290"
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
                            text: "martinwainaina001@gmail.com"
                        )
                    ),
                    SizedBox(height: Dimensions.height20,),

                    //address
                    AccountWidget(
                        appIcon: AppIcon(
                          icon: Icons.location_on,
                          backgroundColor: AppColors.yellowColor,
                          iconColor: Colors.white,
                          iconSize: Dimensions.height10*5/2, //25
                          size: Dimensions.height10*5, //50
                        ),
                        bigText: BigText(
                            text: "Nairobi, Kenya"
                        )
                    ),
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
                            text: "Martin"
                        )
                    ),
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
                            text: "Martin"
                        )
                    ),
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
                            text: "Martin"
                        )
                    ),
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
                            text: "Martin"
                        )
                    ),
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
                            text: "Martin"
                        )
                    ),
                    SizedBox(height: Dimensions.height20,),
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
