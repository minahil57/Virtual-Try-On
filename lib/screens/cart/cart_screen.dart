import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input_test.dart';
import 'package:virtual_try_on/controllers/cart_controller.dart';
import 'package:virtual_try_on/core/colors.dart';
import 'package:virtual_try_on/core/text_styles.dart';
import 'package:virtual_try_on/models/cart_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:virtual_try_on/widgets/custom_button.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:virtual_try_on/widgets/show_sheet.dart';
import 'package:wtf_sliding_sheet/wtf_sliding_sheet.dart';

import 'components/cart_delete_sheet.dart';

// ignore: camel_case_types
class Cart_screen extends GetView<Cart_Controller> {
  const Cart_screen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = Get.putOrFind(() => Cart_Controller());
    return Scaffold(
      body: Stack(
        children: [
          Column(children: [
            Padding(
              padding: EdgeInsets.fromLTRB(15.0.h, 42.0.h, 32.0.h, 0.h),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      print('done');
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
                                height: 300,
                                // width: ,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Adjust the radius as needed
                                  border: Border.all(
                                    color: Colors
                                        .grey, // You can customize the border color
                                    width: 1.0,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(
                                    'https://picsum.photos/250?image=9',
                                    fit: BoxFit
                                        .fill, // Ensure the image covers the entire container
                                  ),
                                ),
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Brown Jacket',
                                    style: globalTextStyle(fontSize: 15),
                                  ),
                                  Text(
                                    'Size: ${cartItem.size}',
                                    style: globalTextStyle(
                                        fontSize: 10,
                                        color: AppColors.customGrey),
                                  ),
                                ],
                              ),
                              subtitle: Text('Quantity: ${cartItem.quantity}'),
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
                                          cartController
                                              .decreaseQuantity(cartItem);
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
                                          cartController
                                              .increaseQuantity(cartItem);
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
              height: Get.height * 0.4,
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: AppColors
                      .customLightGrey, // You can customize the border color
                  width: 1.0,
                ),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Promo Code',
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 15.0),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 1.0),
                            ),
                            suffixIcon: Container(
                                child: CustomButton(
                              width: 100,
                              onPressed: () => {},
                              text: 'Apply',
                            )),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                SizedBox(height: 12.h),
                                Text(
                                  'Delivery Fee',
                                  textAlign: TextAlign.center,
                                  style: globalTextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 12.h),
                                Text(
                                  'Discount',
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
                                Text(
                                  'Rs- 890/-',
                                  textAlign: TextAlign.center,
                                  style: globalTextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 12.h),
                                Text(
                                  'Rs- 150/-',
                                  textAlign: TextAlign.center,
                                  style: globalTextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 12.h),
                                Text(
                                  'Rs- 30 /-',
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Cost',
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
                    CustomButton(
                      width: 350,
                      onPressed: () => {},
                      text: 'Proceed to Checkout',
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
// void showAsBottomSheet(BuildContext context,CartItemModel cartItem) async {
//     final result = await showSlidingBottomSheet(context, builder: (context) {
//       final cartController = Get.putOrFind(() => Cart_Controller());
//       return SlidingSheetDialog(
//         elevation: 8,
//         cornerRadius: 16,
//         snapSpec: const SnapSpec(
//           snap: true,
//           snappings: [0.4, 0.7, 1.0],
//           positioning: SnapPositioning.relativeToAvailableSpace,
//         ),
//         builder: (context, state) {
//           return
//         },
//       );
//     });
//   }
}
