//stless
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:i_eats/widgets/app_icon.dart';
import 'package:i_eats/widgets/big_text.dart';

import '../utils/dimensions.dart';

class AccountWidget extends StatelessWidget {
  AppIcon appIcon;
  BigText bigText;
  AccountWidget({Key? key, required this.appIcon, required this.bigText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.white, //NB-> IF WE HAVE DECORATION, WE CANT USE COLOR HERE BUT INSTEAD USE IT IN DECORATION
      padding: EdgeInsets.only(
          left: Dimensions.width20,
          top: Dimensions.width10,
          bottom: Dimensions.width10
      ),
      child: Row(
        children: [
          appIcon,
          SizedBox(width: Dimensions.width20,),
          bigText,
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
          BoxShadow(
            blurRadius: 1,
            offset: Offset(0,2),
            color: Colors.grey.withOpacity(0.2),
          )
        ]
      ),
    );
  }
}
