//
// import 'package:flutter/material.dart';
// import 'package:flutter_remix/flutter_remix.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:virtual_try_on/controllers/index_controller.dart';
// import '../../core/colors.dart';
// import '../../core/text_styles.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:dots_indicator/dots_indicator.dart';
//
// class IndexScreen extends GetView<IndexController> {
//   const IndexScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     Get.putOrFind(() => IndexController());
//
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: <Widget>[
//           SliverList(
//             delegate: SliverChildListDelegate(
//               [
//                 Container(
//                   padding: EdgeInsets.fromLTRB(20.h, 20.h, 20.h, 20.h),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//
//                                       Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Location',
//                           textAlign: TextAlign.center,
//                           style: globalTextStyle(
//                             fontSize: 15.sp,
//                             color: Colors.black,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                         SizedBox(height: 10.h,),
//                         Text(
//                           'NewYork',
//                           textAlign: TextAlign.center,
//                           style: globalTextStyle(
//                             fontSize: 12.sp,
//                             color: Colors.black,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Icon(FlutterRemix.notification_2_fill),
//                       ],
//                     )
//                   ],
//                 ),
//                 SizedBox(height: 20.h,),
//
//                   TextField(
//                     decoration: InputDecoration(
//                       //alignLabelWithHint: true,
//                       focusedBorder: OutlineInputBorder(
//                         borderSide: const BorderSide(color: Colors.black),
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//                       enabledBorder: const OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.grey),
//                       ),
//                       fillColor: Colors.white54,
//                       hintText: "Search",
//                       prefixIcon:  const Icon(FlutterRemix.search_2_line,
//                         color: AppColors.primary,
//                       ),
//                       suffixIcon: const Icon(FlutterRemix.filter_3_line,
//                       color: AppColors.primary,
//                       )
//                     ),
//                   ),
//                 SizedBox(height: 20.h,),
//
//                 SizedBox(
//                   //color: const Color(0xff0fc1fa).withOpacity(0.4),
//                   height: 180,
//                   width: double.maxFinite,
//                   child: CarouselSlider(items: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 5, right: 5),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(10.0),
//                         child:
//                         Image.asset(
//                             "assets/images/promotion.png", width: 500,
//                             fit: BoxFit.fill),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 5, right: 5),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(10.0),
//                         child:
//                         Image.asset(
//                             'assets/images/promotion.png', width: 400,
//                             fit: BoxFit.fill),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 5, right: 5),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(10.0),
//                         child:
//                         Image.asset(
//                             'assets/images/promotion.png', width: 400,
//                             fit: BoxFit.fill),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 5, right: 5),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(10.0),
//                         child:
//                         Image.asset(
//                             'assets/images/promotion.png', width: 400,
//                             fit: BoxFit.fill),
//                       ),
//                     ),
//
//                   ],
//                     options: CarouselOptions(
//                       height: 200.0,
//                       //enlargeCenterPage: true,
//                       autoPlay: true,
//                       aspectRatio: 16 / 9,
//                       autoPlayCurve: Curves.fastOutSlowIn,
//                       enableInfiniteScroll: true,
//                       autoPlayAnimationDuration: const Duration(
//                           milliseconds: 800),
//                       viewportFraction: 1,
//                     ),
//
//                   ),
//                 ),
//                 SizedBox(height: 5.h,),
//                 Center(child:
//                 DotsIndicator(
//                   dotsCount: 4,
//                   position: 0,
//                   decorator: DotsDecorator(
//                       color: Colors.grey,
//                       activeColor: Theme
//                           .of(context)
//                           .colorScheme
//                           .primary
//                   ),
//                 ),
//                 ),
//                 SizedBox(height: 10.h,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Categories',
//                       textAlign: TextAlign.center,
//                       style: globalTextStyle(
//                         fontSize: 20.sp,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     const Text('View all',
//                       style: TextStyle(
//                           color: AppColors.primary,
//                         decoration: TextDecoration.underline
//                       ),
//                     )
//                   ],
//                 ),
//                 SizedBox(height: 10.h,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       children:[
//                   Container(
//                   width: 60, // Adjust the size of the circular container as needed
//                   height:60,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle, // Makes it a circular container
//                     border: Border.all(
//                       color: Colors.black, // Border color
//                       width: 1.0, // Border width
//                     ),
//                   ),
//                   child: ClipOval(
//                     child: Center(
//                         child:Icon(FlutterRemix.t_shirt_2_fill,
//                         color: AppColors.primary,
//                           size: 40.h,
//                         ),
//                     ),
//                   ),
//                 ),
//                         const Text('T-shirt')
//                     ]
//                     ),
//
//                     Column(
//                       children:[
//                     Container(
//                       width: 60, // Adjust the size of the circular container as needed
//                       height:60,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle, // Makes it a circular container
//                         border: Border.all(
//                           color: Colors.black, // Border color
//                           width: 1.0, // Border width
//                         ),
//                       ),
//                       child: ClipOval(
//                         child: Center(
//                           child:Icon(FlutterRemix.shirt_fill,
//                             color: AppColors.primary,
//                             size: 40.h,
//                           ),
//                         ),
//                       ),
//                     ),
//                         SizedBox(height: 5.h,),
//                         const Text('Shirt')
//                     ]
//                     ),
//
//                     Column(
//                       children:[
//                     Container(
//                       width: 60, // Adjust the size of the circular container as needed
//                       height:60,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle, // Makes it a circular container
//                         border: Border.all(
//                           color: Colors.black, // Border color
//                           width: 1.0, // Border width
//                         ),
//                       ),
//                       child: ClipOval(
//                         child: Center(
//                           child:Icon(FlutterRemix.shirt_fill,
//                             color: AppColors.primary,
//                             size: 40.h,
//                           ),
//                         ),
//                       ),
//                     ),
//                         SizedBox(height: 5.h,),
//                         const Text('Jacket')
//                         ]
//                     )
//                     ],
//                   ),
//                 ]
//             ),
//           ),
//           TabBar(
//               controller: controller.tabController,
//               tabs: controller.tabs),
//           // SliverPersistentHeader(
//           //   //pinned: true,
//           //   delegate: _SliverAppBarDelegate(controller.tabs as TabBar)
//           // ),
//     SliverToBoxAdapter(
//     child:
//             TabBarView(
//               controller: controller.tabController,
//               children: [
//                 // Your tab content here
//                 Text('tab 1'),
//                 Text('tab 1'),
//                 Text('tab 1'),// Replace with your content
//               ],
//             ),
//                 ),
//         ],
//       ),
//           )
//         ]
//     )
//     );
//   }
// }
//
// class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
//   final TabBar tabBar;
//
//   _SliverAppBarDelegate(this.tabBar);
//
//   @override
//   double get minExtent => tabBar.preferredSize.height;
//   @override
//   double get maxExtent => tabBar.preferredSize.height;
//
//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return Container(
//       color: Colors.white, // Change this to your desired background color
//       child: tabBar,
//     );
//   }
//
//   @override
//   bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
//     return false;
//   }
// }

// class TabContent extends StatelessWidget {
//   final tabNumber;
//
//   const TabContent(this.tabNumber, {super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//       ),
//       itemBuilder: (BuildContext context, int index) {
//         return Card(
//           margin: const EdgeInsets.all(10),
//           child: Center(
//             child: Text(
//               "Card $index - Tab $tabNumber",
//               style: const TextStyle(fontSize: 18),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }



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

class IndexScreen extends  GetView<IndexController> {
  const IndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.putOrFind(() => IndexController());
    return SingleChildScrollView(
        child: Container(
            child: Padding(padding: EdgeInsets.fromLTRB(20.h, 50.h, 20.h, 20.h),
              child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Location',
                          textAlign: TextAlign.center,
                          style: globalTextStyle(
                            fontSize: 15.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 10.h,),
                        Text(
                          'NewYork',
                          textAlign: TextAlign.center,
                          style: globalTextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(FlutterRemix.notification_2_fill),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 20.h,),

                  TextField(
                    decoration: InputDecoration(
                      //alignLabelWithHint: true,
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(30), // Adjust the value to control the roundness
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey), // Border when the field is not focused
                          borderRadius: BorderRadius.circular(30), // Adjust the value to control the roundness
                        ),
                      fillColor: Colors.white54,
                      hintText: "Search",
                      prefixIcon:  const Icon(FlutterRemix.search_2_line,
                        color: AppColors.primary,
                      ),
                      suffixIcon: const Icon(FlutterRemix.filter_3_line,
                      color: AppColors.primary,
                      )
                    ),
                  ),
                SizedBox(height: 20.h,),

                SizedBox(
                  //color: const Color(0xff0fc1fa).withOpacity(0.4),
                  height: 180,
                  width: double.maxFinite,
                  child: CarouselSlider(items: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child:
                        Image.asset(
                            "assets/images/promotion.png", width: 500,
                            fit: BoxFit.fill),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child:
                        Image.asset(
                            'assets/images/promotion.png', width: 400,
                            fit: BoxFit.fill),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child:
                        Image.asset(
                            'assets/images/promotion.png', width: 400,
                            fit: BoxFit.fill),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child:
                        Image.asset(
                            'assets/images/promotion.png', width: 400,
                            fit: BoxFit.fill),
                      ),
                    ),

                  ],
                    options: CarouselOptions(
                      height: 200.0,
                      //enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: const Duration(
                          milliseconds: 800),
                      viewportFraction: 1,
                    ),

                  ),
                ),
                SizedBox(height: 5.h,),
                Center(child:
                DotsIndicator(
                  dotsCount: 4,
                  position: 0,
                  decorator: DotsDecorator(
                      color: Colors.grey,
                      activeColor: Theme
                          .of(context)
                          .colorScheme
                          .primary
                  ),
                ),
                ),
                SizedBox(height: 10.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      textAlign: TextAlign.center,
                      style: globalTextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextButton(onPressed: (){
                      Get.to(() => ProductDetailsScreen3State());
                    },

                        child:const Text('View all',
                      style: TextStyle(
                          color: AppColors.primary,
                          decoration: TextDecoration.underline
                      ),
                    ) )

                  ],
                ),
                SizedBox(height: 10.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children:[
                  Container(
                  width: 60, // Adjust the size of the circular container as needed
                  height:60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, // Makes it a circular container
                    border: Border.all(
                      color: Colors.black, // Border color
                      width: 1.0, // Border width
                    ),
                  ),
                  child: ClipOval(
                    child: Center(
                        child:Icon(FlutterRemix.t_shirt_2_fill,
                        color: AppColors.primary,
                          size: 40.h,
                        ),
                    ),
                  ),
                ),
                        const Text('T-shirt')
                    ]
                    ),

                    Column(
                      children:[
                    Container(
                      width: 60, // Adjust the size of the circular container as needed
                      height:60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle, // Makes it a circular container
                        border: Border.all(
                          color: Colors.black, // Border color
                          width: 1.0, // Border width
                        ),
                      ),
                      child: ClipOval(
                        child: Center(
                          child:Icon(FlutterRemix.shirt_fill,
                            color: AppColors.primary,
                            size: 40.h,
                          ),
                        ),
                      ),
                    ),
                        SizedBox(height: 5.h,),
                        const Text('Shirt')
                    ]
                    ),

                    Column(
                      children:[
                    Container(
                      width: 60, // Adjust the size of the circular container as needed
                      height:60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle, // Makes it a circular container
                        border: Border.all(
                          color: Colors.black, // Border color
                          width: 1.0, // Border width
                        ),
                      ),
                      child: ClipOval(
                        child: Center(
                          child:Icon(FlutterRemix.shirt_fill,
                            color: AppColors.primary,
                            size: 40.h,
                          ),
                        ),
                      ),
                    ),
                        SizedBox(height: 5.h,),
                        const Text('Jacket')
                        ]
                    )
                  ],
                ),

                GridView.builder(
                  shrinkWrap: true, // Important to allow the GridView to be placed inside SingleChildScrollView
                  dragStartBehavior: DragStartBehavior.start,
                  physics: const ScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Set the number of columns you want
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: 10, // Set the number of items in your GridView
                  itemBuilder: (BuildContext context, int index) {
                    // Your item widgets go here
                    return Card(
                      child: Center(
                        child: Text('Item $index'),
                      ),
                    );
                  },
                ),

              Text('Hello'),
              //   Expanded(child:
              // DefaultTabController(
              //   length: controller.tabs.length,
              //   child:
              //
              //   TabBar(
              //     tabs: controller.tabs,
              //     indicatorColor: AppColors.primary,
              //     labelColor: AppColors.primary,
              //   ),
              // ),
              // ),
              //   Expanded(
              //     child: TabBarView(
              //       controller: controller.tabController,
              //       children: [
              //         GridView.builder(
              //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 2,
              //     ),
              //     itemBuilder: (BuildContext context, int index) {
              //       return Card(
              //         margin: const EdgeInsets.all(10),
              //         child: Center(
              //           child: Text(
              //             "Card $index - Tab $index",
              //             style: const TextStyle(fontSize: 18),
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              //
              //         GridView.builder(
              //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //             crossAxisCount: 2,
              //           ),
              //           itemBuilder: (BuildContext context, int index) {
              //             return Card(
              //               margin: const EdgeInsets.all(10),
              //               child: Center(
              //                 child: Text(
              //                   "Card $index - Tab $index",
              //                   style: const TextStyle(fontSize: 18),
              //                 ),
              //               ),
              //             );
              //           },
              //         ),
              //
              //         GridView.builder(
              //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //             crossAxisCount: 2,
              //           ),
              //           itemBuilder: (BuildContext context, int index) {
              //             return Card(
              //               margin: const EdgeInsets.all(10),
              //               child: Center(
              //                 child: Text(
              //                   "Card $index - Tab $index",
              //                   style: const TextStyle(fontSize: 18),
              //                 ),
              //               ),
              //             );
              //           },
              //         ),
              //       ]
              //     ),
              //   ),

              ],
            ),
        ),
        ),
    );
  }
}