import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/core/colors.dart';
import 'package:virtual_try_on/core/text_styles.dart';
import 'package:virtual_try_on/screens/index_page/index_screen.dart';
import 'package:virtual_try_on/widgets/custom_button.dart';

class ReviewSuccess extends StatelessWidget {
  const ReviewSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Padding(
          padding: EdgeInsets.only(top: 42.0.h),
          child: Center(
              child: Text(
            'Success',
            style: globalTextStyle(fontSize: 20.sp),
          )),
        ),
        Padding(
          padding: EdgeInsets.only(top: Get.height * 0.25, bottom: 20.h),
          child: Container(
            width: 100.0,
            height: 100.0,
            decoration: const BoxDecoration(
              color: AppColors.primary, // Brown color
              shape: BoxShape.circle, // Circular shape
            ),
            child: const Center(
              child: Icon(
                FlutterRemix.check_line, // Tick icon
                color: Colors.white, // Icon color
                size: 48.0, // Icon size
              ),
            ),
          ),
        ),
        Text(
          'Review Submitted Successfully',
          style: globalTextStyle(fontSize: 20.sp),
        ),
        Text(
          'Thankyou for your review',
          style: globalTextStyle(
              fontSize: 13.sp, color: AppColors.customLightGrey),
        ),
      ]),
      Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
            height: 80.h,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Shadow color
                  spreadRadius: 2, // Spread radius
                  blurRadius: 4, // Blur radius
                  offset: const Offset(0, -2), // Shadow offset (upward)
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(20.0.h),
              child: CustomButton(
                width: 350.w,
                onPressed: () => {
                  Get.to(() => const IndexScreen()),
                },
                text: 'Ok',
              ),
            )),
      )
    ]));
  }
}
