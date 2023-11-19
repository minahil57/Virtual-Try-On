import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:virtual_try_on/helpers/show_toast.dart';

import '../services/user_authentication_services.dart';

class CompleteProfileController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  late SingleValueDropDownController genderController =
      SingleValueDropDownController();
  final UserAuthentication userAuthentication = UserAuthentication();
  final GlobalKey<FormState> formkeey = GlobalKey<FormState>();
  RxBool agreedToTerms = false.obs;
  RxBool obscureText = true.obs;
  final Rx<XFile?> imageFile = Rx<XFile?>(null);
  void toggleObscureText() {
    obscureText.value = !obscureText.value;
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    try {
      XFile? image = await picker.pickImage(source: ImageSource.gallery);
      imageFile.value = image;
      update();
    } catch (e) {
      showToast("Error picking image");
    }
  }

  bool passwordVisible = false;
  void initState() {
    passwordVisible = true;
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}
