import 'product_model.dart';

class OrderModel {
  String? id;
  String? status;
  int? total;
  String? orderno;
  List<OrderDetailModel>? ordersDetail;
  OrderModel(
      {this.id, this.status, this.total, this.ordersDetail, this.orderno});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    total = json['price'];
    orderno = json['order_no'];
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
