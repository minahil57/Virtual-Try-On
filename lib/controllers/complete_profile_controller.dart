import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../services/user_authentication_services.dart';

class CompleteProfileController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  late SingleValueDropDownController GenderController = SingleValueDropDownController();
  final UserAuthentication userAuthentication = UserAuthentication();
  final GlobalKey<FormState> formkeey = GlobalKey<FormState>();
  RxBool agreedToTerms = false.obs;
  RxBool obscureText = true.obs;
  final Rx<XFile?> _imageFile = Rx<XFile?>(null);
  void toggleObscureText() {
    obscureText.value = !obscureText.value;
  }

  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    try {
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      _imageFile.value = image;
      print(image);
    } catch (e) {
      print("Error picking image: $e");
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
