class ProductModel {
  String? id;
  String? name;
  String? description;
  int? price;
  double? rating;
  List<String>? images;
  List<String>? sizes;
  List<String>? colors;

  ProductModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.rating,
    this.images,
    this.sizes,
    this.colors,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    rating = json['rating'];
    images = json['images'].cast<String>() ?? [];
    //sizes = json['sizes'].cast<String>() ?? [];
    //colors = json['colors'].cast<String>() ?? [];
  }
}
