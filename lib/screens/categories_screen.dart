import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/components/grid_view.dart';
import 'package:virtual_try_on/config/supabase.dart';
import 'package:virtual_try_on/controllers/categories_controller.dart';
import 'package:virtual_try_on/core/colors.dart';
import 'package:virtual_try_on/core/text_styles.dart';
import 'package:virtual_try_on/models/product_model.dart';

class CategoriesScreen extends GetView<CategoriesController> {
  const CategoriesScreen({super.key});
  // final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    Get.putOrFind(() => CategoriesController());
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
                    fontSize: 16.sp,
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
                      initialIndex: controller.selectedTab.value,
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
                              controller.selectedTab.value = index;
                              //print(controller.SelectedTab.value);
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
                                            controller.selectedTab.value]
                                        .id)
                                .withConverter(
                                  (data) => List<ProductModel>.from(
                                    data.map(
                                        (item) => ProductModel.fromJson(item)),
                                  ),
                                ),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (snapshot.hasError) {
                                return Center(
                                  heightFactor: 2,
                                  child: Image.asset(
                                    'assets/images/error.gif',
                                    height: Get.height * 0.3,
                                  ),
                                );
                              } else if (!snapshot.hasData ||
                                  (snapshot.data as dynamic).isEmpty) {
                                return Center(
                                  heightFactor: 2,
                                  child: Image.asset(
                                    'assets/images/no.gif',
                                    height: Get.height * 0.3,
                                  ),
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

                                              return GridItem(
                                                productData: productItem,
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
