import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/controllers/signup_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:virtual_try_on/core/colors.dart';
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
                    style: TextStyle(
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
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                      color: AppColors.customGrey
                  ),
                ),
                Text(
                  'with your social account',
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                      color: AppColors.customGrey
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left:30.w,right: 30.w,top: 30.w),
                  child: Form(
                  key:controller.formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Name',
                        style: TextStyle(
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
                          enabledBorder: OutlineInputBorder(
                           borderRadius : const BorderRadius.all(Radius.circular(30.0)),
                              borderSide: BorderSide(
                                color: AppColors.customLightGrey,
                            width: 2.0,
                          ))
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
                        style: TextStyle(
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
                              hintStyle: TextStyle(
                                color: AppColors.customLightGrey,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius : const BorderRadius.all(Radius.circular(30.0)),
                                  borderSide: BorderSide(
                                    color: AppColors.customLightGrey,
                                    width: 2.0,
                                  ))
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
                        style: TextStyle(
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
                            hintStyle: TextStyle(
                              color: AppColors.customLightGrey,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                              borderSide: BorderSide(
                                color: AppColors.customLightGrey,
                                width: 2.0.sp,
                              ),
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
                    padding: EdgeInsets.only(left: 30.0.w,right: 30.0.w,top: 10.w,bottom: 10.w),
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
              ],
            ),
          ),
        ],
      ),

    ));
  }
}
