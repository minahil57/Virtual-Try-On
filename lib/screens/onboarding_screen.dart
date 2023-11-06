import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:virtual_try_on/controllers/onboarding_controller.dart';
import 'package:virtual_try_on/core/colors.dart';
import 'package:virtual_try_on/core/text_styles.dart';
import 'package:virtual_try_on/screens/auth_screens/login_screen.dart';

class OnBoardingScreen extends GetView<OnboardingController> {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.putOrFind(() => OnboardingController());
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: PageView.builder(
        controller: controller.pageController,
        itemCount: controller.pages.length,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (value) => controller.setCurrentIndex(value),
        itemBuilder: (context, index) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    controller.pages[index].image,
                    height: Get.height * 0.7,
                  ),
                ],
              ),
              Positioned(
                top: Get.height * 0.08,
                right: 20.w,
                child: GestureDetector(
                  onTap: () => controller.skip(),
                  child: Text(
                    'Skip',
                    style: globalTextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ),
              Container(
                height: Get.height * 0.4,
                width: Get.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          controller.pages[index].title,
                          textAlign: TextAlign.center,
                          style: globalTextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          controller.pages[index].description,
                          textAlign: TextAlign.center,
                          style: globalTextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Obx(
                          () => GestureDetector(
                            onTap: () => controller.currentPage.value == 0
                                ? () {}
                                : controller.previous(),
                            child: Container(
                              height: Get.height * 0.12,
                              width: Get.width * 0.12,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: controller.currentPage.value == 0
                                    ? Colors.grey
                                    : AppColors.primary,
                              ),
                              child: Icon(
                                FlutterRemix.arrow_left_fill,
                                color: Colors.white,
                                size: 12.h,
                              ),
                            ),
                          ),
                        ),
                        SmoothPageIndicator(
                          controller: controller.pageController,
                          count: controller.pages.length,
                          effect: const ExpandingDotsEffect(
                            dotHeight: 8,
                            dotWidth: 8,
                            radius: 100,
                            activeDotColor: AppColors.primary,
                          ),
                          onDotClicked: (index) {},
                        ),
                        Obx(
                          () => GestureDetector(
                            onTap: controller.currentPage.value ==
                                    controller.pages.length - 1
                                ? () => Get.to(() => LoginScreen())
                                : () => controller.next(),
                            child: Container(
                              height: Get.height * 0.12,
                              width: Get.width * 0.12,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.primary,
                              ),
                              child: Icon(
                                FlutterRemix.arrow_right_fill,
                                color: Colors.white,
                                size: 12.h,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
