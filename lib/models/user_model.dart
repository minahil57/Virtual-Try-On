class UserModel {
  String? id;
  String? name;
  String? email;
  String? gender;
  String? image;
  String? phone;
  String? cartid;
  UserModel(
      {this.id,
      this.name,
      this.email,
      this.gender,
      this.image,
      this.phone,
      this.cartid});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
    phone = json['phone'];
    cartid = json['cart_id'];
    gender = json['gender'];
  }
}
