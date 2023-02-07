import 'package:flutter/material.dart';

//stful
class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      child: PageView.builder(
          itemCount: 5,
          itemBuilder: (context, position){
            return _buildPageItem(position);
          }),
    );
  }

  Widget _buildPageItem(int index){
    return Container(
      height: 220,
      margin: EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: index.isEven? Color(0xFF69c5df) : Color(0xFF9294cc),
        image: DecorationImage(
          fit: BoxFit.cover, 
          image: AssetImage(
            "assets/images/food1.png"
          ),
        ),
      ),
    );
  }
}
