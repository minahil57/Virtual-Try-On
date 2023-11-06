import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/controllers/signup_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:virtual_try_on/core/colors.dart';
import 'package:virtual_try_on/core/text_styles.dart';
import 'package:virtual_try_on/screens/auth_screens/login_screen.dart';
import 'package:virtual_try_on/widgets/custom_button.dart';
import 'package:flutter_remix/flutter_remix.dart';

class Sign_up extends GetView<SignupController> {
  const Sign_up({super.key});

  @override
  Widget build(BuildContext context) {
    Get.putOrFind(() => SignupController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:  EdgeInsets.only(top: Get.height*0.1.h),
            child: Column(
              children: [
                Center(
                  child: Text(
                  'Create Account',
                    style: globalTextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0.h,
                ),
                Text(
                  'Fill your information below or register',
                  style: globalTextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                      color: AppColors.customGrey
                  ),
                ),
                Text(
                  'with your social account',
                  style: globalTextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                      color: AppColors.customGrey
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left:20.w,right:20.w,top: 30.w),
                  child: Form(
                  key:controller.formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Name',
                        style: globalTextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.customBlack
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: controller.email_controller,
                        decoration: InputDecoration(
                         hintText: 'John Doe',
                          hintStyle: TextStyle(
                            color: AppColors.customLightGrey,
                          ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(30),
                            ),
                          contentPadding:  EdgeInsets.only(bottom: 15.h,left: 10.w),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(30),
                            ),
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Please enter your Name';
                          }
                          else{
                            return null;
                          }
                        }

                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'Email',
                        style: globalTextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.customBlack
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      TextFormField(
                          keyboardType: TextInputType.text,
                          controller: controller.email_controller,
                          decoration: InputDecoration(
                              hintText: 'example@gmail.com',
                            contentPadding:  EdgeInsets.only(bottom: 15.h,left: 10.w),
                              hintStyle: TextStyle(
                                color: AppColors.customLightGrey,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(30),
                              ),
                          ),
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Please enter your Email';
                            }
                            else if (!GetUtils.isEmail(value)){
                              return 'Please enter a valid Email Address';
                            }
                            else{
                              return null;
                            }
                          }

                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'Password',
                        style: globalTextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.customBlack
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),

                      Obx(
                            () => TextFormField(
                          obscureText: controller.obscureText.value,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: '**************',
                            contentPadding:  EdgeInsets.only(bottom: 15.h,left: 10.w),
                            hintStyle: TextStyle(
                              color: AppColors.customLightGrey,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(30),
                            ),

                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                controller.obscureText.value ? FlutterRemix.eye_off_line : FlutterRemix.eye_2_line,
                                color: AppColors.customBlack,
                              ),
                              onPressed: controller.toggleObscureText,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            } else if (value.length < 6) {
                              return 'Please enter a password greater than 6 characters';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),

    ],
                  )
                  ),
                ),
                Obx(
                      () => Padding(
                    padding: EdgeInsets.only(left: 20.0.w,right: 20.0.w,top: 10.w,bottom: 10.w),
                    child: Row(
                      children: [
                        Checkbox(
                          activeColor: AppColors.primary,
                          value: controller.agreedToTerms.value,
                          onChanged: (value) {
                            controller.agreedToTerms.value = value!;
                          },
                        ),
                        Text('Agree with '),
                        TextButton(
                          onPressed: () {
                            // Handle the action when the "Terms and Conditions" button is pressed.
                          },
                          child: Text(
                            'Terms & Conditions',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),


          CustomButton(
                    text: 'Sign up',
                    width: Get.width*0.7.w,
                    onPressed: (){
                  print('Pressd Button');
                }),
                SizedBox(height: 20.h),
                Row(
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
                      'or sign up with',
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
                    const Text('Already have an account?',),
                    TextButton(onPressed: () {
                      Get.to(() => LoginScreen());
                    }, child: const Text('Sign In',
                      style: TextStyle(
                          color: AppColors.primary,
                        decoration: TextDecoration.underline,
                      ),
                    ))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),

    ));
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
