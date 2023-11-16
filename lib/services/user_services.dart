import 'package:virtual_try_on/models/user_model.dart';

import '../config/supabase.dart';

class UserServices {
  static Future<UserModel> FetchUser() async {
    print('user fetched');
    try {
      final response = await supabase
          .from('profiles')
          .select('*')
          .eq('id', supabase.auth.currentUser!.id)
          .withConverter((data) => UserModel.fromJson(data[0]));
      // print(response[0].cartid);
      return response;
    } catch (e) {
      print(e.toString());
      return UserModel(); // Return an empty list in case of an error
    }
  }
}
