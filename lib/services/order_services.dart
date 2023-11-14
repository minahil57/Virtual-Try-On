// import 'package:virtual_try_on/config/supabase.dart';
// import 'package:virtual_try_on/models/cart_model.dart';
//
// class OrderServices{
//
//   Future<void> PlaceOrder({required CartItemModel cart,required total,required adress})async {
//
//     final response = supabase.from('order').insert([
//       {
//       'user_id':supabase.auth.currentUser!.id,
//       'address': adress,
//       'price':total,
//
//     }
//     ]).select('*').withConverter((data) => CartItemModel.fromJson(data));
//     response.
//     final response2 = supabase.from('order_detail')
//         .insert(cart.toJson(),adress).execute();
//
//   }
// }