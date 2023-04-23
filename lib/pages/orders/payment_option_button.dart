import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_eats/controllers/order_controller.dart';
import 'package:i_eats/utils/dimensions.dart';
import 'package:i_eats/utils/styles.dart';
import 'package:get/get.dart';

class PaymentOptionButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;
  final int index;
  const PaymentOptionButton({Key? key,
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(builder: (orderController){
      bool _selected = orderController.paymentIndex == index;
      return InkWell(
        onTap: () {
          print("-----> [PaymentOptionButton] Index clicked is $index");
          orderController.setPaymentIndex(index);
        },
        child: Container(
          padding: EdgeInsets.only(bottom: Dimensions.height10/2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20/4),
              color: Theme.of(context).cardColor,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[200]!,
                    blurRadius: 5,
                    spreadRadius: 1
                )
              ]
          ),
          child: ListTile(
            leading: Icon(
              icon,
              size: 40,
              /// if true show the color icon of only the selected index of type of payment else show disabledColor
              color: _selected ? Theme.of(context).primaryColor : Theme.of(context).disabledColor,
            ),
            title: Text(
              title,
              style: robotoMedium.copyWith(
                  fontSize: Dimensions.font20
              ),
            ),
            subtitle: Text(
              subTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: robotoRegular.copyWith(
                fontSize: Dimensions.font16,
                color: Theme.of(context).disabledColor,
              ),
            ),
            /// show the checked icon of only the selected index of type of payment
            trailing: _selected ? Icon(
              Icons.check_circle,
              color: Theme.of(context).primaryColor,
            ) : SizedBox(),
          ),
        ),
      );
    });
  }
}
