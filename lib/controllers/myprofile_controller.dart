import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:virtual_try_on/helpers/show_toast.dart';
import 'package:virtual_try_on/services/user_services.dart';

class YourProfileController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController gender = TextEditingController();
  UserServices user = UserServices();

  final Rx<XFile?> imageFile = Rx<XFile?>(null);
  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    try {
      XFile? image = await picker.pickImage(source: ImageSource.gallery);
      imageFile.value = image;
    } catch (e) {
      showToast("Error picking image");
    }
  }
}
