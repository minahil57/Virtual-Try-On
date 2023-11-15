import 'package:virtual_try_on/models/user_model.dart';

import '../config/supabase.dart';

class user{
  Future<List<UserModel>> FetchUser() async {
    print('user fetched');
    try {
      final response = await supabase
          .from('profiles')
          .select('*')
          .eq('id', supabase.auth.currentUser!.id)
          .withConverter(
            (data) => List<UserModel>.from(
          data.map((item) => UserModel.fromJson(item)),
        ),
      );
     // print(response.last.email);
      return response;
    } catch (e) {
      print(e.toString());
      return []; // Return an empty list in case of an error
    }
  }
}