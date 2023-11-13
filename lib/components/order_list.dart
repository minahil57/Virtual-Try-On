import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:virtual_try_on/core/colors.dart';
import 'package:virtual_try_on/core/text_styles.dart';
import 'package:virtual_try_on/screens/review_screen.dart';

// ignore: camel_case_types
class Order_list extends StatelessWidget {
  const Order_list({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      child: Column(
        children: [
          ListTile(
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
                  child: Image.asset(
                    '${'assets/images/BlackPant1.PNG'}',
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
                    "name",
                    style: globalTextStyle(fontSize: 15),
                  ),
                  Row(
                    children: [
                      Text(
                        'Size: ${'xl'}',
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
                        'QTY: ${'10'}',
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
                      Text('Rs- ${'300'}'),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                          padding: EdgeInsets.all(8.h),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20.r),
                          )),
                    ],
                  )),
              trailing: ElevatedButton(
                onPressed: () {
                  Get.to(() => ReviewScreen());
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
