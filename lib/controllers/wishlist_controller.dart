import 'package:get/get.dart';
import 'package:virtual_try_on/models/product_model.dart';

class Wishlist_Controller extends GetxController {
  RxList<ProductModel> favs = <ProductModel>[].obs;
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
