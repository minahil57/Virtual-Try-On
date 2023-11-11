import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/core/colors.dart';
import 'package:virtual_try_on/core/text_styles.dart';

class GridItem extends StatelessWidget {
  final String imageUrl;
  final String text;
  final double rating;
  final double price;

  GridItem(
      {required this.imageUrl,
      required this.text,
      required this.rating,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      // margin: EdgeInsets.all(10),
      child: FittedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height * 0.17,
              width: Get.width * 0.4,
              child: Image.asset(
                imageUrl,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style:
                      globalTextStyle(fontSize: 15, color: AppColors.primary),
                ),
                SizedBox(
                  width: 30.h,
                ),
                Row(
                  children: [
                    Icon(
                      FlutterRemix.star_fill,
                      color: Colors.amber,
                    ),
                    Text(
                      '$rating',
                      style: globalTextStyle(
                        fontSize: 13,
                        color: AppColors.customGrey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              '${price}',
              style:
                  globalTextStyle(fontSize: 12, color: AppColors.customBlack),
            ),
          ],
        ),
      ),
    );
  }
}
