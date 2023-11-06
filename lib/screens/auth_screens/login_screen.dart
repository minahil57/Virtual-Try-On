import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/controllers/Login_Controller.dart';
import 'package:virtual_try_on/screens/auth_screens/complete_profile_screen.dart';
import 'package:virtual_try_on/screens/auth_screens/signup_screen.dart';
import '../../core/colors.dart';
import '../../core/text_styles.dart';
import '../../widgets/custom_TextField.dart';
import '../../widgets/custom_button.dart';


class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:SingleChildScrollView(
        child:Padding(
            padding: EdgeInsets.only(top: 100,),

       child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                child:
                Text(
                  'Sign In',
                  textAlign: TextAlign.center,
                  style: globalTextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ),
                SizedBox(height: 12.h),
               Center(
                child:
                Text(
                  'Hi Welcome back, You have been missed',
                  textAlign: TextAlign.center,
                  style: globalTextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ),
                SizedBox(height: 70.h),
                Form(
                  key: loginController.formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Padding(padding: EdgeInsets.only(left: 20),
                child:
                Text(
                  'Email',
                  textAlign: TextAlign.center,
                  style: globalTextStyle(
                    fontSize: 12.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                  ),
                Padding(padding: EdgeInsets.only(left: 20,right: 20),
                child:
                InputTextFieldWidget(loginController.emailController, 'example@gmail.com')),
                SizedBox(height: 20.h),
          Padding(padding: EdgeInsets.only(left: 20,right: 20),
            child:
                Text(
                  'Password',
                  textAlign: TextAlign.center,
                  style: globalTextStyle(
                    fontSize: 12.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
          ),
                Padding(padding: EdgeInsets.only(left: 20,right: 20),
                 child:
                PasswordInputTextFieldWidget(loginController.passwordController, '************',)),
                ]
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(padding: EdgeInsets.only(left: 20,right: 20),
                    child:
                    TextButton(onPressed: (){}, child: const Text('Forgot Password?',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: AppColors.primary
                    ),
                    )))
                  ],
                ),

                SizedBox(height: 40.h),
                Center(
                  child:
                CustomButton(
                    text: 'Login',
                    width: Get.width*0.7.w,
                    onPressed: (){
                      Get.offAll(() => CompleteProfile());
                    }),),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Divider(
                        indent: 30,
                        thickness: 1,
                        color: AppColors.customLightGrey,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'or sign in with',
                      style: TextStyle(
                          color: AppColors.customGrey,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Divider(
                        endIndent: 30,
                        thickness: 1,
                        color: AppColors.customLightGrey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircularLogoContainer("assets/images/apple.png"),
                    CircularLogoContainer("assets/images/Google logo.png"),
                    CircularLogoContainer("assets/images/facebook logo.png"),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                 mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Don\'t have Account?',),
            TextButton(onPressed: () {
              Get.to(() => Sign_up());
            }, child: const Text('Sign Up',
              style: TextStyle(
                  color: AppColors.primary
              ),
            ))
                ],
            ),
        ]
      ),
    )
      )
      );
  }
}
class CircularLogoContainer extends StatelessWidget {
  final String logoPath;

  CircularLogoContainer(this.logoPath);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60, // Adjust the size of the circular container as needed
      height:60,
      decoration: BoxDecoration(
        shape: BoxShape.circle, // Makes it a circular container
        border: Border.all(
          color: Colors.black, // Border color
          width: 1.0, // Border width
        ),
      ),
      child: ClipOval(
        child: Container(
          //color: Colors.grey, // Background color for the circular container
          child: Center(
            child: Image.asset(
              logoPath,
              width: 40, // Adjust the size of the logo as needed
              height: 40,
            ),
          ),
        ),
      ),
    );
  }
}