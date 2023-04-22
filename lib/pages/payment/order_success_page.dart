import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_eats/base/custom_button.dart';
import 'package:i_eats/routes/route_helper.dart';
import 'package:get/get.dart';
import 'package:i_eats/utils/colors.dart';

import '../../utils/dimensions.dart';

class OrderSuccessPage extends StatelessWidget {
  final String orderID;
  final int status;

  OrderSuccessPage({Key? key, required this.orderID, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(status == 0){
      Future.delayed(
        Duration(seconds: 1), (){
       //
      });
    }

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: Dimensions.screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                status == 1 ? Icons.check_circle_outlined : Icons.warning_amber_outlined,
                size: 100,
                color: AppColors.mainColor,
              ),
              SizedBox(height: 30,),

              SizedBox(height: Dimensions.height45,),

              Text(
                status == 1 ? "You placed the order successfully":
                      "Your order failed",
                style: TextStyle(
                  fontSize: Dimensions.font20,
                ),
              ),

              SizedBox(height: Dimensions.height20,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.height20, vertical: Dimensions.height10),
                child: Text(
                  status == 1? "Success Order" : "Order failed",
                  style: TextStyle(
                    fontSize: Dimensions.font26,
                    color: Theme.of(context).disabledColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: Dimensions.height10),

              Padding(
                padding: EdgeInsets.all(Dimensions.height10),
                child: CustomButton(
                    buttonText: "Go to Home",
                  onPressed: () => Get.offNamed(RouteHelper.getInitial()),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
