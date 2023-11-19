import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/controllers/signup_controller.dart';
import 'package:virtual_try_on/core/colors.dart';
import 'package:virtual_try_on/core/text_styles.dart';
import 'package:virtual_try_on/helpers/show_toast.dart';
import 'package:virtual_try_on/screens/auth_screens/login_screen.dart';
import 'package:virtual_try_on/widgets/custom_button.dart';

class SignupScreen extends GetView<SignupController> {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.putOrFind(() => SignupController());

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: Get.height * 0.1.h),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'Create Account',
                        style: globalTextStyle(
                            fontSize: 30.sp, fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: 10.0.h,
                    ),
                    Text(
                      'Fill your information below or register\n with your social account',
                      textAlign: TextAlign.center,
                      style: globalTextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w300,
                          color: AppColors.customGrey),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 20.w, right: 20.w, top: 30.w),
                      child: Form(
                        key: controller.formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              'Email',
                              style: globalTextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.customBlack),
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            TextFormField(
                                controller: controller.email_controller,
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'example@gmail.com',
                                  contentPadding:
                                      EdgeInsets.only(bottom: 15.h, left: 15.w),
                                  hintStyle: TextStyle(
                                    color: AppColors.customLightGrey,
                                    fontSize: 12.sp,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.red),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.red),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your Email';
                                  } else if (!GetUtils.isEmail(value)) {
                                    return 'Please enter a valid Email Address';
                                  } else {
                                    return null;
                                  }
                                }),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              'Password',
                              style: globalTextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.customBlack),
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            Obx(
                              () => TextFormField(
                                obscureText: controller.obscureText.value,
                                controller: controller.password_controller,
                                keyboardType: TextInputType.visiblePassword,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                ),
                                decoration: InputDecoration(
                                  hintText: '**************',
                                  contentPadding:
                                      EdgeInsets.only(bottom: 15.h, left: 15.w),
                                  hintStyle: TextStyle(
                                    color: AppColors.customLightGrey,
                                    fontSize: 12.sp,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.red),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.red),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      controller.obscureText.value
                                          ? FlutterRemix.eye_off_line
                                          : FlutterRemix.eye_line,
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
                            Obx(
                              () => Padding(
                                padding: EdgeInsets.only(
                                    left: 20.0.w,
                                    right: 20.0.w,
                                    top: 10.w,
                                    bottom: 10.w),
                                child: Row(
                                  children: [
                                    Checkbox(
                                      activeColor: AppColors.primary,
                                      value: controller.agreedToTerms.value,
                                      onChanged: (value) {
                                        controller.agreedToTerms.value = value!;
                                      },
                                    ),
                                    const Text('Agree with '),
                                    TextButton(
                                      onPressed: () {
                                        // Handle the action when the "Terms and Conditions" button is pressed.
                                      },
                                      child: const Text(
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
                            Center(
                              child: CustomButton(
                                text: 'Sign up',
                                width: Get.width * 0.7,
                                onPressed: () async {
                                  if (controller.formkey.currentState!
                                      .validate()) {
                                    if (controller.agreedToTerms.value) {
                                      await controller.userAuthentication
                                          .registerUser(
                                        controller.email_controller.text,
                                        controller.password_controller.text,
                                        context,
                                        // controller.name_controller.text,
                                      );
                                    } else {
                                      showToast(
                                          'Please agree with terms and conditions');
                                    }
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Already have an account?',
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.to(() => const LoginScreen());
                                  },
                                  child: const Text(
                                    'Sign In',
                                  ),
                                ),
                                SizedBox(height: 20.h),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
