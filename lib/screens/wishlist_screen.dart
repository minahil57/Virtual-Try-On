import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/components/grid_view.dart';
import 'package:virtual_try_on/controllers/wishlist_controller.dart';
import 'package:virtual_try_on/core/colors.dart';
import 'package:virtual_try_on/core/text_styles.dart';
import 'package:virtual_try_on/screens/product_detail/product_detail_screen.dart';
import 'package:virtual_try_on/services/favourite_services.dart';

import '../models/product_model.dart';

class WishListScreen extends GetView<Wishlist_Controller> {
  const WishListScreen({super.key});

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
                  fontSize: 16.sp,
                ),
              ),
            ),
          ],
        ),
        FutureBuilder(
            future: FavouritesServices.fetchFavs(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(
                  heightFactor: 2,
                  child: Image.asset(
                    'assets/images/no.gif',
                    height: Get.height * 0.3,
                  ),
                );
              } else {
                final List<ProductModel>? products = snapshot.data;
                return Expanded(
                  child: GridView.builder(
                    itemCount: products!.length,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.h),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // Set the number of columns you want
                      crossAxisSpacing: 25.0,
                      mainAxisSpacing: 9.0,
                      childAspectRatio: 6 / 9, // Number of columns in the grid
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      ProductModel favData = products[index];
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => ProductDetailsScreen3State(
                                product: favData,
                              ));
                        },
                        child: GridItem(
                          imageUrl: favData.images![0],
                          price: favData.price!,
                          id: favData.id!,
                          rating: 0,
                          text: favData.name!,
                        ),
                      );
                    },
                  ),
                );
              }
            })
      ]),
    );
  }
}
