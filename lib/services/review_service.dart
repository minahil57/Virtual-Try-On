import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/config/supabase.dart';
import 'package:virtual_try_on/screens/review_success.dart';

class ReviewService {
  static Future<void> setReview({required Map<String, dynamic> review}) async {
    try {
      EasyLoading.show();
      await supabase.from('reviews').insert(review);
      EasyLoading.dismiss();
      Get.to(() => const ReviewSuccess());
    } catch (e) {
      EasyLoading.dismiss();
    }
  }
}
