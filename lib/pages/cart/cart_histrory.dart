//stless
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:i_eats/controllers/cart_controller.dart';
import 'package:i_eats/utils/app_constants.dart';
import 'package:i_eats/utils/colors.dart';
import 'package:i_eats/utils/dimensions.dart';
import 'package:i_eats/widgets/app_icon.dart';
import 'package:i_eats/widgets/big_text.dart';
import 'package:i_eats/widgets/small_text.dart';
import 'package:intl/intl.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var getCartHistoryList = Get.find<CartController>().getCartHistoryList();
    Map<String, int> cartItemsPerOrder = Map();

    for(int i=0; i<getCartHistoryList.length; i++ ){
      if(cartItemsPerOrder.containsKey(getCartHistoryList[i].time)){
        //present in the cartItemsPerOrder,so update the existing one and increment the value
        cartItemsPerOrder.update(getCartHistoryList[i].time!, (value)=>++value);
      }
      else{
        //not present in the cartItemsPerOrder, so create a new one with an initial value of 1
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, ()=>1);
      }
    }

    //print categories grouped according to time
    //print("print categories grouped according to time");
    //print(cartItemsPerOrder);

    //obtain order times
    List<int> cartOrderTimeToList(){
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }

    //convert order times to list of ints
    List<int> itemsPerOder = cartOrderTimeToList();

    //print order times
    //print("print the number order times");
    //print(itemsPerOder);

    var listCounter = 0;

    return Scaffold(
      body: Column(
        children: [
          //header or app bar
          Container(
            height: 100,
            color: AppColors.mainColor,
            width: double.maxFinite,
            padding: EdgeInsets.only(top: 45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BigText(text: "Cart History", color: Colors.white,),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                  iconColor: AppColors.mainColor,
                  backgroundColor: AppColors.yellowColor,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                top: Dimensions.height20,
                left: Dimensions.width20,
                right: Dimensions.width20,
              ),
              child: MediaQuery.removePadding(context: context,
                removeTop: true,
                child: ListView(
                    //NB LISTVIEW NEEDS HEIGHT PROPERTY FROM THE PARENT WIDGET.... IF NOT SO, USE EXPANDED WIDGET AS THE PARENT SINCE ITS HEIGHT IS DYNAMIC
                    // ListView is acting as column... we used ListView instead of ListView.builder because ListView can handle complex things
                    //MediaQuery.removePadding will remove top padding associated with ListView
                    children: [
                      for(int i =0; i<itemsPerOder.length; i++)
                        Container(
                          height: 120, //120
                          margin: EdgeInsets.only(bottom: Dimensions.height20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //BigText(text: getCartHistoryList[listCounter].time!),
                              //processing dart code inside a for loop using I.E.F (immediately invoke functions)
                              ((){
                                //process date
                                DateTime parseDate = DateFormat("yyyy-MM-dd HH:mm:ss").parse(getCartHistoryList[listCounter].time!);
                                var inputDate = DateTime.parse(parseDate.toString());
                                var outputFormat = DateFormat("MM/dd/yyyy hh:mm a");
                                var outputDate = outputFormat.format(inputDate);
                                return BigText(text: outputDate);
                              }()),
                              SizedBox(height: Dimensions.height10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Wrap( //Wrap enables on to draw widgets repeatedly
                                    direction: Axis.horizontal,
                                    children: List.generate(itemsPerOder[i], (index) {
                                      //increment list counter,, and also prevent overflow error
                                      if(listCounter<getCartHistoryList.length){
                                        listCounter++;
                                      }
                                      //check number of images to show
                                      //if number of images is <=2, show the images, else..
                                      return index<=2?Container(
                                        width: 80,
                                        height: 80,
                                        margin: EdgeInsets.only(right: Dimensions.height10/2),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(Dimensions.radius15/2),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                AppConstants.BASE_URL+AppConstants.UPLOAD_URL+getCartHistoryList[listCounter-1].img!
                                            ),
                                          ),
                                        ),
                                      ): Container();
                                    }),
                                  ),
                                  Container(
                                    height: 80,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SmallText(text: "Total", color: AppColors.titleColor,),
                                        BigText(text: itemsPerOder[i].toString()+" Items", color: AppColors.titleColor,),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: Dimensions.width10,
                                              vertical: Dimensions.height10/2),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(Dimensions.height15/3),
                                            border: Border.all(width: 1, color: AppColors.mainColor),
                                          ),
                                          child: SmallText(text: "One more", color: AppColors.mainColor,),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
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
      ),
    );
  }
}
