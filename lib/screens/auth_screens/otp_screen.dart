import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/controllers/otp_controller.dart';
import 'package:virtual_try_on/core/colors.dart';

class OtpScreen extends GetView<OtpController>{
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.putOrFind(() => OtpController());
    return Scaffold(
      body: Column(
        children: [

          Padding(
            padding:  EdgeInsets.all(32.0.h),
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
                child: Icon(
                 FlutterRemix.arrow_left_line,
                  color: Colors.black, // Set the icon color to black
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}
