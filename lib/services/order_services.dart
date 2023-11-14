import 'package:virtual_try_on/config/supabase.dart';

class OrderServices{
  
  Future<void> PlaceOrder()async {
    supabase.from('orders')
        .insert({});
    
    
  }
}