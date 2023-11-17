import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/components/order_list.dart';
import 'package:virtual_try_on/controllers/my_orders_controller.dart';
import 'package:virtual_try_on/core/colors.dart';
import 'package:virtual_try_on/core/text_styles.dart';

class MyOrdersScreen extends GetView<MyOrdersController> {
  MyOrdersScreen({super.key});

  final GlobalKey<ExpansionTileCardState> cardA = GlobalKey();
  @override
  Widget build(BuildContext context) {
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
              padding: EdgeInsets.fromLTRB(0.0.h, 42.0.h, 70.0.h, 0.h),
              child: Text(
                'My Orders',
                style: globalTextStyle(
                  fontSize: 20.sp,
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                ButtonsTabBar(
                  backgroundColor: AppColors.primary,
                  height: 60.h,
                  buttonMargin: EdgeInsets.all(10.h),
                  radius: 30.r,
                  contentPadding: EdgeInsets.symmetric(horizontal: 25.w),
                  unselectedBackgroundColor: Colors.grey[300],
                  unselectedLabelStyle: const TextStyle(color: Colors.black),
                  labelStyle: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  tabs: const [
                    Tab(
                      text: "Pending",
                    ),
                    Tab(
                      text: "Completed",
                    ),
                    Tab(
                      text: "Cancelled",
                    ),
                  ],
                ),
                Expanded(
                    child: TabBarView(children: <Widget>[
                  ListView.builder(
                      itemCount: 20,
                      padding: EdgeInsets.only(
                          bottom: Get.height * 0.4, right: 5.w, left: 5.w),
                      itemBuilder: (context, index) {
                        return ExpansionTileCard(
                          // key: cardA,
                          leading: Text('${index + 1}:'),
                          title: const Text('Order # cr145 '),
                          subtitle: const Text('Total Amount : 3500'),
                          children: <Widget>[
                            SizedBox(
                              height: 200,
                              width: Get.width,
                              child: ListView.builder(
                                  itemCount: 5,
                                  padding:
                                      EdgeInsets.only(bottom: Get.height * 0.4),
                                  itemBuilder: (context, index) {
                                    return const Order_list();
                                  }),
                            ),
                          ],
                        );
                      }),
                  ListView.builder(
                      itemCount: 20,
                      padding: EdgeInsets.only(
                          bottom: Get.height * 0.4, right: 5.w, left: 5.w),
                      itemBuilder: (context, index) {
                        return ExpansionTileCard(
                          // key: cardA,
                          leading: Text('${index + 1}:'),
                          title: const Text('Order # cr145 '),
                          subtitle: const Text('Total Amount : 3500'),
                          children: <Widget>[
                            SizedBox(
                              height: 200,
                              width: Get.width,
                              child: ListView.builder(
                                  itemCount: 5,
                                  padding:
                                      EdgeInsets.only(bottom: Get.height * 0.4),
                                  itemBuilder: (context, index) {
                                    return const Order_list();
                                  }),
                            ),
                          ],
                        );
                      }),
                  ListView.builder(
                      itemCount: 20,
                      padding: EdgeInsets.only(
                          bottom: Get.height * 0.4, right: 5.w, left: 5.w),
                      itemBuilder: (context, index) {
                        return ExpansionTileCard(
                          // key: cardA,
                          leading: Text('${index + 1}:'),
                          title: const Text('Order # cr145 '),
                          subtitle: const Text('Total Amount : 3500'),
                          children: <Widget>[
                            SizedBox(
                              height: 200,
                              width: Get.width,
                              child: ListView.builder(
                                  itemCount: 5,
                                  padding:
                                      EdgeInsets.only(bottom: Get.height * 0.4),
                                  itemBuilder: (context, index) {
                                    return const Order_list();
                                  }),
                            ),
                          ],
                        );
                      }),
                ])),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
