//stless
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:i_eats/pages/auth/sign_up_page.dart';
import 'package:i_eats/utils/colors.dart';
import 'package:i_eats/utils/dimensions.dart';
import 'package:i_eats/widgets/app_text_field.dart';
import 'package:i_eats/widgets/big_text.dart';

class SignInPage extends StatelessWidget {//used stateless widget because GET already has statefull.. but one should used stfull
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();


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

            //welcome message
            Container(
              margin: EdgeInsets.only(left: Dimensions.width20),
              width: double.maxFinite, //comment this line to centre align hello and singin to your account.
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello",
                    style: TextStyle(
                      fontSize: Dimensions.font20*3 + Dimensions.font20/2, //70
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    "SignIn to your account",
                    style: TextStyle(
                        fontSize: Dimensions.font20, //20
                        //fontWeight: FontWeight.bold,
                      color: Colors.grey[500]
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Dimensions.height20,),

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

            Row(
              children: [
                Expanded(child: Container()), //this container will push the RichText to the right.
                RichText(
                    text: TextSpan(
                      text: "Sign into your account",
                      style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: Dimensions.font20
                      ),
                    ),
                ),
                SizedBox(width: Dimensions.width20,)
              ],
            ),



            //Sign into your account
            /*
            RichText(
                text: TextSpan(
                  text: "Sign into your account ",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: Dimensions.font20
                  ),
                )
            ),
            */

            SizedBox(height: Dimensions.screenHeight*0.05,),

            //sign in button
            Container(
              width: Dimensions.screenWidth/2,
              height: Dimensions.screenHeight/13,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: AppColors.mainColor
              ),
              child: Center(
                child: BigText(
                  text: "Sign In",
                  size: Dimensions.font20+Dimensions.font20/2, //30,
                  color: Colors.white,
                ),
              ),
            ),

            SizedBox(height: Dimensions.screenHeight*0.05,),

            //Signup options text
            RichText(
                text: TextSpan(
                  text: "Don\'t have an account ? ",
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: Dimensions.font20
                  ),
                  children: [
                    TextSpan(
                      //navigate to SignUnPage
                      recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>SignUpPage() , transition: Transition.rightToLeft, ),
                      text: "Create",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                          fontSize: Dimensions.font20
                        ),
                    )
                  ]
                ),
            ),

          ],
        ),
      ),
    );
  }
}
