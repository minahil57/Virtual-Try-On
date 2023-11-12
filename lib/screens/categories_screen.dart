import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/components/grid_view.dart';
import 'package:virtual_try_on/controllers/categories_controller.dart';
import 'package:virtual_try_on/core/colors.dart';
import 'package:virtual_try_on/core/text_styles.dart';

class Categories_Screen extends GetView<Categories_Controller> {
  const Categories_Screen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    width: 50, // Set the width and height to make it circular
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle, // Make it circular
                      border: Border.all(
                        color: AppColors
                            .customLightGrey, // Set the border color to grey
                        width: 2.0, // Set the border width
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
                padding: EdgeInsets.fromLTRB(15.0.h, 42.0.h, 70.0.h, 0.h),
                child: Text(
                  'Categories',
                  style: globalTextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: DefaultTabController(
              length: 6,
              child: Column(
                children: [
                  ButtonsTabBar(
                    backgroundColor: AppColors.primary,
                    height: 80,
                    buttonMargin: EdgeInsets.all(10),
                    radius: 40,
                    contentPadding: EdgeInsets.symmetric(horizontal: 30),
                    unselectedBackgroundColor: Colors.grey[300],
                    unselectedLabelStyle: TextStyle(color: Colors.black),
                    labelStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    tabs: [
                      Tab(
                        icon: Icon(FlutterRemix.shirt_line),
                        text: "T-Shirt",
                      ),
                      Tab(
                        text: "Pants",
                      ),
                      Tab(
                        text: "Shirts",
                      ),
                      Tab(
                        text: "Dresses",
                      ),
                      Tab(
                        text: "Hoodies",
                      ),
                      Tab(
                        text: "Jackets",
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: <Widget>[
                        GridView.builder(
                          itemCount: 20,
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Number of columns in the grid
                          ),
                          itemBuilder: (context, index) {
                            return GridItem(
                              imageUrl: 'assets/images/tick.jpeg',
                              text: 'Item $index',
                              rating: 4.5,
                              price: 200,
                            );
                          },
                        ),
                        Center(
                          child: Icon(Icons.directions_transit),
                        ),
                        Center(
                          child: Icon(Icons.directions_bike),
                        ),
                        Center(
                          child: Icon(Icons.directions_car),
                        ),
                        Center(
                          child: Icon(Icons.directions_transit),
                        ),
                        Center(
                          child: Icon(Icons.directions_bike),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
