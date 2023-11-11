import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/controllers/checkout_controller.dart';
import 'package:virtual_try_on/core/colors.dart';
import 'package:virtual_try_on/core/text_styles.dart';
import 'package:flutter/services.dart';
import 'package:virtual_try_on/screens/order_success.dart';
import 'package:virtual_try_on/widgets/custom_button.dart';

class Checkout_Screen extends GetView<Checkout_Controller> {
  const Checkout_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Checkout_Controller());
    return Scaffold(
        body: SingleChildScrollView(
            child: Stack(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15.0.h, 42.0.h, 70.0.h, 32.0.h),
                child: GestureDetector(
                  onTap: () {
                    Get.back();
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
              Text(
                'CheckOut',
                style: globalTextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w, right: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0.h),
                  child: Text(
                    'Shipping Address',
                    style: globalTextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                TextField(
                  controller: controller.address_controller,
                  keyboardType: TextInputType.multiline,
                  maxLength: 100,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'Write your Shipping address..',
                    prefixIcon: const Icon(FlutterRemix.user_location_line),
                    prefixIconColor: AppColors.primary,
                    hintStyle: globalTextStyle(
                        fontSize: 12, color: AppColors.customLightGrey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: const BorderSide(
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                const Divider(),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0.h),
                  child: Text(
                    'Shipping Charges',
                    style: globalTextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                FittedBox(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10.0.h),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            FlutterRemix.truck_line,
                            color: AppColors.primary,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Our Standard Delivery charges ',
                              style: globalTextStyle(
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              'Your order will be at your doorstep in minimum 10 days',
                              style: globalTextStyle(
                                  fontSize: 10, fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Rs- 300',
                            style: globalTextStyle(
                                fontSize: 10, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(),
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                  height: Get.height * 0.5,
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
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 30.h),
                                    Text(
                                      'Subtotal',
                                      textAlign: TextAlign.center,
                                      style: globalTextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: 30.h),
                                    Text(
                                      'Delivery Fee',
                                      textAlign: TextAlign.center,
                                      style: globalTextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    SizedBox(height: 30.h),
                                    Text(
                                      'Rs- 890/-',
                                      textAlign: TextAlign.center,
                                      style: globalTextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: 30.h),
                                    Text(
                                      'Rs- 300/-',
                                      textAlign: TextAlign.center,
                                      style: globalTextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const DottedLine(
                          dashColor: AppColors.customLightGrey,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total',
                                textAlign: TextAlign.center,
                                style: globalTextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'Rs-1150/-',
                                textAlign: TextAlign.center,
                                style: globalTextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: CustomButton(
                            width: 350.w,
                            onPressed: () => {
                              Get.to(() => const Success()),
                            },
                            text: 'Place Order',
                          ),
                        )
                      ],
                    ),
                  )))
        ],
      )
    ])));
  }
}
