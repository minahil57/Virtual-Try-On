import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/controllers/cart_controller.dart';
import 'package:virtual_try_on/core/colors.dart';
import 'package:virtual_try_on/core/text_styles.dart';
import 'package:virtual_try_on/helpers/get_color.dart';
import 'package:virtual_try_on/models/cart_model.dart';

class CartDeleteSheet extends GetView<Cart_Controller> {
  final CartItemModel item;

  const CartDeleteSheet({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.4,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: Center(
              child: Text(
                'Remove From Cart?',
                style: globalTextStyle(
                    fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const Divider(
            indent: 20,
            endIndent: 20,
          ),
          SizedBox(height: 20.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Container(
                  height: 80.h,
                  // width: ,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        10.0.r), // Adjust the radius as needed
                    border: Border.all(
                      color: Colors.grey, // You can customize the border color
                      width: 1.0.w,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      item.products!.images![0],
                      fit: BoxFit
                          .fill, // Ensure the image covers the entire container
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: Get.width * 0.6,
                    child: Text(
                      item.products!.name!.capitalizeFirst,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: globalTextStyle(fontSize: 13.sp),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    'Size: ${item.size!.capitalizeFirst}',
                    style: globalTextStyle(
                      fontSize: 11.sp,
                      color: AppColors.customGrey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      'Quantity: ${item.quantity}',
                      style: globalTextStyle(
                        fontSize: 11.sp,
                        color: AppColors.customGrey,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Color: ',
                        style: globalTextStyle(
                          fontSize: 11.sp,
                          color: AppColors.customGrey,
                        ),
                      ),
                      Container(
                        height: 20.h,
                        width: 20.w,
                        // Add spacing between images
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: HexColor(item.color!),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(left: 17.0.h, right: 17.0.h, bottom: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
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
                            fontSize: 13.sp, color: AppColors.primary)),
                  ),
                ),
                SizedBox(width: 20.w),
                Expanded(
                  child: ElevatedButton(
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
                            BorderRadius.circular(20.0.r), // Rounded corners
                      ),
                      minimumSize: const Size(
                          180, 45), // Increase the button's width and height
                    ),
                    child: Text(
                      'Yes',
                      style: globalTextStyle(
                        color: Colors.white, // Change the text color
                        fontSize: 13.sp, // Adjust the font size
                      ),
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
