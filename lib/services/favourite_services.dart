import 'package:virtual_try_on/config/supabase.dart';
import 'package:virtual_try_on/helpers/show_toast.dart';

import '../models/product_model.dart';

class FavouritesServices{
  
  Future<void> AddToFav( String UserId, productID) async {
    try{
    final response = await supabase.from('favourite').insert({'user_id':UserId,'product_id':productID}).execute();
    if(response.status == 201) {
      showToast("Added To Favourites");
    }
    }catch(e){
      showToast(e.toString());
    }
  }


  Future<List<ProductModel>> FetchFavs() async {

    final response = await supabase
        .from('favourite')
        .select('*')
        .eq('user_id', supabase.auth.currentUser!.id)
        .execute();
    print(response.status);
    if (response.data != [null]) {
      final favourites = await supabase
          .from('products')
          .select('id,name,price,images,sizes,colors,description')
          .eq('id', response.data[0]['product_id'])
          .withConverter(
            (data) => List<ProductModel>.from(
              data.map((item) => ProductModel.fromJson(item)),
            ),
          );
      return favourites;
    }
    else{
      print('error');
    }
    showToast('No Favourites found');
    return [];
  }
}
