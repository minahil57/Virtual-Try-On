import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/controllers/Login_Controller.dart';
import 'package:virtual_try_on/screens/auth_screens/confirm_email.dart';
import 'package:virtual_try_on/screens/auth_screens/otp_screen.dart';
import 'package:virtual_try_on/screens/auth_screens/signup_screen.dart';
import 'package:virtual_try_on/screens/product_detail/product_detail_screen.dart';
import '../../core/colors.dart';
import '../../core/text_styles.dart';
import '../../widgets/custom_button.dart';

class LoginScreen extends  GetView<LoginController> {
const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.putOrFind(() => LoginController());
    return Scaffold(

      body:SingleChildScrollView(
        child:Padding(
            padding: EdgeInsets.only(top: 100,),

       child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                child:
                Text(
                  'Sign In',
                  textAlign: TextAlign.center,
                  style: globalTextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ),
                SizedBox(height: 12.h),
               Center(
                child:
                Text(
                  'Hi Welcome back, You have been missed',
                  textAlign: TextAlign.center,
                  style: globalTextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ),
                SizedBox(height: 70.h),
                Form(
                  key: controller.formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Padding(padding: EdgeInsets.only(left: 20),
                child:
                Text(
                  'Email',
                  textAlign: TextAlign.center,
                  style: globalTextStyle(
                    fontSize: 12.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                  ),
                Padding(padding: EdgeInsets.only(left: 20,right: 20),
                child:
                TextFormField(
                  controller: controller.emailController,
                  decoration: InputDecoration(
                    //alignLabelWithHint: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(30), // Adjust the value to control the roundness
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey), // Border when the field is not focused
                      borderRadius: BorderRadius.circular(30), // Adjust the value to control the roundness
                    ),
                    fillColor: Colors.white54,
                    hintText: 'example@gmail.com',
                    hintStyle: const TextStyle(color: Colors.grey),
                    contentPadding: const EdgeInsets.only(bottom: 15,left: 10),
                    focusColor: Colors.white60,
                  ),
                ),
                ),
                SizedBox(height: 20.h),
          Padding(padding: EdgeInsets.only(left: 20,right: 20),
            child:
                Text(
                  'Password',
                  textAlign: TextAlign.center,
                  style: globalTextStyle(
                    fontSize: 12.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
          ),
                Padding(padding: EdgeInsets.only(left: 20,right: 20),
                 child:
                     Obx(
                       ()=>
                 TextFormField(
                   controller: controller.passwordController,
                   obscureText: controller.obscureText.value,
                   decoration: InputDecoration(
                     //alignLabelWithHint: true,
                     focusedBorder: OutlineInputBorder(
                       borderSide: const BorderSide(color: Colors.black),
                       borderRadius: BorderRadius.circular(30), // Adjust the value to control the roundness
                     ),
                     enabledBorder: OutlineInputBorder(
                       borderSide: const BorderSide(color: Colors.grey), // Border when the field is not focused
                       borderRadius: BorderRadius.circular(30), // Adjust the value to control the roundness
                     ),
                     fillColor: Colors.white54,
                     hintText: '*********',
                     hintStyle: const TextStyle(color: Colors.grey),
                     contentPadding: const EdgeInsets.only(bottom: 15,left: 10),
                     focusColor: Colors.white60,
                     suffixIcon: IconButton(
                       icon: Icon(
                         controller.obscureText.value ? FlutterRemix.eye_off_line : FlutterRemix.eye_2_line,
                         color: AppColors.customBlack,
                       ),
                       onPressed: controller.toggleObscureText,
                     ),
                   ),
                 ),
                ),
                )
                ]
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(padding: EdgeInsets.only(left: 20,right: 20),
                    child:
                    TextButton(onPressed: (){

                      Get.to(() => ConfirmEmailScreeen());
                    }, child: const Text('Forgot Password?',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: AppColors.primary
                    ),
                    )))
                  ],
                ),

                SizedBox(height: 40.h),
                Center(
                  child:
                CustomButton(
                    text: 'Login',
                    width: Get.width*0.7.w,
                    onPressed: (){
                      Get.to(() => ProductDetailsScreen3State());
                    }),),
                SizedBox(height: 20.h),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Divider(
                        indent: 30,
                        thickness: 1,
                        color: AppColors.customLightGrey,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'or sign in with',
                      style: TextStyle(
                          color: AppColors.customGrey,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Divider(
                        endIndent: 30,
                        thickness: 1,
                        color: AppColors.customLightGrey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircularLogoContainer("assets/images/apple.png"),
                    CircularLogoContainer("assets/images/Google logo.png"),
                    CircularLogoContainer("assets/images/facebook logo.png"),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                 mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Don\'t have Account?',),
            TextButton(onPressed: () {
              Get.to(() => Sign_up());
            }, child: const Text('Sign Up',
              style: TextStyle(
                  color: AppColors.primary,
                  decoration: TextDecoration.underline,
              ),
            ))
                ],
            ),
        ]
      ),
    )
      )
      );
  }
}
class CircularLogoContainer extends StatelessWidget {
  final String logoPath;

  CircularLogoContainer(this.logoPath);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60, // Adjust the size of the circular container as needed
      height:60,
      decoration: BoxDecoration(
        shape: BoxShape.circle, // Makes it a circular container
        border: Border.all(
          color: Colors.black, // Border color
          width: 1.0, // Border width
        ),
      ),
      child: ClipOval(
        child: Container(
          //color: Colors.grey, // Background color for the circular container
          child: Center(
            child: Image.asset(
              logoPath,
              width: 40, // Adjust the size of the logo as needed
              height: 40,
            ),
          ),
        ),
      ),
    );
  }
}