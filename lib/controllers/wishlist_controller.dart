import 'package:get/get.dart';
import 'package:virtual_try_on/models/product_model.dart';
import 'package:virtual_try_on/services/favourite_services.dart';

// ignore: camel_case_types
class Wishlist_Controller extends GetxController {
  RxList<ProductModel> favs = <ProductModel>[].obs;

  @override
  Future<void> onInit() async {
    List<ProductModel> allfavs = await FavouritesServices.fetchFavs();
    favs.value = allfavs;
    super.onInit();
  }
}
