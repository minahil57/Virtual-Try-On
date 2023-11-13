import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:virtual_try_on/controllers/bottomBar_controller.dart';
import 'package:virtual_try_on/controllers/cart_controller.dart';
import 'package:virtual_try_on/controllers/product_details_controller.dart';
import 'package:virtual_try_on/core/colors.dart';
import 'package:virtual_try_on/core/text_styles.dart';
import 'package:virtual_try_on/models/cart_model.dart';
import 'package:virtual_try_on/screens/bottom_nav_screen.dart';
import 'package:virtual_try_on/widgets/custom_button.dart';

enum ModelType { withClothes, noClothes }

class ModelScreen extends StatelessWidget {
  final ModelType modelType;

  const ModelScreen({super.key, required this.modelType});

  @override
  Widget build(BuildContext context) {
    String modelAsset;
    String altText;

    modelAsset = 'assets/MyNoclothes.glb'; // Model without clothes
    altText =
        "create a model with gray_clothes using cnn_model in assets folder";

    return Scaffold(
      appBar: AppBar(title: const Text("3D LOOKS")),
      body: ModelViewer(
        backgroundColor: const Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
        src: modelAsset,
        alt: altText,
        ar: true,
        arModes: const ['scene-viewer', 'webxr', 'quick-look'],
        autoRotate: true,
        cameraControls: true,
        iosSrc: 'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
      ),
    );
  }
}

class ProductDetailsScreen3State extends GetView<Product_details_controller> {
  const ProductDetailsScreen3State({super.key});

  @override
  Widget build(BuildContext context) {
    Get.putOrFind(() => Product_details_controller());
    final cartController = Get.putOrFind(() => Cart_Controller());
    return Scaffold(
      body: Stack(
        children: [
          // Main Part
          Padding(
            padding: const EdgeInsets.only(bottom: 80),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Obx(
                    () => Stack(
                      children: [
                        Image(
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 400,
                          image: AssetImage(controller
                              .images[controller.selectedImageIndex.value]),
                        ),
                        Positioned(
                          bottom: 20.h, // Adjust the position as needed
                          left: 0.w,
                          right: 0.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                height: 55.h, // Adjust the height as needed
                                child: Obx(
                                  () => Row(
                                    children: controller.images
                                        .take(6)
                                        .mapIndexed((index, imagePath) {
                                      return Padding(
                                        padding: EdgeInsets.only(
                                            left: index == 0 ? 5 : 0,
                                            right: 4,
                                            top: 4,
                                            bottom:
                                                4), // Add spacing between images
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          child: GestureDetector(
                                            onTap: () {
                                              controller.selectedImageIndex
                                                  .value = index;
                                            },
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Image.asset(
                                                  imagePath,
                                                  width: 50
                                                      .w, // Adjust the width as needed
                                                  height: 50
                                                      .h, // Adjust the height as needed
                                                  fit: BoxFit.cover,
                                                ),
                                                if (index == 5 &&
                                                    controller.images.length >
                                                        6)
                                                  Container(
                                                    width:
                                                        50, // Adjust the width to match the image
                                                    height:
                                                        50, // Adjust the height to match the image
                                                    color: Colors.black.withOpacity(
                                                        0.6), // Adjust the opacity as needed
                                                  ),
                                                if (index == 5 &&
                                                    controller.images.length >
                                                        6)
                                                  Text(
                                                    '${controller.images.length - 5 - 1}+',
                                                    textAlign: TextAlign.center,
                                                    style: globalTextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20,
                                                    ),
                                                  )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Image end
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //Spacer(),

                            RatingBarIndicator(
                              rating: 4,
                              itemBuilder: (context, index) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: 30.0,
                              unratedColor: Colors.amber.withAlpha(50),
                              direction: Axis.horizontal,
                            ),

                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Total Price',
                                    textAlign: TextAlign.start,
                                    style: globalTextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Text(
                                    'RS. 5600',
                                    textAlign: TextAlign.start,
                                    style: globalTextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ]),
                          ],
                        ),
                        Text(
                          'Black Pant for Men',
                          style: globalTextStyle(
                              color: Colors.black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          'Product Details',
                          style: globalTextStyle(
                              color: Colors.black.withOpacity(0.8),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 8.h),
                        ExpandableText(
                          'Introducing our exclusive collection of black pants for men. Elevate your wardrobe with this modern twist on a classic. Crafted with precision, these suits offer a contemporary take on traditional elegance. Ideal for weddings, business, or special occasions, our designs ensure you stand out with confidence and style. Shop now for a fresh sartorial perspective.',
                          expandText: 'Read more',
                          collapseText: 'Read less',
                          maxLines: 3,
                          linkEllipsis: false,
                          linkColor: Theme.of(context).primaryColor,
                          style: globalTextStyle(
                              color: AppColors.customGrey,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 5.h),
                        const Divider(),
                        SizedBox(height: 16.h),
                        Text(
                          'Select Size',
                          style: globalTextStyle(
                              color: Colors.black.withOpacity(0.8),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 8.h),
                        Obx(
                          () => Row(
                            children: controller.sizes.value
                                .mapIndexed((index, size) {
                              return GestureDetector(
                                onTap: () {
                                  controller.selectedSizeIndex.value = index;
                                },
                                child: Container(
                                    margin: EdgeInsets.only(
                                        left: index == 0 ? 0 : 8,
                                        right: 0), // Add spacing between images
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 21, vertical: 8),
                                    decoration: BoxDecoration(
                                      color: index ==
                                              controller.selectedSizeIndex.value
                                          ? Theme.of(context).primaryColor
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          width: 1,
                                          color: index ==
                                                  controller
                                                      .selectedSizeIndex.value
                                              ? Theme.of(context).primaryColor
                                              : Colors.black.withOpacity(0.1)),
                                    ),
                                    child: Text(
                                      '$size',
                                      style: globalTextStyle(
                                        color: index ==
                                                controller
                                                    .selectedSizeIndex.value
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                      ),
                                    )),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Obx(
                          () => RichText(
                            text: TextSpan(
                              style: globalTextStyle(
                                  color: Colors.black.withOpacity(0.8),
                                  fontSize: 14.sp),
                              children: [
                                TextSpan(
                                  text: 'Select Color : ',
                                  style: globalTextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp),
                                ),
                                TextSpan(
                                  text:
                                      '${controller.colors.value[controller.selectedColorIndex.value]['label']}',
                                  style: globalTextStyle(
                                      color: Colors.grey, fontSize: 15.sp),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Obx(
                          () => Row(
                            children: controller.colors.value
                                .mapIndexed((index, color) {
                              return GestureDetector(
                                onTap: () {
                                  controller.selectedColorIndex.value = index;
                                },
                                child: Container(
                                    margin: EdgeInsets.only(
                                        left: index == 0 ? 0 : 8,
                                        right: 0), // Add spacing between images
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: index ==
                                              controller
                                                  .selectedColorIndex.value
                                          ? Colors.white
                                          : color['value'],
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          width: 8.w, color: color['value']),
                                    )),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: 16.h),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          // Appbar
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.only(
                    top: 50, bottom: 4, left: 16, right: 16),
                color: controller.scrollPosition > 20
                    ? Colors.white
                    : Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        width: 50.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.customLightGrey,
                            width: 2.0,
                          ),
                        ),
                        child: const Icon(
                          FlutterRemix.arrow_left_line,
                          color: Colors.black, // Set the icon color to black
                        ),
                      ),
                    ),
                    Text(
                      'Product Details',
                      style: globalTextStyle(
                          color: Colors.black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        width: 50.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.customLightGrey,
                            width: 2.0,
                          ),
                        ),
                        child: const Icon(
                          FlutterRemix.heart_2_line,
                          color: Colors.black, // Set the icon color to black
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          // Bottombar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 80.h,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Shadow color
                    spreadRadius: 2, // Spread radius
                    blurRadius: 4, // Blur radius
                    offset: const Offset(0, -2), // Shadow offset (upward)
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    text: 'Try on 3D',
                    width: 150,
                    onPressed: () {},
                  ),
                  CustomButton(
                      text: 'Add to Cart',
                      width: 150,
                      onPressed: () {
                        Get.to(() => BottomNavScreen());
                        final BottomBarController bottomBarController =
                            Get.find();

                        bottomBarController.selectedIndex.value = 2;

                        cartController.addToCart(
                          cart: CartItemModel(
                            id: '1',
                            quantity: 1,
                            size: controller.sizes
                                .value[controller.selectedSizeIndex.value],
                            color: controller.colors
                                    .value[controller.selectedColorIndex.value]
                                ['value'],
                            name: 'Brown Jacket',
                            image: controller.images.value[1],
                            price: 300,
                          ),
                        );
                      }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
