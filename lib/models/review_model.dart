class ReviewModel {
  String? productid;
  String? userid;
  String? review;
  double? rating;
  ReviewModel({
    this.productid,
    this.userid,
    this.review,
    this.rating,
  });

  ReviewModel.fromJson(Map<String, dynamic> json) {
    productid = json['product_id'];
    userid = json['user_id'];
    review = json['review'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': productid,
      'user_id': userid,
      'review': review,
      'rating': rating.toString(),
    };
  }
}
