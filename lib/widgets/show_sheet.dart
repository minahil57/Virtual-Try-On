import 'package:flutter/material.dart';

Future<void> Function({required BuildContext context, required Widget child})
    showCustomSheet = ({
  required BuildContext context,
  Color? barrierColor,
  required Widget child,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useRootNavigator: true,
    backgroundColor: Colors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    builder: (context) => SizedBox(
      child: child,
    ),
  );
};
