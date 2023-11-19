import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/config/supabase.dart';
import 'package:virtual_try_on/controllers/index_controller.dart';
import 'package:virtual_try_on/core/colors.dart';
import 'package:virtual_try_on/core/text_styles.dart';
import 'package:virtual_try_on/models/product_model.dart';
import 'package:virtual_try_on/screens/product_detail/product_detail_screen.dart';

class GridItem extends StatelessWidget {
  final ProductModel productData;

  const GridItem({
    super.key,
    required this.productData,
  });

  @override
  Widget build(BuildContext context) {
    final IndexController indexController = Get.find();
    RxDouble avgRating = 0.0.obs;
    RxBool isFav = false.obs;
    return GestureDetector(
      onTap: () {
        Get.to(
          () => ProductDetailsScreen3State(
            product: productData,
            avgRating: avgRating.value,
            isFav: isFav,
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  productData.images![0],
                  //productData.images![0] as String,
                  width: double.infinity,
                  height: 150, // Adjust the height as needed
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 3,
                right: 10,
                child: FutureBuilder(
                    future: supabase
                        .from('favourite')
                        .select('product_id')
                        .eq('product_id', productData.id!)
                        .eq('user_id', supabase.auth.currentUser!.id)
                        .limit(1),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          width: 30
                              .w, // Set the width and height to make it circular
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
                        );
                      }
                      log('isFav ${snapshot.data}');
                      isFav.value = snapshot.data!.isNotEmpty;
                      // final data = snapshot.data;
                      return GestureDetector(
                        onTap: () => isFav.value
                            ? indexController.handleRemoveFromFav(
                                productData.id!, isFav)
                            : indexController.handleAddToFav(
                                productData.id!, isFav),
                        child: Container(
                          width: 30
                              .w, // Set the width and height to make it circular
                          height: 30.h,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle, // Make it circular
                            color: Colors.white70,
                          ),
                          child: Obx(
                            () => Icon(
                              isFav.value
                                  ? FlutterRemix.heart_2_fill
                                  : FlutterRemix.heart_2_line,
                              size: 12.dg,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      );
                    }),
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
                    productData.name!.capitalizeFirst,
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
                    FutureBuilder(
                        future: supabase
                            .from('reviews')
                            .select('rating')
                            .eq('product_id', productData.id!),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Text(
                              '0.0',
                              style: globalTextStyle(
                                fontSize: 13,
                                color: AppColors.customGrey,
                              ),
                            );
                          } else {
                            List ratings = snapshot.data
                                .where((e) =>
                                    e['rating'] != null &&
                                    e['rating'] is double)
                                .map((e) => e['rating'] as double)
                                .toList();

                            avgRating.value = ratings.isEmpty
                                ? 0.0
                                : ratings.reduce((a, b) => a + b) /
                                    ratings.length;
                            return Obx(() => Text(
                                  avgRating.value.toString(),
                                  style: globalTextStyle(
                                    fontSize: 13,
                                    color: AppColors.customGrey,
                                  ),
                                  //  avgrating.toString(),
                                ));
                          }
                        }),
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
              'Rs-${productData.price!}',
              //'RS-${productData.price!.toString()}',
              style: globalTextStyle(
                fontSize: 12.sp,
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
