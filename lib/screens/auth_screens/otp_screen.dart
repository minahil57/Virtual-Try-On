import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:virtual_try_on/controllers/otp_controller.dart';
import 'package:virtual_try_on/core/colors.dart';
import 'package:virtual_try_on/core/text_styles.dart';
import 'package:virtual_try_on/screens/auth_screens/complete_profile_screen.dart';
import 'package:virtual_try_on/widgets/custom_button.dart';

class OtpScreen extends GetView<OtpController>{
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.putOrFind(() => OtpController());

    const focusedBorderColor = AppColors.customGrey;
    const fillColor = Color.fromRGBO(243, 246, 249, 0);



    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  Text(
                    'Verify Code',
                    textAlign: TextAlign.center,
                    style: globalTextStyle(
                      fontSize: 23.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          SizedBox(height: 12.h),
            Text(
              'Please enter the code we have just sent to you on',
              textAlign: TextAlign.center,
              style: globalTextStyle(
                fontSize: 12.sp,
                color: Colors.grey,
                fontWeight: FontWeight.w600,
              ),
            ),
              Text(
              'email',
              textAlign: TextAlign.center,
              style: globalTextStyle(
                fontSize: 12.sp,
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          SizedBox(height: 20.h),
             Pinput(
              controller: controller.otp,
              keyboardType: TextInputType.number,
              focusNode: controller.focusNode,

              defaultPinTheme: controller.defaultPinTheme,
              separatorBuilder: (index) => const SizedBox(width: 8),
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              onCompleted: (pin) {
                debugPrint('onCompleted: $pin');
              },
              onChanged: (value) {
                debugPrint('onChanged: $value');
              },
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 9),
                    width: 22,
                    height: 1,
                    color: fillColor,
                  ),
                ],
              ),
              focusedPinTheme: controller.defaultPinTheme.copyWith(
                decoration: controller.defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              submittedPinTheme: controller.defaultPinTheme.copyWith(
                decoration: controller.defaultPinTheme.decoration!.copyWith(
                  color: fillColor,
                  borderRadius: BorderRadius.circular(19),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              errorPinTheme: controller.defaultPinTheme.copyBorderWith(
                border: Border.all(color: Colors.redAccent),
              ),
            ),

          SizedBox(height: 30.h),
         Text(
              'Didn\'t recive a code?',
              textAlign: TextAlign.center,
              style: globalTextStyle(
                fontSize: 12.sp,
                color: AppColors.customGrey,
                fontWeight: FontWeight.w400,
              ),
            ),
       TextButton(
              onPressed: () {  },
              child: Text(
                'Resend',
                textAlign: TextAlign.center,
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 12.sp,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
                SizedBox(height: 20.h),
                CustomButton(
                    text: 'Verify',
                    width: Get.width*0.7.w,
                    onPressed: (){
                      Get.offAll(() => CompleteProfile());
                    }),

        ],
      ),
    )]));
  }
}
