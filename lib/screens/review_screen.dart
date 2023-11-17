import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/controllers/review_controller.dart';
import 'package:virtual_try_on/core/colors.dart';
import 'package:virtual_try_on/core/text_styles.dart';
import 'package:virtual_try_on/screens/review_success.dart';
import 'package:virtual_try_on/widgets/custom_button.dart';

class ReviewScreen extends GetView<ReviewController> {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.putOrFind(() => ReviewController());
    return Scaffold(
        body: Stack(children: [
      Column(children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(15.0.h, 42.0.h, 70.0.h, 0.h),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  width: 50.w, // Set the width and height to make it circular
                  height: 50.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, // Make it circular
                    border: Border.all(
                      color: AppColors
                          .customLightGrey, // Set the border color to grey
                      width: 2.0.w, // Set the border width
                    ),
                  ),
                  child: const Icon(
                    FlutterRemix.arrow_left_line,
                    color: Colors.black, // Set the icon color to black
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0.h, 42.0.h, 20.0.h, 0.h),
              child: Text(
                'Leave Review',
                style: globalTextStyle(
                  fontSize: 20.sp,
                ),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0.w),
                  child: Container(
                    height: 80.h,
                    // width: ,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          10.0), // Adjust the radius as needed
                      border: Border.all(
                        color:
                            Colors.grey, // You can customize the border color
                        width: 1.0.w,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/images/BlackPant1.PNG',
                        fit: BoxFit
                            .fill, // Ensure the image covers the entire container
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jacket',
                      style: globalTextStyle(fontSize: 20.sp),
                    ),
                    Text(
                      'Size:xL',
                      style: globalTextStyle(
                          fontSize: 13.sp, color: AppColors.customGrey),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${10}',
                          style: globalTextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                        Container(
                            height: 20,
                            width: 20,
                            margin: const EdgeInsets.only(
                                left: 8,
                                right: 0), // Add spacing between images
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                              // border: Border.all(
                              //   width: 8.w,
                              // ),
                            )),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child:
                  CustomButton(text: 'Reorder', width: 90.w, onPressed: () {}),
            ),
          ],
        ),
        Divider(
          indent: 30.w,
          endIndent: 30.w,
          thickness: 2,
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0.h, bottom: 10.h),
          child: Center(
            child: Text(
              'How is your Order?',
              style: globalTextStyle(
                fontSize: 20.sp,
              ),
            ),
          ),
        ),
        Divider(
          indent: 30.w,
          endIndent: 30.w,
          thickness: 2,
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0.h, bottom: 10.h),
          child: Center(
            child: Text(
              'Your overall rating',
              style: globalTextStyle(
                  fontSize: 10.sp, color: AppColors.customLightGrey),
            ),
          ),
        ),
        RatingBar.builder(
          initialRating: 3,
          minRating: 1,
          itemSize: 50.sp,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            controller.rating.value = rating;
            print(controller.rating.value);
          },
        ),
        Divider(
          indent: 30.w,
          endIndent: 30.w,
          thickness: 2,
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 15.w),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.only(bottom: 10.0.h),
              child: Text(
                'Add Detail Review',
                style: globalTextStyle(
                  fontSize: 15.sp,
                ),
              ),
            ),
            Form(
              key: controller.formkey,
              child: TextFormField(
                controller: controller.review,
                keyboardType: TextInputType.multiline,
                maxLength: 100,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'How was your Order Share your thoughts with us',
                  prefixIcon: const Icon(FlutterRemix.clipboard_line),
                  prefixIconColor: AppColors.primary,
                  hintStyle: globalTextStyle(
                      fontSize: 12.sp, color: AppColors.customLightGrey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0.r),
                    borderSide: BorderSide(
                      width: 2.0.w,
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              indent: 20.w,
              endIndent: 20.w,
              thickness: 2,
            ),
          ]),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 140.w,
                height: 35.h,
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.customLightGrey,
                    // Background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          20.0), // Adjust the value for rounded corners
                    ),
                  ),
                  child: Text(
                    "Cancel",
                    style: globalTextStyle(
                        fontSize: 12, color: AppColors.primary), // Text color
                  ),
                ),
              ),
              SizedBox(
                width: 140.w,
                height: 35.h,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => const ReviewSuccess());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    // Background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          20.0), // Adjust the value for rounded corners
                    ),
                  ),
                  child: Text(
                    "Submit",
                    style: globalTextStyle(
                        fontSize: 12, color: Colors.white), // Text color
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    ]));
  }
}
