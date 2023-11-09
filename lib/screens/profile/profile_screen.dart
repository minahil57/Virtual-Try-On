import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/controllers/confirm_email_controller.dart';
import 'package:virtual_try_on/controllers/profile_controller.dart';
import 'package:virtual_try_on/screens/auth_screens/otp_screen.dart';
import '../../config/supabase.dart';
import '../../core/colors.dart';
import '../../core/text_styles.dart';
import '../../widgets/custom_button.dart';

class ProfileScreen extends  GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.putOrFind(() => ProfileController());
    return Scaffold(

      body:SingleChildScrollView(
          child:Padding(
              padding:  EdgeInsets.only(top:20.h ,),

              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.fromLTRB(15.0.h,32.0.h,32.0.h,32.0.h),
                      child: GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: Container(
                          width: 50, // Set the width and height to make it circular
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle, // Make it circular
                            border: Border.all(
                              color: AppColors.customLightGrey, // Set the border color to grey
                              width: 2.0, // Set the border width
                            ),
                          ),
                          child: const Icon(
                            FlutterRemix.arrow_left_line,
                            color: Colors.black, // Set the icon color to black
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h,),
                    const Center(
                      child: CircleAvatar(
                        radius: 50, // Adjust the size of the avatar as needed
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.grey,// Background color of the avatar
                        backgroundImage: AssetImage('assets/images/avatar.jpg'), // Replace with your image URL
                      ),
                      ),
                    SizedBox(height: 10.h,),
                    const ListTile(
                      title: Text('Your Profile'),
                      leading: Icon(FlutterRemix.profile_fill),
                      trailing: Icon(FlutterRemix.arrow_right_fill),
                    ),

                     ListTile(
                      title: const Text('Logout'),
                      leading: const Icon(FlutterRemix.logout_box_fill),
                      trailing: const Icon(FlutterRemix.arrow_right_fill),
                      onTap: () async {
                        await supabase.auth.signOut();
                      },
                    )


                  ]
              )
          )
      ),
    );
  }
}