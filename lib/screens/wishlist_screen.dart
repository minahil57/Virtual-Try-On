import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:virtual_try_on/components/grid_view.dart';
import 'package:virtual_try_on/controllers/wishlist_controller.dart';
import 'package:virtual_try_on/core/colors.dart';
import 'package:virtual_try_on/core/text_styles.dart';
import 'package:virtual_try_on/screens/product_detail/product_detail_screen.dart';

import '../models/product_model.dart';

class WishList_Screen extends GetView<Wishlist_Controller> {
  const WishList_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.putOrFind(() => Wishlist_Controller());
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
    FutureBuilder(
    future: controller.fav.FetchFavs(),

    builder: (context, snapshot) {
      //print(controller.categories.last.id);
      //print(controller.categories[controller.SelectedTab.value].id);
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (snapshot.hasError) {
        return Center(
          child: Text('Error: ${snapshot.error}'),
        );
      } else if (!snapshot.hasData || (snapshot.data as dynamic).isEmpty) {
        return Center(
          child: Text('No data available'),
        );
      } else {
        final List<ProductModel>? product = snapshot.data;
        // Data is available, you can use snapshot.data
        // Example: List<Map<String, dynamic>> products = snapshot.data as List<Map<String, dynamic>>;
        return
          Expanded(
            child:
                GridView.builder(
                  itemCount: product!.length,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    // Set the number of columns you want
                    crossAxisSpacing: 25.0,
                    mainAxisSpacing: 9.0,
                    childAspectRatio: 6 / 9, // Number of columns in the grid
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    ProductModel favData = product![index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(() =>
                            ProductDetailsScreen3State(
                              product: favData,
                            ));
                      },
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Image.network(
                                  favData.images![0] as String,
                                  width: double.infinity,
                                  height: 150, // Adjust the height as needed
                                  fit: BoxFit.fill,
                                ),
                                const Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Icon(
                                    FlutterRemix.heart_2_line,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            FittedBox(
                              child:
                              Padding(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      favData.name!
                                          .capitalizeAllWordsFirstLetter(),
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const Text(
                                      '4.5',
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 5, right: 5),
                              child: Text(
                                'RS-${favData.price!.toString()}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            // Add more widgets or adjust the existing ones as needed
                          ],
                        ),
                      ),
                    );
                  },
                ),
          );
      }
    }
    )
      ]),
    );
  }
}
