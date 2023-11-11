import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/controllers/cart_controller.dart';
import 'package:virtual_try_on/core/colors.dart';
import 'package:virtual_try_on/core/text_styles.dart';
import 'package:virtual_try_on/models/cart_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:virtual_try_on/screens/cart/checkout_screen.dart';
import 'package:virtual_try_on/widgets/custom_button.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:virtual_try_on/widgets/show_sheet.dart';

import 'components/cart_delete_sheet.dart';

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
                return Container(
                  color: Colors.white70,
                  child: Column(
                    children: [
                      Slidable(
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          key: const ValueKey(1),
                          dismissible: DismissiblePane(onDismissed: () {}),
                          children: [
                            SlidableAction(
                              // onPressed: (_)=>showAsBottomSheet(context,cartItem),
                              onPressed: (_) => showCustomSheet(
                                context: context,
                                child: CartDeleteSheet(
                                  item: cartItem,
                                ),
                              ),
                              backgroundColor:
                                  const Color.fromARGB(255, 255, 121, 121),
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              autoClose: true,
                              padding: const EdgeInsets.all(10.0),
                              // label: 'Delete',
                            ),
                          ],
                        ),
                        child: ListTile(
                          leading: Container(
                            height: 300.h,
                            // width: ,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  10.0), // Adjust the radius as needed
                              border: Border.all(
                                color: AppColors
                                    .customLightGrey, // You can customize the border color
                                width: 1.0,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                '${cartItem.image}',
                                fit: BoxFit.cover,
                                height: 70.h,
                                width: 70
                                    .w, // Ensure the image covers the entire container
                              ),
                            ),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${cartItem.name}',
                                style: globalTextStyle(fontSize: 15),
                              ),
                              Text(
                                'Size: ${cartItem.size}',
                                style: globalTextStyle(
                                    fontSize: 10, color: AppColors.customGrey),
                              ),
                            ],
                          ),
                          subtitle: SizedBox(
                              width: Get.width * 0.01,
                              child: Row(
                                children: [
                                  Text('Rs- ${cartItem.price}'),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(
                                          left: index == 0 ? 0 : 8,
                                          right:
                                              0), // Add spacing between images
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: cartItem.color,
                                        borderRadius: BorderRadius.circular(20),
                                        // border: Border.all(
                                        //   width: 8.w,
                                        // ),
                                      )),
                                ],
                              )),
                          trailing: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width:
                                  110, // Adjusted width for better proportions
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      cartController.decreaseQuantity(cartItem);
                                      // print('Minux Tap');
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.customGrey,
                                        borderRadius: BorderRadius.circular(
                                            5.0), // Adjust the radius as needed
                                        border: Border.all(
                                          color: AppColors.customGrey,
                                          width: 1.0,
                                        ),
                                      ),
                                      height: 30,
                                      child: const Icon(
                                        FlutterRemix.subtract_line,
                                        color: AppColors.customBlack,
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  Text('${cartItem.quantity}',
                                      style: globalTextStyle(fontSize: 20)),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      cartController.increaseQuantity(cartItem);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.primary,
                                        borderRadius: BorderRadius.circular(
                                            5.0), // Adjust the radius as needed
                                        border: Border.all(
                                          color: AppColors.primary,
                                          width: 1.0,
                                        ),
                                      ),
                                      height: 30,
                                      child: const Icon(
                                        FlutterRemix.add_line,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(),
                    ],
                  ),
                );
              })),
        ),
      ]),
      Positioned(
          bottom: 0,
          //right: 20.w,
          child: Container(
              height: Get.height * 0.2,
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
              )))
    ]));
  }
}
