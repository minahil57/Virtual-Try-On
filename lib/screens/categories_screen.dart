import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/config/supabase.dart';
import 'package:virtual_try_on/controllers/categories_controller.dart';
import 'package:virtual_try_on/core/colors.dart';
import 'package:virtual_try_on/core/text_styles.dart';
import 'package:virtual_try_on/models/product_model.dart';
import 'package:virtual_try_on/screens/product_detail/product_detail_screen.dart';

class Categories_Screen extends GetView<Categories_Controller> {
  const Categories_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.putOrFind(() => Categories_Controller());
    return Scaffold(
      body: Column(
        children: [
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
                padding: EdgeInsets.fromLTRB(0.0.h, 42.0.h, 70.0.h, 0.h),
                child: Text(
                  'Categories',
                  style: globalTextStyle(
                    fontSize: 20.sp,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Obx(
              () => controller.categories.isEmpty
                  ? const SizedBox()
                  : DefaultTabController(
                      length: controller.tabController.length,
                      initialIndex: controller.SelectedTab.value,
                      child: Column(
                        children: [
                          ButtonsTabBar(
                            backgroundColor: AppColors.primary,
                            height: 55.h,
                            buttonMargin: EdgeInsets.all(10.h),
                            radius: 30.r,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 20.w),
                            unselectedBackgroundColor: Colors.grey[300],
                            unselectedLabelStyle:
                                const TextStyle(color: Colors.black),
                            labelStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            tabs: controller.categories.map((category) {
                              return Tab(
                                icon: category.image != null
                                    ? Image.network(
                                        category.image!,
                                        width: 30,
                                        height: 25.h,
                                      )
                                    : const Icon(FlutterRemix.shirt_line),
                                text: category.name ?? "",
                              );
                            }).toList(),
                            onTap: (index) {
                              // Update the selected tab when a tab is tapped
                              controller.SelectedTab.value = index;
                            },
                          ),
                          FutureBuilder(
                            future: supabase
                                .from('products')
                                .select('*')
                                .eq(
                                    'category_id',
                                    controller
                                        .categories[
                                            controller.SelectedTab.value]
                                        .id)
                                .withConverter(
                                  (data) => List<ProductModel>.from(
                                    data.map(
                                        (item) => ProductModel.fromJson(item)),
                                  ),
                                ),
                            builder: (context, snapshot) {
                              //print(controller.categories.last.id);
                              //print(controller.categories[controller.SelectedTab.value].id);
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (snapshot.hasError) {
                                return Center(
                                  child: Text('Error: ${snapshot.error}'),
                                );
                              } else if (!snapshot.hasData ||
                                  (snapshot.data as dynamic).isEmpty) {
                                return const Center(
                                  child: Text('No data available'),
                                );
                              } else {
                                final List<ProductModel>? product =
                                    snapshot.data;
                                // Data is available, you can use snapshot.data
                                // Example: List<Map<String, dynamic>> products = snapshot.data as List<Map<String, dynamic>>;
                                return Expanded(
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 10.h, right: 10.h),
                                        child: GridView.builder(
                                            itemCount: product!.length,
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount:
                                                  2, // Set the number of columns you want
                                              crossAxisSpacing: 8.0,
                                              mainAxisSpacing: 8.0,
                                              childAspectRatio: 7 /
                                                  9, // Number of columns in the grid
                                            ),
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              final productItem =
                                                  product[index];

                                              return GestureDetector(
                                                onTap: () {
                                                  Get.to(() =>
                                                      ProductDetailsScreen3State(
                                                        product: productItem,
                                                      ));
                                                },
                                                child: Container(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Stack(
                                                        children: [
                                                          Image.network(
                                                            productItem
                                                                .images![0],
                                                            width:
                                                                double.infinity,
                                                            height: 150,
                                                            // Adjust the height as needed
                                                            fit: BoxFit.fill,
                                                          ),
                                                          const Positioned(
                                                            top: 0,
                                                            right: 0,
                                                            child: Icon(
                                                              FlutterRemix
                                                                  .heart_2_line,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                          height: 10),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 5,
                                                                right: 5),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              productItem.name!
                                                                  .capitalizeFirst,
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                            const Text(
                                                              '4.5',
                                                              style: TextStyle(
                                                                fontSize: 13,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5.h,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 5,
                                                                right: 5),
                                                        child: Text(
                                                          'RS-${productItem.price!.toString()}',
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                      // Add more widgets or adjust the existing ones as needed
                                                    ],
                                                  ),
                                                ),
                                              );
                                            })));
                              }
                            },
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
