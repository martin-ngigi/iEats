//stless
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_column.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/expandable_text_widgett.dart';
import '../../widgets/icon_and_text_widget.dart';
import '../../widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
          Positioned(
            left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImgSize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                          "assets/images/food1.png"
                      ),
                  )
                ),
              ),
          ),
          //icon widgets
          Positioned(
            top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.arrow_back_ios,),
                  AppIcon(icon: Icons.shopping_cart_outlined,),
                ],
              )
          ),
          //introduction of food
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImgSize -20,
            child: Container(
              padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20),
                  topLeft: Radius.circular(Dimensions.radius20),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text: "Kenyan Side",),
                  SizedBox(height: Dimensions.height20,),
                  BigText(text: "Introduce"),
                  SizedBox(height: Dimensions.height20,),
                  Expanded(
                      child: SingleChildScrollView(
                        child:  ExpandableTextWidget(text: "Biryani is a mixed rice dish originating among the Muslims of the Indian subcontinent. It is made with Indian spices, rice, and usually some type of meat (chicken, beef, goat, lamb, prawn, and fish), or in some cases without any meat, and sometimes, in addition, eggs and potatoes.[1]Biryani is one of the most popular dishes in South Asia, as well as among the diaspora from the region. Similar dishes are also prepared in other parts of the world such as in Iraq, Myanmar, Thailand, and Malaysia.[2] Biryani is the single most-ordered dish on Indian online food ordering and delivery services, and has been labelled as the most popular dish overall in India.[3][4]. One theory states that it originated from birinj (Persian: برنج), the Persian word for rice.[5][6] Another theory states that it is derived from biryan or beriyan (Persian: بریان), which means to fry or to roast.[7][8] It may alternatively be related to the Persian word bereshtan (Persian: برشتن) which also means to roast (onions), as the dish is often prepared by flavouring rice with fried onions and meat, besides mild spices. Persian was used as an official language in different parts of medieval India by various Islamic dynasties.[9][10]"
                              "Origin \n The exact origin of the dish is uncertain. In North India, different varieties of biryani developed in the Muslim centres of Delhi (Mughlai cuisine), Rampur, Lucknow (Awadhi cuisine) and other small principalities. In South India, where rice is more widely used as a staple food, several distinct varieties of biryani emerged from Hyderabad Deccan (where some believe the dish originated[11]) as well as Tamil Nadu (Ambur, Thanjavur, Chettinad, Salem, Dindigal), Kerala (Malabar), Telangana, and Karnataka (Bhatkal) where Muslim communities were present.[5][12] \nAccording to historian Lizzie Collingham, the modern biryani developed in the royal kitchens of the Mughal Empire (1526–1857) and is a mix of the native spicy rice dishes of India and the Persian pilaf.[13] Indian restaurateur Kris Dhillon believes that the dish originated in Persia, and was brought to India by the Mughals.[14]"
                              "\nAnother theory claims that the dish was prepared in India before the first Mughal emperor Babur conquered India.[15] The 16th-century Mughal text Ain-i-Akbari makes no distinction between biryanis and pilaf (or pulao): it states that the word biryani is of older usage in India.[16] A similar theory, that biryani came to India with Timurs invasion, appears to be incorrect because there is no record of biryani having existed in his native land during that period.[15]"
                              "\nAccording to Pratibha Karan, who wrote the book Biryani, biryani is of Mughal origin, derived from pilaf varieties brought to the Indian subcontinent by Arab traders. She speculates that the pulao was an army dish in medieval India. Armies would prepare a one-pot dish of rice with whichever meat was available. Over time, the dish became biryani due to different methods of cooking, with the distinction between pulao and biryani being arbitrary.[5][15]"
                              "\nAccording to Vishwanath Shenoy, the owner of a biryani restaurant chain in India, one branch of biryani comes from the Mughals, while another was brought by the Arab traders to Malabar in South India.[17]"
                              "\nThere are various apocryphal stories dating the invention to Shah Jahan's time but Rana Safvi, the distinguished historian, says she could only find a recipe from the later Mughal period, from Bahadur Shah Zafar's time. It is not her claim that there was no biryani before that; just that she has not found a recipe. Other historians who have gone through texts say that the first references to biryani only appear around the 18th century.",)
                      )
                  ),

                ],
              ),
            ),
          ),

        ],
      ),
      bottomNavigationBar: Container(
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
              child: Row(
                children: [
                  Icon(Icons.remove, color: AppColors.signColor,),
                  SizedBox(width: Dimensions.height10/2,),
                  BigText(text: "0"),
                  SizedBox(width: Dimensions.height10/2,),
                  Icon(Icons.add, color: AppColors.signColor,),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: Dimensions.height20, bottom: Dimensions.height20, left: Dimensions.width20, right: Dimensions.width20),
              child: BigText(text: "Ksh 10 | Add to cart", color: Colors.white,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.mainColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
