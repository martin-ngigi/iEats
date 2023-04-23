import 'package:flutter/material.dart';
import 'package:i_eats/widgets/big_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final bool backButtonExist;
  final Function? onbackPressed;

  const CustomAppBar({Key? key,
    required this.title,
    this.backButtonExist = true,  /// default is true, but we can also pass a false
    this.onbackPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: BigText(
        text: title,
        color: Colors.white,
      ),
      centerTitle: true,
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0,
      leading: backButtonExist ? IconButton(
          onPressed: () => onbackPressed != null ? onbackPressed!() :
                            Navigator.pushReplacementNamed(context, "/initial"),
          icon: Icon(Icons.arrow_back_ios),
      ) : SizedBox(),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(500, 53);
}
