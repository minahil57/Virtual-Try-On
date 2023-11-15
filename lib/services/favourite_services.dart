import 'package:virtual_try_on/config/supabase.dart';
import 'package:virtual_try_on/helpers/show_toast.dart';

import '../models/product_model.dart';

class FavouritesServices{
  
  Future<void> AddToFav( String UserId, productID) async {
    print(UserId);
    print(productID);
    
    final response = await supabase.from('favourite').insert({'user_id':UserId,'product_id':productID}).execute();
    if(response.status == 201){
      showToast("Added To Favourites");

    }
    else{
      showToast("Error Adding To Favourites");
    }
  }

  Future <List<ProductModel>> FetchFavs() async{

    final response = await supabase.from('favourite').select('product_id').eq('user_id', supabase.auth.currentUser!.id).execute();
    if(response.status == 200){
      print('id fetched');
      response.data[0]['product_id'];
      //print(response.data.id);

      final favourites = await supabase.from('products')
          .select('id,name,price,images,sizes,colors,description').eq('id', response.data[0]['product_id'])
          .withConverter(
            (data) => List<ProductModel>.from(
          data.map((item) => ProductModel.fromJson(item)),
        ),
      );
      return favourites ;
    }
    return [];
  }

}