import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/controllers/new_password_controller.dart';
import 'package:virtual_try_on/screens/auth_screens/login_screen.dart';
import '../../core/colors.dart';
import '../../core/text_styles.dart';

import '../../widgets/custom_button.dart';

class NewPasswordScreen extends GetView<NewPasswordController> {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.putOrFind(() => NewPasswordController());
    return Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Padding(
            padding: EdgeInsets.fromLTRB(15.0.h, 42.0.h, 32.0.h, 32.0.h),
            child: GestureDetector(
              onTap: () {
                Get.to(() => const LoginScreen());
              },
              child: Container(
                width: 50, // Set the width and height to make it circular
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // Make it circular
                  border: Border.all(
                    color: AppColors
                        .customLightGrey, // Set the border color to grey
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
            child: Text(
              'New Password',
              textAlign: TextAlign.center,
              style: globalTextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Center(
            child: Text(
              'Your new password must be different\n from previously used password',
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'New Password',
                  textAlign: TextAlign.center,
                  style: globalTextStyle(
                    fontSize: 12.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Obx(
                  () => TextFormField(
                    controller: controller.newpasswordlController,
                    obscureText: controller.obscureText.value,
                    decoration: InputDecoration(
                      //alignLabelWithHint: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(
                            30), // Adjust the value to control the roundness
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors
                                .grey), // Border when the field is not focused
                        borderRadius: BorderRadius.circular(
                            30), // Adjust the value to control the roundness
                      ),
                      fillColor: Colors.white54,
                      hintText: '*********',
                      hintStyle: const TextStyle(color: Colors.grey),
                      contentPadding:
                          const EdgeInsets.only(bottom: 15, left: 10),
                      focusColor: Colors.white60,
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.obscureText.value
                              ? FlutterRemix.eye_off_line
                              : FlutterRemix.eye_2_line,
                          color: AppColors.customBlack,
                        ),
                        onPressed: controller.toggleObscureText,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  'Confirm Password',
                  textAlign: TextAlign.center,
                  style: globalTextStyle(
                    fontSize: 12.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Obx(
                  () => TextFormField(
                    controller: controller.confirmpasswordController,
                    obscureText: controller.obscureText1.value,
                    decoration: InputDecoration(
                      //alignLabelWithHint: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(
                            30), // Adjust the value to control the roundness
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors
                                .grey), // Border when the field is not focused
                        borderRadius: BorderRadius.circular(
                            30), // Adjust the value to control the roundness
                      ),
                      fillColor: Colors.white54,
                      hintText: '*********',
                      hintStyle: const TextStyle(color: Colors.grey),
                      contentPadding:
                          const EdgeInsets.only(bottom: 15, left: 10),
                      focusColor: Colors.white60,
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.obscureText1.value
                              ? FlutterRemix.eye_off_line
                              : FlutterRemix.eye_2_line,
                          color: AppColors.customBlack,
                        ),
                        onPressed: controller.toggleObscureTexts,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              Center(
                child: CustomButton(
                    text: 'Create New Password',
                    width: Get.width * 0.7.w,
                    onPressed: () {
                      controller.updateUser
                          .UpdateUser(controller.newpasswordlController.text);
                      //Get.offAll(() => CompleteProfile());
                    }),
              ),
            ]),
          )
        ]));
  }
}
