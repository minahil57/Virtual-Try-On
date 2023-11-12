import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/controllers/cart_controller.dart';
import 'package:virtual_try_on/core/colors.dart';
import 'package:virtual_try_on/core/text_styles.dart';
import 'package:virtual_try_on/models/cart_model.dart';
import 'package:virtual_try_on/components/cart_delete_sheet.dart';
import 'package:virtual_try_on/widgets/show_sheet.dart';

class CartList extends GetView<Cart_Controller> {
  final CartItemModel cartItem;
  final int index;

  CartList(this.cartItem, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      child: Column(
        children: [
          Slidable(
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              key: const ValueKey(1),
              dismissible: DismissiblePane(onDismissed: () {}),
              children: [
                SlidableAction(
                  // onPressed: (_)=>showAsBottomSheet(context,cartItem),
                  onPressed: (_) => showCustomSheet(
                    context: context,
                    child: CartDeleteSheet(
                      item: cartItem,
                    ),
                  ),
                  backgroundColor: const Color.fromARGB(255, 255, 121, 121),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  autoClose: true,
                  padding: const EdgeInsets.all(10.0),
                  // label: 'Delete',
                ),
              ],
            ),
            child: ListTile(
              leading: Container(
                height: 300.h,
                // width: ,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      10.0), // Adjust the radius as needed
                  border: Border.all(
                    color: AppColors
                        .customLightGrey, // You can customize the border color
                    width: 1.0,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    '${cartItem.image}',
                    fit: BoxFit.cover,
                    height: 70.h,
                    width: 70.w, // Ensure the image covers the entire container
                  ),
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${cartItem.name}',
                    style: globalTextStyle(fontSize: 15),
                  ),
                  Text(
                    'Size: ${cartItem.size}',
                    style: globalTextStyle(
                        fontSize: 10, color: AppColors.customGrey),
                  ),
                ],
              ),
              subtitle: SizedBox(
                  width: Get.width * 0.01,
                  child: Row(
                    children: [
                      Text('Rs- ${cartItem.price}'),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                          margin: EdgeInsets.only(
                              left: index == 0 ? 0 : 8,
                              right: 0), // Add spacing between images
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: cartItem.color,
                            borderRadius: BorderRadius.circular(20),
                            // border: Border.all(
                            //   width: 8.w,
                            // ),
                          )),
                    ],
                  )),
              trailing: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 110, // Adjusted width for better proportions
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.decreaseQuantity(cartItem);
                          // print('Minux Tap');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.customGrey,
                            borderRadius: BorderRadius.circular(
                                5.0), // Adjust the radius as needed
                            border: Border.all(
                              color: AppColors.customGrey,
                              width: 1.0,
                            ),
                          ),
                          height: 30,
                          child: const Icon(
                            FlutterRemix.subtract_line,
                            color: AppColors.customBlack,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text('${cartItem.quantity}',
                          style: globalTextStyle(fontSize: 20)),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          controller.increaseQuantity(cartItem);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(
                                5.0), // Adjust the radius as needed
                            border: Border.all(
                              color: AppColors.primary,
                              width: 1.0,
                            ),
                          ),
                          height: 30,
                          child: const Icon(
                            FlutterRemix.add_line,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
