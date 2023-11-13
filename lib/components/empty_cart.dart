import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class empty_cart extends StatelessWidget {
  const empty_cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Image.asset(
        'assets/images/empty.gif',
        height: 250.h,
        width: 250.w,
      )),
    );
  }
}
