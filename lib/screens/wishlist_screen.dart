import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:virtual_try_on/components/grid_view.dart';
import 'package:virtual_try_on/core/colors.dart';
import 'package:virtual_try_on/core/text_styles.dart';

class WishList_Screen extends StatelessWidget {
  const WishList_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(15.0.h, 42.0.h, 70.0.h, 0.h),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  width: 50.w, // Set the width and height to make it circular
                  height: 50.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, // Make it circular
                    border: Border.all(
                      color: AppColors
                          .customLightGrey, // Set the border color to grey
                      width: 2.0.w, // Set the border width
                    ),
                  ),
                  child: const Icon(
                    FlutterRemix.arrow_left_line,
                    color: Colors.black, // Set the icon color to black
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0.h, 42.0.h, 20.0.h, 0.h),
              child: Text(
                'Wishlist',
                style: globalTextStyle(
                  fontSize: 20.sp,
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: GridView.builder(
            itemCount: 20,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              // Set the number of columns you want
              crossAxisSpacing: 25.0,
              mainAxisSpacing: 9.0,
              childAspectRatio: 8 / 9, // Number of columns in the grid
            ),
            itemBuilder: (context, index) {
              return GridItem(
                imageUrl: 'assets/images/tick.jpeg',
                text: 'Item $index',
                rating: 4.5,
                price: 200,
              );
            },
          ),
        ),
      ]),
    );
  }
}
