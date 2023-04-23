import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:i_eats/base/show_custom_snackbar.dart';
import 'package:i_eats/controllers/order_controller.dart';
import 'package:i_eats/models/order_model.dart';
import 'package:i_eats/utils/colors.dart';
import 'package:i_eats/utils/dimensions.dart';

import '../../base/custom_loader.dart';

class ViewOrder extends StatelessWidget {
  final bool isCurrent;
  const ViewOrder({Key? key, required this.isCurrent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<OrderController>(builder: (orderController){
        if (orderController.isLoading == false){
          late List<OrderModel> orderList;
          if(orderController.currentOrderList.isNotEmpty){
            orderList = isCurrent? orderController.currentOrderList.reversed.toList() : /// get the from latest
                                  orderController.historyOrderList.reversed.toList();
          }
          return Center(
              child: SizedBox(
                width: Dimensions.screenWidth,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width10/2, vertical: Dimensions.height10/2),
                  child: ListView.builder(
                    itemCount: orderList.length,
                      itemBuilder: (context, index){
                        return InkWell(
                          onTap: ()=>null,
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("#Order ID: ${orderList[index].id}"),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        /// order status
                                        Container(
                                            decoration: BoxDecoration(
                                              color: AppColors.mainColor,
                                              borderRadius: BorderRadius.circular(Dimensions.radius20/4)
                                            ), 
                                            child: Container(
                                                margin: EdgeInsets.all(Dimensions.height10/2),
                                                child: Text(
                                                    "${orderList[index].orderStatus}",
                                                  style: TextStyle(
                                                    color: Colors.white
                                                  ),
                                                )
                                            )
                                        ),
                                        SizedBox(height: Dimensions.height10/2,),
                                        InkWell(
                                          onTap: (){
                                            Get.snackbar("Track order", "Track order coming soon...", backgroundColor: Colors.red);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(Dimensions.radius20/4),
                                              border: Border.all(width: 1, color: Theme.of(context).primaryColor),
                                            ),
                                            child: Container(
                                              margin: EdgeInsets.all(Dimensions.height10/2),
                                                child: Text("Track order")
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: Dimensions.height10,),
                            ],
                          ),
                        );
                      }
                  ),
                ),
              )
          );
        }
        else{
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomLoader(),
              SizedBox(height: 10,),
              Text("loading ..."),
            ],
          );
        }

      }),
    );
  }
}
