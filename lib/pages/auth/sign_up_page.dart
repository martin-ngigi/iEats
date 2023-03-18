//stless
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:i_eats/pages/auth/sign_in_page.dart';
import 'package:i_eats/utils/colors.dart';
import 'package:i_eats/utils/dimensions.dart';
import 'package:i_eats/widgets/app_text_field.dart';
import 'package:i_eats/widgets/big_text.dart';

class SignUpPage extends StatelessWidget {//used stateless widget because GET already has statefull.. but one should used stfull
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();

    var signUpImages = [
      "t.png",
      "f.png",
      "g.png",
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            //app logo
            SizedBox(height: Dimensions.screenHeight*0.05,),
            Container(
              height:  Dimensions.screenHeight*0.25,
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 80,
                  backgroundImage: AssetImage(
                    "assets/images/logo part 1.png"
                  ),
                ),
              ),
            ),

            //email
            AppTextField(
              textController: emailController,
              hintText: "Email",
              icon: Icons.email,
              textType: TextInputType.emailAddress,
            ),
            SizedBox(height: Dimensions.height20,),

            //password
            AppTextField(
              textController: passwordController,
              hintText: "Password",
              icon: Icons.password_sharp,
              textType: TextInputType.visiblePassword,
            ),
            SizedBox(height: Dimensions.height20,),

            //name
            AppTextField(
              textController: nameController,
              hintText: "Name",
              icon: Icons.person,
              textType: TextInputType.name,
            ),
            SizedBox(height: Dimensions.height20,),

            //phone
            AppTextField(
              textController: phoneController,
              hintText: "Phone",
              icon: Icons.phone,
              textType: TextInputType.phone,
            ),
            SizedBox(height: Dimensions.height20,),

            //sign up button
            Container(
              width: Dimensions.screenWidth/2,
              height: Dimensions.screenHeight/13,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: AppColors.mainColor
              ),
              child: Center(
                child: BigText(
                  text: "Sign Up",
                  size: Dimensions.font20+Dimensions.font20/2, //30,
                  color: Colors.white,
                ),
              ),
            ),

            SizedBox(height: Dimensions.height20,),

            //already have an account
            RichText(
                text: TextSpan(
                  //recognizer:  TapGestureRecognizer()..onTap=()=>Get.back(), //make text clickable
                  text: "Have an account already ? ",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: Dimensions.font20
                  ),
                  children: [
                      TextSpan(
                        //navigate to SignInPage
                        recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>SignInPage(), transition: Transition.rightToLeft,),
                        text: "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            fontSize: Dimensions.font20
                        ),
                      )
                    ]
                )
            ),

            SizedBox(height: Dimensions.screenHeight*0.05,),

            //Signup options text
            RichText(
                text: TextSpan(
                  text: "Signup using one of the following methods",
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: Dimensions.font16
                  ),
                )
            ),

            // twitter , facebook and gmail icons
            Wrap(
              children: List.generate(3, (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: Dimensions.radius30,
                  backgroundImage: AssetImage(
                    "assets/images/"+signUpImages[index]
                  ),
                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}
