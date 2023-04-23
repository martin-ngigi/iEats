import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_eats/controllers/order_controller.dart';
import 'package:i_eats/utils/dimensions.dart';
import 'package:i_eats/utils/styles.dart';
import 'package:get/get.dart';

class DeliveryOptions extends StatelessWidget {
  final String value;
  final String title;
  final double amount;
  final bool isFree;

  const DeliveryOptions({Key? key,
    required this.value,
    required this.title,
    required this.amount,
    required this.isFree}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(builder: (orderController){
      return Row(
        children: [
          Radio(
            onChanged: (String? value){
              //print(value);
              orderController.setDeliveryType(value!);
            },
            groupValue: orderController.orderType,
            value: value,
            activeColor: Theme.of(context).primaryColor,
          ),
          SizedBox(width: Dimensions.width10/2,),
          Text(
            title,
            style: robotoRegular,
          ),
          SizedBox(width: Dimensions.width10/2,),
          Text(
            "(${(value == "take away" || isFree ) ? "free" : "Ksh ${amount/10}"})",
            style: robotoMedium,
          )
        ],
      );
    });
  }
}
