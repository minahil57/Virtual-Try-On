// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/controllers/cart_controller.dart';
import 'package:virtual_try_on/controllers/index_controller.dart';
import 'package:virtual_try_on/controllers/product_details_controller.dart';
import 'package:virtual_try_on/core/colors.dart';
import 'package:virtual_try_on/core/text_styles.dart';
import 'package:virtual_try_on/helpers/get_color.dart';
import 'package:virtual_try_on/models/product_model.dart';
import 'package:virtual_try_on/screens/model_screen.dart';
import 'package:virtual_try_on/widgets/custom_button.dart';

class ProductDetailsScreen3State extends GetView<Product_details_controller> {
  final ProductModel product;
  final double avgRating;
  final RxBool isFav;

  const ProductDetailsScreen3State({
    super.key,
    required this.product,
    required this.isFav,
    required this.avgRating,
  });

  @override
  Widget build(BuildContext context) {
    Get.putOrFind(() => Product_details_controller());
    final indexcontroller = Get.putOrFind(() => IndexController());
    final Cart_Controller cartController = Get.put(Cart_Controller());
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
                          image: NetworkImage(
                            product
                                .images![controller.selectedImageIndex.value],
                          ),
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
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                height: 55.h, // Adjust the height as needed
                                child: Row(
                                  children: product.images!
                                      .take(4)
                                      .mapIndexed((index, imagePath) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          left: index == 0 ? 4 : 0,
                                          right: 4,
                                          top: 4,
                                          bottom:
                                              4), // Add spacing between images
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: GestureDetector(
                                          onTap: () {
                                            controller.selectedImageIndex
                                                .value = index;
                                          },
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Container(
                                                width: 50
                                                    .w, // Adjust the width as needed
                                                height: 50
                                                    .h, // Adjust the height as needed
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  border: Border.all(
                                                    color: controller
                                                                .selectedImageIndex
                                                                .value ==
                                                            index
                                                        ? AppColors.primary
                                                        : Colors.transparent,
                                                    width: 2.5,
                                                  ),
                                                  image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                      imagePath,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
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
                              rating: avgRating,
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
                                    'Rs-${product.price}',
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
                          '${product.name}',
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
                        // Text('${productData.description}'),
                        ExpandableText(
                          '${product.description}',
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
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 8.h),
                        Obx(
                          () => Row(
                            children: product.sizes!.mapIndexed((index, size) {
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
                                      size,
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
                        RichText(
                          text: TextSpan(
                            style: globalTextStyle(
                                color: Colors.black.withOpacity(0.8),
                                fontSize: 14.sp),
                            children: [
                              TextSpan(
                                text: 'Select Color : ',
                                style: globalTextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.sp),
                              ),
                            ],
                          ),
                        ),
                        Obx(
                          () => Row(
                            children:
                                product.colors!.mapIndexed((index, color) {
                              return GestureDetector(
                                onTap: () {
                                  controller.selectedColorIndex.value = index;
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      right: 8), // Add spacing between images
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: index ==
                                            controller.selectedColorIndex.value
                                        ? Colors.white
                                        : HexColor(color),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      width: 8.w,
                                      color: HexColor(color),
                                    ),
                                  ),
                                ),
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
                        isFav.value
                            ? indexcontroller.handleRemoveFromFav(
                                product.id!, isFav)
                            : indexcontroller.handleAddToFav(
                                product.id!, isFav);
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
                        child: Obx(
                          () => Icon(
                            isFav.value
                                ? FlutterRemix.heart_2_fill
                                : FlutterRemix.heart_2_line,
                            size: 12.dg,
                            color: AppColors.primary,
                          ),
                        ),

                        // Set the icon color to black
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
                mainAxisAlignment: product.maleModel != null && product.femaleModel != null
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.center,
                children: [
                  if (product.maleModel != null && product.femaleModel != null)
                    CustomButton(
                      text: 'Try on 3D',
                      width: 150,
                      onPressed: () {
                        Get.to(
                          () => ModelScreen(
                            maleModel: product.maleModel!,
                            femaleModel: product.femaleModel!,
                            name: product.name!,
                          ),
                        );
                      },
                    ),
                  CustomButton(
                      text: 'Add to Cart',
                      width: 150,
                      onPressed: () {
                        cartController.addToCart(
                          cart: {
                            'product_id': product.id,
                            'quantity': 1,
                            'size': product
                                .sizes![controller.selectedSizeIndex.value],
                            'color': product
                                .colors![controller.selectedColorIndex.value],
                          },
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
