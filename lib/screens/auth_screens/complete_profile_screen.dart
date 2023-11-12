import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/controllers/complete_profile_controller.dart';
import 'package:virtual_try_on/core/colors.dart';
import '../../core/text_styles.dart';
import '../../widgets/custom_button.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:virtual_try_on/widgets/bottom_sheet.dart';
class CompleteProfile extends GetView<CompleteProfileController> {
  const CompleteProfile({super.key});

  @override
  Widget build(BuildContext context) {
    Get.putOrFind(() => CompleteProfileController());
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
      padding: EdgeInsets.only(
        top: 10.h,
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(15.0.h, 32.0.h, 32.0.h, 32.0.h),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  width: 50, // Set the width and height to make it circular
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, // Make it circular
                    border: Border.all(
                      color: AppColors
                          .customLightGrey, // Set the border color to grey
                      //width: 1.0, // Set the border width
                    ),
                  ),
                  child: const Icon(
                    FlutterRemix.arrow_left_line,
                    color: Colors.black, // Set the icon color to black
                  ),
                ),
              ),
            ),
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
                   CircleAvatar(
                    radius: 50, // Adjust the size of the avatar as needed
                    backgroundColor: Colors.blue,
                    foregroundColor:
                        Colors.grey, // Background color of the avatar
                    backgroundImage: AssetImage(
                        'assets/images/avatar.jpg'), // Replace with your image URL
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 35,
                      decoration:  const BoxDecoration(
                        shape: BoxShape.circle, // Make it circular
                        color: AppColors.primary, // Set the background color
                      ),
                      child: IconButton(
                        icon:  const Icon(
                          FlutterRemix.edit_line,
                          size: 20,
                          color: AppColors.customLightGrey,
                        ),
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    ListTile(
                                      leading: Icon(Icons.photo_library),
                                      title: Text('Choose from Gallery'),
                                      onTap: () {
                                        //_getImage(ImageSource.gallery);
                                        //controller.getImage(ImageSource.gallery);
                                        controller.pickImage();
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      leading: Icon(Icons.camera_alt),
                                      title: Text('Take a Photo'),
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

                          // Handle the action to change the profile picture here
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
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        'Name',
                        textAlign: TextAlign.center,
                        style: globalTextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        controller: controller.nameController,
                        obscureText: true,
                        decoration: InputDecoration(
                          //alignLabelWithHint: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(
                                30), // Adjust the value to control the roundness
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: AppColors
                                    .customGrey), // Border when the field is not focused
                            borderRadius: BorderRadius.circular(
                                30), // Adjust the value to control the roundness
                          ),
                          fillColor: Colors.white54,
                          hintText: 'John Doe',
                          hintStyle: const TextStyle(color: Colors.grey),
                          contentPadding:
                              const EdgeInsets.only(bottom: 15, left: 10),
                          focusColor: Colors.white60,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        'Phone Number',
                        textAlign: TextAlign.center,
                        style: globalTextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: InternationalPhoneNumberInput(
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
                          keyboardType: const TextInputType.numberWithOptions(
                              signed: true, decimal: true),
                          onSaved: (PhoneNumber number) {},
                        )),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        'Gender',
                        textAlign: TextAlign.center,
                        style: globalTextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: DropDownTextField(
                        //controller: controller.GenderController.field1,
                        controller: controller.GenderController,
                        clearOption: true,
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
                    ),
                    SizedBox(height: 20.h),
                  ]),
            ),
            SizedBox(height: 40.h),
            Center(
              child: CustomButton(
                  text: 'Complete Profile',
                  width: Get.width * 0.7.w,
                  onPressed: () {
                    controller.userAuthentication.CompleteProfiles(controller.nameController.text, controller.phoneController.text, controller.GenderController.dropDownValue?.value);

                  }),
            ),
            SizedBox(height: 20.h),
          ]),
    )));
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
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Choose from Gallery'),
                onTap: () {
                  //_getImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Take a Photo'),
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