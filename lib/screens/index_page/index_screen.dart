
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/controllers/index_controller.dart';
import 'package:virtual_try_on/screens/product_detail/product_detail_screen.dart';
import '../../core/colors.dart';
import '../../core/text_styles.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';

class IndexScreen extends GetView<IndexController> {
  const IndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.putOrFind(() => IndexController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                  decoration: InputDecoration(
                      //alignLabelWithHint: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(
                            30), // Adjust the value to control the roundness
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
                  height: 180,
                  width: double.maxFinite,
                  child: CarouselSlider(
                    items: controller.carouselItems.map((item) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            item,
                            width: 400, // Adjust the width as needed
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 200.0,
                      //enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        controller.currentIndex.value = index; // Update the current index
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Obx(() =>
                Center(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Categories',
                      textAlign: TextAlign.center,
                      style: globalTextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(children: [
                      Container(
                        width:
                            60, // Adjust the size of the circular container as needed
                        height: 60,
                        decoration: BoxDecoration(
                          shape:
                              BoxShape.circle, // Makes it a circular container
                          border: Border.all(
                            color: Colors.black, // Border color
                            width: 1.0, // Border width
                          ),
                        ),
                        child: ClipOval(
                          child: Center(
                            child: Icon(
                              FlutterRemix.t_shirt_2_fill,
                              color: AppColors.primary,
                              size: 40.h,
                            ),
                          ),
                        ),
                      ),
                      const Text('T-shirt')
                    ]),
                    Column(children: [
                      Container(
                        width:
                            60, // Adjust the size of the circular container as needed
                        height: 60,
                        decoration: BoxDecoration(
                          shape:
                              BoxShape.circle, // Makes it a circular container
                          border: Border.all(
                            color: Colors.black, // Border color
                            width: 1.0, // Border width
                          ),
                        ),
                        child: ClipOval(
                          child: Center(
                            child: Icon(
                              FlutterRemix.shirt_fill,
                              color: AppColors.primary,
                              size: 40.h,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      const Text('Shirt')
                    ]),
                    Column(children: [
                      Container(
                        width:
                            60, // Adjust the size of the circular container as needed
                        height: 60,
                        decoration: BoxDecoration(
                          shape:
                              BoxShape.circle, // Makes it a circular container
                          border: Border.all(
                            color: Colors.black, // Border color
                            width: 1.0, // Border width
                          ),
                        ),
                        child: ClipOval(
                          child: Center(
                            child: Icon(
                              FlutterRemix.shirt_fill,
                              color: AppColors.primary,
                              size: 40.h,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      const Text('Jacket')
                    ])
                  ],
                ),
                Obx(() =>
                GridView.builder(
                  shrinkWrap:
                      true, // Important to allow the GridView to be placed inside SingleChildScrollView
                  dragStartBehavior: DragStartBehavior.start,
                  physics: const ScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Set the number of columns you want
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 7/9,
                  ),
                  itemCount: controller.products.length, // Set the number of items in your GridView
                  itemBuilder: (BuildContext context, int index) {
                    Map<String, dynamic> productData = controller.products[index];
                    // Your item widgets go here
                    return GestureDetector(
                    onTap: (){
                      print('done');
                    },
                    child:

                      Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Image.network(
                                productData['images'][0],
                                width: double.infinity,
                                height: 150, // Adjust the height as needed
                                fit: BoxFit.fill,
                              ),
                              const Positioned(
                                top: 0,
                                right: 0,
                                child: Icon(FlutterRemix.heart_2_line,
                                color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                           Padding(padding: EdgeInsets.only(left: 5,right: 5),
                          child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(  productData['name'],
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                              ),
                              const Text('4.5',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          ),
                    Padding(padding: EdgeInsets.only(left: 5,right: 5),
                    child:
                          Text( productData['price'].toString(),
                            style: const TextStyle(
                              fontSize: 10,
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
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
