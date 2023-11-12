import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/controllers/profile_controller.dart';
import 'package:virtual_try_on/core/text_styles.dart';
import 'package:virtual_try_on/screens/auth_screens/complete_profile_screen.dart';
import 'package:virtual_try_on/screens/my_orders_screen.dart';
import '../../config/supabase.dart';
import '../../core/colors.dart';
import '../auth_screens/login_screen.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                height: 30.h,
              ),
              Center(
                child: Stack(
                  children: [
                     const CircleAvatar(
                      radius: 65, // Adjust the size of the avatar as needed
                      backgroundColor: Colors.blue,
                      foregroundColor:
                      Colors.grey, // Background color of the avatar
                      backgroundImage: AssetImage(
                          'assets/images/images.jpeg'), // Replace with your image URL
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
              Padding(
                padding: EdgeInsets.fromLTRB(15.0.h, 32.0.h, 32.0.h, 32.0.h),
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle, // Make it circular
                      border: Border.all(
                        color: AppColors
                            .customLightGrey, // Set the border color to grey
                        //width: .0, // Set the border width
                      ),
                    ),
                    child: const Icon(
                      FlutterRemix.arrow_left_line,
                      color: Colors.black, // Set the icon color to black
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              const Center(
                child: CircleAvatar(
                  radius: 50,

                  //backgroundColor: Colors.blue,
                  foregroundColor:
                      Colors.grey, // Background color of the avatar
                  backgroundImage: AssetImage(
                    'assets/images/avatar.jpg',
                  ), // Replace with your image URL
                ),
              ),
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

              ListTile(
                title: const Text('Payment Methods'),
                leading: const Icon(FlutterRemix.secure_payment_fill),
                trailing: const Icon(FlutterRemix.arrow_right_s_line),
                onTap: () {

                },
              ),

              ListTile(
                title: const Text('My Orders'),
                leading: const Icon(FlutterRemix.handbag_fill),
                trailing: const Icon(FlutterRemix.arrow_right_s_line),
                onTap: () {

                },
              ),

              ListTile(
                title: const Text('Settings'),
                leading: const Icon(FlutterRemix.settings_3_line),
                trailing: const Icon(FlutterRemix.arrow_right_s_line),
                onTap: () {

                },
              ),

              ListTile(
                title: const Text('Help Center'),
                leading: const Icon(FlutterRemix.account_box_fill),
                trailing: const Icon(FlutterRemix.arrow_right_s_line),
                onTap: () {

                },
              ),

              ListTile(
                title: const Text('Privacy Policy'),
                leading: const Icon(FlutterRemix.lock_fill),
                trailing: const Icon(FlutterRemix.arrow_right_s_line),
                onTap: () {

                },
              ),

              ListTile(
                title: const Text('Invites Friends'),
                leading: const Icon(FlutterRemix.user_shared_fill),
                trailing: const Icon(FlutterRemix.arrow_right_s_line),
                onTap: () {

                },
              ),

              ListTile(
                title: const Text('Logout'),
                leading: const Icon(FlutterRemix.logout_box_fill),
                trailing: const Icon(FlutterRemix.arrow_right_s_line),
              ),

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
                  Get.to(() => const MyOrdersScreen());
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
                    Get.offAll(() => const LoginScreen());
                  } catch (e) {
                    log(e.toString());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
