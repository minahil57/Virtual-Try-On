import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/controllers/Login_Controller.dart';
import 'package:virtual_try_on/controllers/confirm_email_controller.dart';
import 'package:virtual_try_on/screens/auth_screens/otp_screen.dart';
import 'package:virtual_try_on/screens/auth_screens/signup_screen.dart';
import '../../core/colors.dart';
import '../../core/text_styles.dart';
import '../../widgets/custom_button.dart';

class ConfirmEmailScreeen extends  GetView<ConfirmEmailcontroller> {
  const ConfirmEmailScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.putOrFind(() => ConfirmEmailcontroller());
    return Scaffold(

        body:SingleChildScrollView(
            child:Padding(
              padding: EdgeInsets.only(top:20 ,),

              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.fromLTRB(15.0.h,32.0.h,32.0.h,32.0.h),
                      child: GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: Container(
                          width: 50, // Set the width and height to make it circular
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle, // Make it circular
                            border: Border.all(
                              color: AppColors.customLightGrey, // Set the border color to grey
                              width: 2.0, // Set the border width
                            ),
                          ),
                          child: const Icon(
                            FlutterRemix.arrow_left_line,
                            color: Colors.black, // Set the icon color to black
                          ),
                        ),
                      ),
                    ),

                    Center(
                      child:
                      Text(
                        'Comfirm Your Email',
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
                        'Please Enter Your Registered Email To Verify Your Account',
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

                  ]
              ),
                              ),
                    SizedBox(height: 40.h),
                    Center(
                      child:
                      CustomButton(
                          text: 'Confirm Email',
                          width: Get.width*0.7.w,
                          onPressed: (){
                            Get.to(() => OtpScreen());
                          }),),

                ]
    )
        )
        ),
    );
  }
}