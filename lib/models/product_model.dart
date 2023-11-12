class ProductModel {

  String? id;
  String? productname;
  int? price;
  int? rating;
  String? image;

  ProductModel({
    this.id,
    this.price,
    this.productname,
    this.rating,
    this.image
  });

  factory ProductModel.fromJson(Map<String, dynamic> map){
    return ProductModel(
      id:map['id'],
      productname: map['name'],
      price: map['price'],
      image: map['images'][0],
    );
  }
}