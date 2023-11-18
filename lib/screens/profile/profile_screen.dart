import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/controllers/profile_controller.dart';
import 'package:virtual_try_on/core/text_styles.dart';
import 'package:virtual_try_on/main.dart';
import 'package:virtual_try_on/models/user_model.dart';
import 'package:virtual_try_on/screens/auth_screens/complete_profile_screen.dart';
import 'package:virtual_try_on/screens/my_orders_screen.dart';

import '../../config/supabase.dart';
import '../../controllers/index_controller.dart';
import '../../core/colors.dart';
import '../auth_screens/login_screen.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final indexcontroller = Get.putOrFind(() => IndexController());
    Get.putOrFind(() => ProfileController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 40.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.h,
              ),
              Center(
                child: Stack(
                  children: [
                    Obx(
                      () => CircleAvatar(
                        radius: 65, // Adjust the size of the avatar as needed
                        backgroundColor: AppColors.primary.withOpacity(0.5),
                        foregroundColor:
                            Colors.grey, // Background color of the avatar
                        backgroundImage: NetworkImage(
                          currentuser
                              .value.image!, // Replace with your image URL
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
                          color: AppColors.primary, // Set the background color
                        ),
                        child: IconButton(
                          icon: const Icon(
                            FlutterRemix.edit_line,
                            size: 20,
                            color: AppColors.customLightGrey,
                          ),
                          onPressed: () {
                            // Handle the action to change the profile picture here
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Center(
                  child: Obx(() => Text(
                        currentuser.value.name!.capitalizeFirst,
                        style: globalTextStyle(
                            fontSize: 15, color: AppColors.primary),
                      ))),
              SizedBox(
                height: 10.h,
              ),
              ListTile(
                title: Text(
                  'Your Profile',
                  style:
                      globalTextStyle(fontSize: 15, color: AppColors.primary),
                ),
                leading: const Icon(
                  FlutterRemix.user_3_line,
                  color: AppColors.primary,
                ),
                trailing: const Icon(
                  FlutterRemix.arrow_right_s_line,
                  color: AppColors.primary,
                ),
                onTap: () {
                  Get.to(() => const CompleteProfile());
                },
              ),
              const Divider(),
              SizedBox(
                height: 10.h,
              ),
              ListTile(
                title: Text(
                  'My Orders',
                  style:
                      globalTextStyle(fontSize: 15, color: AppColors.primary),
                ),
                leading: const Icon(
                  FlutterRemix.survey_line,
                  color: AppColors.primary,
                ),
                trailing: const Icon(
                  FlutterRemix.arrow_right_s_line,
                  color: AppColors.primary,
                ),
                onTap: () {
                  Get.to(() => MyOrdersScreen());
                },
              ),
              const Divider(),
              SizedBox(
                height: 10.h,
              ),
              ListTile(
                title: Text(
                  'Help Center',
                  style:
                      globalTextStyle(fontSize: 15, color: AppColors.primary),
                ),
                leading: const Icon(
                  FlutterRemix.question_line,
                  color: AppColors.primary,
                ),
                trailing: const Icon(
                  FlutterRemix.arrow_right_s_line,
                  color: AppColors.primary,
                ),
                onTap: () {
                  Get.to(() => const CompleteProfile());
                },
              ),
              const Divider(),
              ListTile(
                title: Text(
                  'Logout',
                  style:
                      globalTextStyle(fontSize: 15, color: AppColors.primary),
                ),
                leading: const Icon(
                  FlutterRemix.logout_box_line,
                  color: AppColors.primary,
                ),
                trailing: const Icon(
                  FlutterRemix.arrow_right_s_line,
                  color: AppColors.primary,
                ),
                onTap: () async {
                  try {
                    await supabase.auth.signOut();
                    currentuser.value = UserModel();
                    // ignore: invalid_use_of_protected_member
                    currentuser.refresh();
                    Get.offAll(() => const LoginScreen());
                  } catch (e) {
                    log(e.toString());
                  }
                },
              ),
              SizedBox(
                height: 50.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
