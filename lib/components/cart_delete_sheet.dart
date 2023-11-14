import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/controllers/cart_controller.dart';
import 'package:virtual_try_on/core/colors.dart';
import 'package:virtual_try_on/core/text_styles.dart';
import 'package:virtual_try_on/models/cart_model.dart';

class CartDeleteSheet extends GetView<Cart_Controller> {
  final CartItemModel item;

  const CartDeleteSheet({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: Center(
              child: Text(
                'Remove From Cart?',
                style:
                    globalTextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const Divider(
            indent: 20,
            endIndent: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                      color: Colors.grey, // You can customize the border color
                      width: 1.0.w,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      '${item.image}',
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
                    '${item.name}',
                    style: globalTextStyle(fontSize: 20.sp),
                  ),
                  Text(
                    'Size:${item.size}',
                    style: globalTextStyle(
                        fontSize: 13.sp, color: AppColors.customGrey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${item.quantity}',
                        style: globalTextStyle(
                          fontSize: 15.sp,
                        ),
                      ),
                      Container(
                          height: 20,
                          width: 20,
                          margin: const EdgeInsets.only(
                              left: 8, right: 0), // Add spacing between images
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: item.color,
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
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 17.0.h, right: 17.0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle the first button's action
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors
                        .customLightGrey, // Change the button's background color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20.0), // Rounded corners
                    ),
                    minimumSize: const Size(
                        180, 45), // Increase the button's width and height
                  ),
                  child: Text('Cancel',
                      style: globalTextStyle(
                          fontSize: 15.sp, color: AppColors.primary)),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle the first button's action
                    controller.removeFromCart(item.id!);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors
                        .primary, // Change the button's background color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20.0), // Rounded corners
                    ),
                    minimumSize: const Size(
                        180, 45), // Increase the button's width and height
                  ),
                  child: Text(
                    'Yes',
                    style: TextStyle(
                      color: Colors.white, // Change the text color
                      fontSize: 16.sp, // Adjust the font size
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
