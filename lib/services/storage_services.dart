import 'dart:developer';
import 'dart:io';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:virtual_try_on/config/supabase.dart';

class StorageServices {
  static Future<String> uploadImage({
    required String bucket,
    required String name,
    required File file,
  }) async {
    try {
      await EasyLoading.show();

      await supabase.storage.from(bucket).upload(
            name,
            file,
          );

      final String publicUrl = supabase.storage.from(bucket).getPublicUrl(name);
      return publicUrl;
    } catch (e) {
      await EasyLoading.dismiss();
      log(e.toString());
      rethrow;
    }
  }

  static Future<bool> deleteImage({
    required String folder,
    required String name,
  }) async {
    try {
      await supabase.storage.from(folder).remove([name]);
      return true;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
