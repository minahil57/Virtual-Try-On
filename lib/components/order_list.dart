import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:virtual_try_on/controllers/my_orders_controller.dart';
import 'package:virtual_try_on/core/colors.dart';
import 'package:virtual_try_on/core/text_styles.dart';
import 'package:virtual_try_on/helpers/get_color.dart';
import 'package:virtual_try_on/models/my_order_model.dart';
import 'package:virtual_try_on/screens/review_screen.dart';

// ignore: camel_case_types
class Order_list extends GetView<MyOrdersController> {
  final OrderDetailModel orderDetails;
  final String status;
  const Order_list(
      {super.key, required this.orderDetails, required this.status});

  @override
  Widget build(BuildContext context) {
    Get.putOrFind(() => MyOrdersController());

    return Container(
      color: Colors.white70,
      child: Column(
        children: [
          ListTile(
              horizontalTitleGap: 20,
              leading: Container(
                height: 300.h,
                // width: ,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      10.0.r), // Adjust the radius as needed
                  border: Border.all(
                    color: AppColors
                        .customLightGrey, // You can customize the border color
                    width: 1.0.w,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0.r),
                  child: Image.network(
                    orderDetails.product!.images![0],
                    fit: BoxFit.fitHeight,
                    height: 70.h,
                    width: 70.w, // Ensure the image covers the entire container
                  ),
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    orderDetails.product!.name!.capitalizeFirst,
                    style: globalTextStyle(fontSize: 15),
                  ),
                  Row(
                    children: [
                      Text(
                        orderDetails.size!.capitalizeFirst,
                        style: globalTextStyle(
                            fontSize: 10.sp, color: AppColors.customGrey),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.fromLTRB(8.0.w, 3.0.h, 8.0.w, 3.0.h),
                        child: Text(
                          '|',
                          style: globalTextStyle(
                              fontSize: 10.sp, color: AppColors.customGrey),
                        ),
                      ),
                      Text(
                        '${orderDetails.quantity.toString()}x',
                        style: globalTextStyle(
                            fontSize: 10.sp, color: AppColors.customGrey),
                      ),
                    ],
                  ),
                ],
              ),
              subtitle: SizedBox(
                  width: Get.width * 0.01.w,
                  child: Row(
                    children: [
                      Text('Rs- ${orderDetails.product!.price!}'),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                          padding: EdgeInsets.all(8.h),
                          decoration: BoxDecoration(
                            color: HexColor(orderDetails.color!),
                            borderRadius: BorderRadius.circular(20.r),
                          )),
                    ],
                  )),
              trailing: status.toLowerCase() == "pending" ||
                      status.toLowerCase() == 'cancelled'
                  ? const SizedBox.shrink()
                  : ElevatedButton(
                      onPressed: () {
                        Get.to(() => const ReviewScreen());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown, // Background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              20.0), // Adjust the value for rounded corners
                        ),
                      ),
                      child: Text(
                        "Leave Review",
                        style: globalTextStyle(
                            fontSize: 12, color: Colors.white), // Text color
                      ),
                    )),
          const Divider(),
        ],
      ),
    );
  }
}
