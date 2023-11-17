import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/controllers/index_controller.dart';
import 'package:virtual_try_on/core/colors.dart';
import 'package:virtual_try_on/core/text_styles.dart';

class GridItem extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String text;
  final double rating;
  final int price;

  const GridItem(
      {super.key,
      required this.imageUrl,
      required this.id,
      required this.text,
      required this.rating,
      required this.price});

  @override
  Widget build(BuildContext context) {
    final IndexController indexController = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network(
                imageUrl,
                //productData.images![0] as String,
                width: double.infinity,
                height: 150, // Adjust the height as needed
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 3,
              right: 10,
              child: GestureDetector(
                onTap: () => indexController.handleAddToFav(id),
                child: Container(
                  width: 30.w, // Set the width and height to make it circular
                  height: 30.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle, // Make it circular
                    color: Colors.white70,
                  ),
                  child: Icon(
                    FlutterRemix.heart_2_line,
                    size: 10.dg,
                    color: AppColors.primary,
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: Get.width * 0.24,
                child: Text(
                  text.capitalizeFirst,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  //productData.name!.capitalizeAllWordsFirstLetter(),
                  style: globalTextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Row(
                children: [
                  Icon(
                    FlutterRemix.star_fill,
                    size: 10.dg,
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
        ),
        SizedBox(
          height: 5.h,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Text(
            'Rs-$price',
            //'RS-${productData.price!.toString()}',
            style: globalTextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        // Add more widgets or adjust the existing ones as needed
      ],
    );
  }
}
