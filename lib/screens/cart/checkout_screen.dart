import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/components/checkout_screen_bottom_container.dart';
import 'package:virtual_try_on/controllers/checkout_controller.dart';
import 'package:virtual_try_on/core/colors.dart';
import 'package:virtual_try_on/core/text_styles.dart';

// ignore: camel_case_types
class Checkout_Screen extends GetView<Checkout_Controller> {
  const Checkout_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Checkout_Controller());
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.fromLTRB(15.0.h, 42.0.h, 70.0.h, 32.0.h),
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          width:
                              50, // Set the width and height to make it circular
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
                        fontSize: 16.sp,
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
                      Form(
                        key: controller.formkey,
                        child: TextFormField(
                          controller: controller.address_controller,
                          keyboardType: TextInputType.multiline,
                          maxLength: 100,
                          maxLines: 4,
                          decoration: InputDecoration(
                            hintText: 'Write your Shipping address..',
                            prefixIcon:
                                const Icon(FlutterRemix.user_location_line),
                            prefixIconColor: AppColors.primary,
                            hintStyle: globalTextStyle(
                                fontSize: 12, color: AppColors.customLightGrey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0.r),
                              borderSide: const BorderSide(
                                width: 2.0,
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your shipping address.';
                            }
                            // You can add additional custom validation here if needed.
                            return null; // Return null if the input is valid
                          },
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
                                        fontSize: 10,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Rs- 300',
                                  style: globalTextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600),
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
              ],
            ),
            const TotalSheet(),
          ],
        ),
      ),
    );
  }
}
