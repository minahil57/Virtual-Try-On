import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/config/supabase.dart';
import 'package:virtual_try_on/helpers/show_toast.dart';
import 'package:virtual_try_on/models/cart_model.dart';
import 'package:virtual_try_on/models/my_order_model.dart';
import 'package:virtual_try_on/models/product_model.dart';
import 'package:virtual_try_on/screens/order_success.dart';
import 'package:virtual_try_on/services/cart_services.dart';

class OrderServices {
  static Future<void> placeOrder(
      {required List<CartItemModel> carts,
      required total,
      required adress,
      required String cartId}) async {
    try {
      await EasyLoading.show();
      final response = await supabase.from('orders').insert({
        'user_id': supabase.auth.currentUser!.id,
        'address': adress,
        'price': total,
      }).select('id');

      for (CartItemModel item in carts) {
        final response1 = await supabase.from('order_details').insert(
          {
            'product_id': item.products!.id,
            'quantity': item.quantity,
            'color': item.color,
            'size': item.size,
            'order_id': response[0]['id'],
          },
        );
      }
      await CartServices.clearCart(cartId);
      await EasyLoading.dismiss();
      Get.to(() => const Success());
    } catch (e) {
      await EasyLoading.dismiss();
      showToast('An unexpected error occured');
      print(e);
    }
  }

  static Future<List<OrderModel>> fetchOrders(
      {required String id, required String status}) async {
    try {
      final response = await supabase
          .from('orders')
          .select(
              'price,status,order_details(product_id,quantity,color,size, products(images,name, price))')
          .eq('user_id', supabase.auth.currentUser!.id)
          .eq('status', status)
          .withConverter(
            (data) => List<OrderModel>.from(
              data.map((item) => OrderModel.fromJson(item)),
            ),
          );
      return response;
    } catch (e) {
      print('error:  $e');
      return [];
    }
  }
}
