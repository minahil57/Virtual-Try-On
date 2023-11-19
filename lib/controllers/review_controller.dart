import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/main.dart';
import 'package:virtual_try_on/services/review_service.dart';

class ReviewController extends GetxController {
  final TextEditingController review = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  RxDouble rating = 3.0.obs;
  Future<void> postReview(String productid) async {
    await ReviewService.setReview(review: {
      "review": review.text,
      "rating": rating.value,
      "product_id": productid,
      "user_id": currentuser.value.id,
    });
  }

  @override
  void onClose() {
    review.dispose();
    rating.dispose();
    super.onClose();
  }
}
