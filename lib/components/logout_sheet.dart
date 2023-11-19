import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/config/supabase.dart';
import 'package:virtual_try_on/core/colors.dart';
import 'package:virtual_try_on/core/text_styles.dart';
import 'package:virtual_try_on/main.dart';
import 'package:virtual_try_on/models/user_model.dart';
import 'package:virtual_try_on/screens/auth_screens/login_screen.dart';

class LogoutSheet extends StatelessWidget {
  const LogoutSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.3,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            child: Center(
              child: Text(
                'Logout',
                style: globalTextStyle(
                    fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30.0.h),
            child: const Divider(
              indent: 20,
              endIndent: 20,
            ),
          ),
          Text('Are you sure you want to logout?',
              style: globalTextStyle(
                fontSize: 12.sp,
                color: AppColors.customGrey,
              )),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(left: 17.0.h, right: 17.0.h, bottom: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle the first button's action
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors
                          .customLightGrey, // Change the button's background color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20.0), // Rounded corners
                      ),
                      minimumSize: const Size(
                          180, 45), // Increase the button's width and height
                    ),
                    child: Text('Cancel',
                        style: globalTextStyle(
                            fontSize: 13.sp, color: AppColors.primary)),
                  ),
                ),
                SizedBox(width: 20.w),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        await supabase.auth.signOut();
                        await Get.offAll(() => const LoginScreen());
                        currentuser.value = UserModel();
                        // ignore: invalid_use_of_protected_member
                        currentuser.refresh();
                      } catch (e) {
                        log(e.toString());
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors
                          .primary, // Change the button's background color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20.0.r), // Rounded corners
                      ),
                      minimumSize: const Size(
                          180, 45), // Increase the button's width and height
                    ),
                    child: Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.white, // Change the text color
                        fontSize: 13.sp, // Adjust the font size
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
