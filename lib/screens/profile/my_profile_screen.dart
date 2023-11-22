import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/controllers/myprofile_controller.dart';
import 'package:virtual_try_on/core/colors.dart';
import 'package:virtual_try_on/main.dart';
import 'package:virtual_try_on/widgets/custom_button.dart';
import '../../core/text_styles.dart';

class YourProfile extends GetView<YourProfile> {
  const YourProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = Get.putOrFind(() => YourProfileController());
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: 20.h,
              right: 20.h,
              top: 0.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 42.0.h,
                        right: 70.0.h,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          width: 50
                              .w, // Set the width and height to make it circular
                          height: 50.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle, // Make it circular
                            border: Border.all(
                              color: AppColors
                                  .customLightGrey, // Set the border color to grey
                              width: 2.0.w, // Set the border width
                            ),
                          ),
                          child: const Icon(
                            FlutterRemix.arrow_left_line,
                            color: Colors.black, // Set the icon color to black
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0.h, 42.0.h, 30.0.h, 0.h),
                      child: Text(
                        'My Profile',
                        style: globalTextStyle(
                          fontSize: 13.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 65, // Adjust the size of the avatar as needed
                        backgroundColor: AppColors.primary.withOpacity(0.5),
                        foregroundColor:
                            Colors.grey, // Background color of the avatar
                        backgroundImage: NetworkImage(
                          currentuser
                              .value.image!, // Replace with your image URL
                        ),
                      ),
                      // Positioned(
                      //   bottom: 0,
                      //   right: 0,
                      //   child: Container(
                      //     height: 35,
                      //     decoration: const BoxDecoration(
                      //       shape: BoxShape.circle, // Make it circular
                      //       color:
                      //           AppColors.primary, // Set the background color
                      //     ),
                      //     child: IconButton(
                      //       icon: const Icon(
                      //         FlutterRemix.edit_line,
                      //         size: 20,
                      //         color: AppColors.customLightGrey,
                      //       ),
                      //       onPressed: () {
                      //         // Handle the action to change the profile picture here
                      //       },
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(height: 20.h),
                Text(
                  'Name',
                  textAlign: TextAlign.center,
                  style: globalTextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                ListTile(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Enter Your Name'),
                          content: Column(
                            mainAxisSize: MainAxisSize
                                .min, // Set the column height to wrap its content
                            children: [
                              TextFormField(
                                controller: profile.name,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                ),
                                decoration: InputDecoration(
                                  //alignLabelWithHint: true,
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(
                                        30), // Adjust the value to control the roundness
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors
                                            .grey), // Border when the field is not focused
                                    borderRadius: BorderRadius.circular(
                                        30), // Adjust the value to control the roundness
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.red),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.red),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  fillColor: Colors.white54,
                                  hintText: 'John Doe',
                                  hintStyle: TextStyle(
                                    color: AppColors.customGrey,
                                    fontSize: 12.sp,
                                  ),
                                  contentPadding: const EdgeInsets.only(
                                      bottom: 15, left: 15),
                                  focusColor: Colors.white60,
                                ),
                              ),
                              SizedBox(height: 5.h),
                              CustomButton(
                                text: 'Submit',
                                width: Get.width * 0.7.w,
                                onPressed: () {
                                  profile.user.changeName(profile.name.text);
                                  Get.back();
                                  // Add functionality for when the Submit button is pressed
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  leading: const Icon(FlutterRemix.user_fill,
                      color: AppColors.primary),
                  title: Text(
                    currentuser.value.name!.capitalizeFirst,
                    style: globalTextStyle(fontSize: 15, color: Colors.black),
                  ),
                  trailing: const Icon(FlutterRemix.edit_2_fill,
                      color: AppColors.primary),
                ),
                SizedBox(height: 10.h),
                Divider(
                  thickness: 1.sp,
                ),
                SizedBox(height: 10.h),
                Text(
                  'Email',
                  textAlign: TextAlign.center,
                  style: globalTextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                ListTile(
                  leading: const Icon(FlutterRemix.mail_fill,
                      color: AppColors.primary),
                  title: Text(
                    currentuser.value.email!,
                    style: globalTextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
                SizedBox(height: 10.h),
                Divider(
                  thickness: 1.sp,
                ),
                SizedBox(height: 10.h),
                Text(
                  'Phone Number',
                  textAlign: TextAlign.center,
                  style: globalTextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                ListTile(
                  leading: const Icon(FlutterRemix.phone_fill,
                      color: AppColors.primary),
                  title: Text(
                    currentuser.value.phone!,
                    style: globalTextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
                SizedBox(height: 10.h),
                Divider(
                  thickness: 1.sp,
                ),
                SizedBox(height: 10.h),
                Text(
                  'Gender',
                  textAlign: TextAlign.center,
                  style: globalTextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                ListTile(
                  leading: const Icon(FlutterRemix.user_3_line,
                      color: AppColors.primary),
                  title: Text(
                    currentuser.value.gender!.capitalizeFirst,
                    style: globalTextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
