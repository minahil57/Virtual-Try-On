import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/components/grid_view.dart';
import 'package:virtual_try_on/controllers/index_controller.dart';
import 'package:virtual_try_on/models/category_model.dart';
import 'package:virtual_try_on/models/product_model.dart';
import 'package:virtual_try_on/screens/categories_screen.dart';
import 'package:virtual_try_on/screens/product_detail/product_detail_screen.dart';
import 'package:virtual_try_on/screens/search_screen.dart';
import '../../core/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';

class IndexScreen extends GetView<IndexController> {
  const IndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.putOrFind(() => IndexController());
    if (controller.carouselItems.isEmpty) {
      return Center(
          child: Image.asset(
        'assets/images/404.gif',
        height: 250.h,
        width: 250.w,
      ));
    } else {
      return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20.h, 50.h, 20.h, 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                TextField(
                  controller: controller.search,
                  readOnly: true,
                  onTap: () async {
                    await showSearch(
                      context: context,
                      delegate: CustomSearchDelegate(),
                    );
                  },
                  decoration: InputDecoration(
                      //alignLabelWithHint: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(
                            30.r), // Adjust the value to control the roundness
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Colors
                                .grey), // Border when the field is not focused
                        borderRadius: BorderRadius.circular(
                            30), // Adjust the value to control the roundness
                      ),
                      fillColor: Colors.white54,
                      hintText: "Search",
                      prefixIcon: const Icon(
                        FlutterRemix.search_2_line,
                        color: AppColors.primary,
                      ),
                      suffixIcon: const Icon(
                        FlutterRemix.filter_3_line,
                        color: AppColors.primary,
                      )),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  //color: const Color(0xff0fc1fa).withOpacity(0.4),
                  height: 180.h,
                  width: double.maxFinite,
                  child: CarouselSlider(
                    items: controller.carouselItems.map((item) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            item,
                            width: 400.w, // Adjust the width as needed
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 150.0.h,
                      //enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        controller.currentIndex.value =
                            index; // Update the current index
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Obx(
                  () => Center(
                    child: DotsIndicator(
                      dotsCount: controller.carouselItems.length,
                      position: controller.currentIndex.toInt(),
                      decorator: DotsDecorator(
                          color: Colors.grey,
                          activeColor: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                    height: 150.h,
                    width: double.maxFinite,
                    //color: Colors.grey,
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Categories',
                                    style: TextStyle(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Get.to(() => Categories_Screen(),
                                            arguments: {'index': 0});
                                      },
                                      child: const Text(
                                        'View all',
                                        style: TextStyle(
                                            color: AppColors.primary,
                                            decoration:
                                                TextDecoration.underline),
                                      ))
                                ]),
                          ),
                          // SizedBox(
                          //   height: 10.h,
                          // ),
                          Expanded(
                            child: Obx(
                              () => ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.categories.length,
                                itemBuilder: (context, index) {
                                  CategoryModel category =
                                      controller.categories[index];

                                  return GestureDetector(
                                      onTap: () {
                                        Get.to(() => Categories_Screen(),
                                            arguments: {'index': index});
                                      },
                                      child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Column(children: [
                                            Container(
                                              width: 60
                                                  .w, // Adjust the size of the circular container as needed
                                              height: 60.h,
                                              decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: AppColors
                                                      .primaryLight // Makes it a circular container
                                                  ),
                                              child: ClipOval(
                                                child: Center(
                                                    child: Image.network(
                                                  category.image!,
                                                  width: 35.w,
                                                  height: 35.h,
                                                )),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(category.name!),
                                            ),
                                          ])));
                                },
                              ),
                            ),
                          ),
                        ])),
                Obx(
                  () => GridView.builder(
                    shrinkWrap:
                        true, // Important to allow the GridView to be placed inside SingleChildScrollView
                    dragStartBehavior: DragStartBehavior.start,
                    physics: const ScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Set the number of columns you want
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 7 / 9,
                    ),
                    itemCount: controller.products
                        .length, // Set the number of items in your GridView
                    itemBuilder: (BuildContext context, int index) {
                      ProductModel productData = controller.products[index];
                      // Your item widgets go here
                      return GestureDetector(
                          onTap: () {
                            Get.to(() => ProductDetailsScreen3State(
                                  product: productData,
                                ));
                          },
                          child: GridItem(
                              imageUrl: productData.images![0],
                              text: productData.name!,
                              rating: 3.0,
                              price: productData.price!));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
