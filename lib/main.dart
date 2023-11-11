import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:virtual_try_on/core/colors.dart';
import 'package:virtual_try_on/core/text_styles.dart';
import 'package:virtual_try_on/screens/auth_screens/splash_screen.dart';

import 'config/supabase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await supabaseInit();

  // Loading configurations
  EasyLoading.instance
    ..textStyle = globalTextStyle(fontSize: 12, color: Colors.white)
    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = AppColors.primary
    ..radius = 12
    ..textColor = Colors.white
    ..indicatorColor = Colors.white
    ..userInteractions = false
    ..displayDuration = const Duration(seconds: 1)
    ..dismissOnTap = false;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, child) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusScope.of(context).unfocus(),
        child: GetMaterialApp(
          title: 'Virutal TryOn',
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          theme: ThemeData(
            primaryColor: AppColors.primary,
            primarySwatch: AppColors.primarySwatch,
            fontFamily: 'Poppins',
            appBarTheme: AppBarTheme(
              color: Colors.white,
              elevation: 0,
              titleTextStyle: globalTextStyle(
                fontSize: 14.sp,
              ),
            ),
            scaffoldBackgroundColor: Colors.white,
            textTheme: Theme.of(context).textTheme.apply(
                  bodyColor: Colors.black,
                  displayColor: Colors.black,
                ),
          ),
          builder: EasyLoading.init(),
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
