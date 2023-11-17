import 'dart:io';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:virtual_try_on/controllers/complete_profile_controller.dart';
import 'package:virtual_try_on/core/colors.dart';
import 'package:virtual_try_on/helpers/show_toast.dart';

import '../../core/text_styles.dart';
import '../../widgets/custom_button.dart';

class CompleteProfile extends GetView<CompleteProfileController> {
  const CompleteProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.putOrFind(() => CompleteProfileController());
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: Get.height * 0.1,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Complete Your Profile',
                    textAlign: TextAlign.center,
                    style: globalTextStyle(
                      fontSize: 23.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                Center(
                  child: Text(
                    'Do not worry, only you can see your personal\n data. No one else will be able to see it',
                    textAlign: TextAlign.center,
                    style: globalTextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Center(
                  child: Stack(
                    children: [
                      Obx(
                        () => controller.imageFile.value == null
                            ? const CircleAvatar(
                                radius:
                                    50, // Adjust the size of the avatar as needed
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors
                                    .grey, // Background color of the avatar
                                backgroundImage: AssetImage(
                                  'assets/images/avatar.jpg',
                                ), // Replace with your image URL
                              )
                            : CircleAvatar(
                                radius: 50,
                                backgroundImage: FileImage(
                                  File(controller.imageFile.value!.path),
                                ),
                              ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 35,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle, // Make it circular
                            color:
                                AppColors.primary, // Set the background color
                          ),
                          child: IconButton(
                            icon: const Icon(
                              FlutterRemix.edit_line,
                              size: 20,
                              color: AppColors.customLightGrey,
                            ),
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        ListTile(
                                          leading:
                                              const Icon(Icons.photo_library),
                                          title:
                                              const Text('Choose from Gallery'),
                                          onTap: () {
                                            //_getImage(ImageSource.gallery);
                                            //controller.getImage(ImageSource.gallery);
                                            controller.pickImage();
                                            Navigator.pop(context);
                                          },
                                        ),
                                        ListTile(
                                          leading: const Icon(Icons.camera_alt),
                                          title: const Text('Take a Photo'),
                                          onTap: () {
                                            //_getImage(ImageSource.camera);
                                            //controller.getImage(ImageSource.camera);
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Form(
                  key: controller.formkeey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name',
                          style: globalTextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.customBlack),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        TextFormField(
                            keyboardType: TextInputType.text,
                            controller: controller.nameController,
                            style: TextStyle(
                              fontSize: 12.sp,
                            ),
                            decoration: InputDecoration(
                              hintText: 'John Doe',
                              hintStyle: TextStyle(
                                color: AppColors.customLightGrey,
                                fontSize: 12.sp,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              contentPadding:
                                  EdgeInsets.only(bottom: 15.h, left: 15.w),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your Name';
                              } else {
                                return null;
                              }
                            }),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          'Phone Number',
                          textAlign: TextAlign.center,
                          style: globalTextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        InternationalPhoneNumberInput(
                          maxLength: 12,

                          inputBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(
                                30), // Adjust the value to control the roundness
                          ),
                          spaceBetweenSelectorAndTextField: 0,
                          onInputChanged: (PhoneNumber number) {
                            // You can handle input changes here if needed
                          },
                          onInputValidated: (bool value) {
                            // You can handle validation here if needed
                          },
                          selectorConfig: const SelectorConfig(
                            showFlags: false,
                            selectorType: PhoneInputSelectorType.DROPDOWN,
                          ),
                          ignoreBlank: false,
                          autoValidateMode: AutovalidateMode.disabled,
                          selectorTextStyle:
                              const TextStyle(color: Colors.black),
                          //initialValue: number,
                          textFieldController: controller.phoneController,
                          formatInput: true,

                          onSaved: (PhoneNumber number) {},
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          'Gender',
                          textAlign: TextAlign.center,
                          style: globalTextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        DropDownTextField(
                          //controller: controller.GenderController.field1,
                          controller: controller.genderController,
                          clearOption: true,
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          textFieldDecoration: InputDecoration(
                            hintText: "Gender",
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: AppColors.customGrey),
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          validator: (value) {
                            if (value == null) {
                              return "Required field";
                            } else {
                              return null;
                            }
                          },
                          dropDownItemCount: 3,
                          dropDownList: const [
                            DropDownValueModel(name: 'Male', value: "male"),
                            DropDownValueModel(name: 'Female', value: "female"),
                            DropDownValueModel(name: 'Other', value: "other"),
                          ],
                          onChanged: (val) {},
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                Center(
                  child: CustomButton(
                    text: 'Complete Profile',
                    width: Get.width * 0.7.w,
                    onPressed: () {
                      if (controller.formkeey.currentState!.validate()) {
                        if (controller.imageFile.value == null) {
                          showToast('Please select an image');
                        } else if (controller
                                .genderController.dropDownValue?.value ==
                            null) {
                          showToast('Please select gender');
                        } else {
                          controller.userAuthentication.completeProfiles(
                            controller.nameController.text,
                            controller.phoneController.text,
                            controller.genderController.dropDownValue?.value,
                            File(
                              controller.imageFile.value!.path,
                            ),
                          );
                        }
                      }
                    },
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CircularLogoContainer extends StatelessWidget {
  final String logoPath;

  const CircularLogoContainer(this.logoPath, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60, // Adjust the size of the circular container as needed
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle, // Makes it a circular container
        border: Border.all(
          color: Colors.black, // Border color
          width: 1.0, // Border width
        ),
      ),
      child: ClipOval(
        child: Center(
          child: Image.asset(
            logoPath,
            width: 40, // Adjust the size of the logo as needed
            height: 40,
          ),
        ),
      ),
    );
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Choose from Gallery'),
                onTap: () {
                  //_getImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Take a Photo'),
                onTap: () {
                  //_getImage(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
