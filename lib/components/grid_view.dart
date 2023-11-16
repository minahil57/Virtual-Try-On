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
  final int price;

  GridItem(
      {required this.imageUrl,
      required this.text,
      required this.rating,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
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
                top: 0,
                right: 0,
                child: Container(
                  width: 50.w, // Set the width and height to make it circular
                  height: 50.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle, // Make it circular
                    color: Colors.white70,
                  ),
                  child: const Icon(
                    FlutterRemix.heart_2_line,
                    color: AppColors.primary,
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
                Text(
                  text.capitalizeFirst,
                  //productData.name!.capitalizeAllWordsFirstLetter(),
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    const Icon(
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
          ),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Text(
              'Rs-${price}',
              //'RS-${productData.price!.toString()}',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          // Add more widgets or adjust the existing ones as needed
        ],
      ),
    );
  }
}
