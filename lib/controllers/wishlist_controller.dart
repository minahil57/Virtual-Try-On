import 'package:get/get.dart';
import 'package:virtual_try_on/models/product_model.dart';
import 'package:virtual_try_on/services/favourite_services.dart';

// ignore: camel_case_types
class Wishlist_Controller extends GetxController {
  RxList<ProductModel> favs = <ProductModel>[].obs;
  FavouritesServices fav = FavouritesServices();

  @override
  Future<void> onInit() async {
    // TODO: implement onInit

    List<ProductModel> allfavs = await fav.FetchFavs();
    favs.value = allfavs;
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
