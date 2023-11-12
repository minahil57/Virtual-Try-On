import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ReviewController extends GetxController {
  final TextEditingController review = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  RxDouble rating = 3.0.obs;
  @override
  void onClose() {
    review.dispose();
    rating.dispose();
    super.onClose();
  }
}
