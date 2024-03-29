import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import '../widgets/big_text.dart';

class CommonTextButton extends StatelessWidget {
  final String text;
  const CommonTextButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: Dimensions.height10, bottom: Dimensions.height10, left: Dimensions.width20, right: Dimensions.width20),
      child: Center(child: BigText(text: text, color: Colors.white,)),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: Offset(0,5),
              blurRadius: 10,
            color: Colors.black.withOpacity(0.3),
          )
        ],
        borderRadius: BorderRadius.circular(Dimensions.radius20/2),
        color: AppColors.mainColor,
      ),
    );
  }
}
