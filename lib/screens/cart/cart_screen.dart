import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/controllers/cart_controller.dart';
import 'package:virtual_try_on/core/colors.dart';
import 'package:virtual_try_on/core/text_styles.dart';
import 'package:virtual_try_on/models/cart_model.dart';
import 'package:virtual_try_on/screens/cart/components/cart_list.dart';
import 'package:virtual_try_on/screens/cart/components/bottom_buttons.dart';

// ignore: camel_case_types
class Cart_screen extends GetView<Cart_Controller> {
  const Cart_screen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.putOrFind(() => Cart_Controller());
    return Scaffold(
        body: Stack(children: [
      Column(children: [
        Padding(
          padding: EdgeInsets.fromLTRB(15.0.h, 42.0.h, 32.0.h, 0.h),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                behavior: HitTestBehavior.translucent,
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
                      //width: 1.0, // Set the border width
                    ),
                  ),
                  child: const Icon(
                    FlutterRemix.arrow_left_line,
                    color: Colors.black, // Set the icon color to black
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 90.0.w, right: 70.w),
                child: Text(
                  'My Cart',
                  style: globalTextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Obx(() => ListView.builder(
              itemCount: cartController.items.value.length,
              padding: EdgeInsets.only(bottom: Get.height * 0.4),
              itemBuilder: (context, index) {
                CartItemModel cartItem = cartController.items.value[index];
                return CartList(cartItem, index);
              })),
        ),
      ]),
      BottomButtons(),
    ]));
  }
}
