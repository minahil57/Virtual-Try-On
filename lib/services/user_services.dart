import 'package:virtual_try_on/helpers/show_toast.dart';
import 'package:virtual_try_on/models/user_model.dart';

import '../config/supabase.dart';

class UserServices {
  static Future<UserModel> fetchUser() async {
    try {
      final response = await supabase
          .from('profiles')
          .select('*')
          .eq('id', supabase.auth.currentUser!.id)
          .withConverter((data) => UserModel.fromJson(data[0]));
      // print(response[0].cartid);
      return response;
    } catch (e) {
      return UserModel(); // Return an empty list in case of an error
    }
  }

  Future<void> changeName(String name) async {
    try {
      final response = await supabase.from('profiles').update({
        'name': name,
      }).eq('id', supabase.auth.currentUser!.id);
      if (response.status == 204) {
        showToast('name changed ');
      }
    } catch (e) {
      showToast('Name not changed');
    }
  }
}
