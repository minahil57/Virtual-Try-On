class UserModel{
  String? id;
  String? name;
  String? email;
  String? gender;
  String? image;
  String? phone;
  String? cart_id;
  UserModel({
    this.id,
    this.name,
    this.email,
    this.gender,
    this.image,
    this.phone,
    this.cart_id
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
    phone = json['phone'];
    gender = json['gender'];
  }
}