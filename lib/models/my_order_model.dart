import 'package:virtual_try_on/models/cart_model.dart';

import 'product_model.dart';

class OrderModel {
  String? id;
  String? status;
  int? total;
  List<OrderDetailModel>? ordersDetail;
  OrderModel({this.id, this.status, this.total, this.ordersDetail});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    total = json['price'];
    ordersDetail = <OrderDetailModel>[];
    if (json['order_details'] != null) {
      json['order_details'].forEach((v) {
        ordersDetail!.add(OrderDetailModel.fromJson(v));
      });
    }
  }
}

class OrderDetailModel {
  ProductModel? product;
  String? size;
  String? color;
  int? quantity;
  OrderDetailModel({
    this.product,
    this.size,
    this.color,
    this.quantity,
  });
  OrderDetailModel.fromJson(Map<String, dynamic> json) {
    product = ProductModel.fromJson(json['products']);
    size = json['size'];
    color = json['color'];
    quantity = json['quantity'];
  }
}
