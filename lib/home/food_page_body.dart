import 'package:flutter/material.dart';
import 'package:i_eats/utils/colors.dart';
import 'package:i_eats/widgets/big_text.dart';
import 'package:i_eats/widgets/icon_and_text_widget.dart';
import 'package:i_eats/widgets/small_text.dart';

//stful
class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = 220;

  @override
  void initState() {
    super.initState();

    //improve horizontal transition.
    pageController.addListener(() {
      _currentPageValue = pageController.page!;
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.grey[100],
      height: 320,
      child: PageView.builder(
          controller: pageController,
          itemCount: 5,
          itemBuilder: (context, position){
            return _buildPageItem(position);
          }),
    );
  }

  Widget _buildPageItem(int index){
    Matrix4 matrix =  new Matrix4.identity();
    if(index == _currentPageValue.floor()){ // floor() is for rounding offf
      var currScale = 1-(_currentPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }
    else if(index == _currentPageValue.floor()+1){
      var currScale = _scaleFactor+(_currentPageValue-index+1)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

    }
    else if(index == _currentPageValue.floor()-1){
      var currScale = 1-(_currentPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);

    }

    return Transform(
      transform: matrix,
      child: Stack(//stack container ensures that the child container takes the specified height and not the parent height. We can also fut another container
        children: [
          Container(
            height: 220,
            margin: EdgeInsets.only(left: 10, right: 10),
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
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 120,
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5)
                  ),
                  BoxShadow(
                      color: Color(0xFFe8e8e8),
                      offset: Offset(-5, 0)
                  ),
                  BoxShadow(
                      color: Color(0xFFe8e8e8),
                      offset: Offset(5, 0)
                  ),
                ]
              ),
              child: Container(
                padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "Chinese Side", color: Colors.black,),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(5, (index) { return Icon(Icons.star, color: AppColors.mainColor, size: 15,);}),
                        ),
                        SizedBox(width: 10,),
                        SmallText(text: "4.5"),
                        SizedBox(width: 10,),
                        SmallText(text: "1227"),
                        SizedBox(width: 10,),
                        SmallText(text: "Comments"),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        IconAndTextWidget(icon: Icons.circle_sharp,
                            text: "Normal",
                            iconColor: AppColors.iconColor1),
                        IconAndTextWidget(icon: Icons.location_on,
                            text: "1.7 Km",
                            iconColor: AppColors.mainColor),
                        IconAndTextWidget(icon: Icons.access_time_rounded,
                            text: "32 min",
                            iconColor: AppColors.iconColor2),
                      ],
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
