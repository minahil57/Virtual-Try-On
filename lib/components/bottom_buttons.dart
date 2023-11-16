import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/controllers/cart_controller.dart';
import 'package:virtual_try_on/core/colors.dart';
import 'package:virtual_try_on/core/text_styles.dart';
import 'package:virtual_try_on/screens/cart/checkout_screen.dart';
import 'package:virtual_try_on/widgets/custom_button.dart';

class BottomButtons extends GetView<Cart_Controller> {
  const BottomButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      //right: 20.w,
      child: Container(
        height: Get.height * 0.4.h,
        width: Get.width,
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
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Subtotal',
                          textAlign: TextAlign.center,
                          style: globalTextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Obx(
                          () => Text(
                            'Rs-${controller.calculateTotal()}',
                            textAlign: TextAlign.center,
                            style: globalTextStyle(
                              fontSize: 12.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const DottedLine(
                    dashColor: AppColors.customLightGrey,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: CustomButton(
                      width: 350,
                      onPressed: () => {
                        Get.to(() => const Checkout_Screen()),
                      },
                      text: 'Proceed',
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
