// import 'package:flutter/material.dart';
// import 'package:flutter_remix/flutter_remix.dart';
//
// import '../core/colors.dart';
//
// class InputTextFieldWidget extends StatelessWidget {
//   final TextEditingController textEditingController;
//   final String hintText;
//
//
//   InputTextFieldWidget(this.textEditingController, this.hintText);
//
//
//   String? validateEmail(String? value) {
//     const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
//         r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
//         r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
//         r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
//         r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
//         r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
//         r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
//     final regex = RegExp(pattern);
//
//     return value!.isNotEmpty && !regex.hasMatch(value)
//         ? 'Enter a valid email address'
//         : null;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 46,
//       child: TextFormField(
//         controller: textEditingController,
//         validator: validateEmail,
//         decoration: InputDecoration(
//           //alignLabelWithHint: true,
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.black),
//             borderRadius: BorderRadius.circular(30), // Adjust the value to control the roundness
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.grey), // Border when the field is not focused
//             borderRadius: BorderRadius.circular(30), // Adjust the value to control the roundness
//           ),
//           fillColor: Colors.white54,
//           hintText: hintText,
//           hintStyle: const TextStyle(color: Colors.grey),
//           contentPadding: const EdgeInsets.only(bottom: 15,left: 10),
//           focusColor: Colors.white60,
//         ),
//       ),
//     );
//   }
// }
//
// class PasswordInputTextFieldWidget extends StatelessWidget {
//   late final TextEditingController textEditingController;
//   final String hintText;
//
//   PasswordInputTextFieldWidget(this.textEditingController, this.hintText);
//   bool passwordVisible = false;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 46,
//       child: TextFormField(
//         controller: textEditingController,
//         obscureText: true,
//         decoration: InputDecoration(
//           //alignLabelWithHint: true,
//           focusedBorder: OutlineInputBorder(
//             borderSide: const BorderSide(color: Colors.black),
//             borderRadius: BorderRadius.circular(30), // Adjust the value to control the roundness
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: const BorderSide(color: Colors.grey), // Border when the field is not focused
//             borderRadius: BorderRadius.circular(30), // Adjust the value to control the roundness
//           ),
//           fillColor: Colors.white54,
//           hintText: hintText,
//           hintStyle: const TextStyle(color: Colors.grey),
//           contentPadding: const EdgeInsets.only(bottom: 15,left: 10),
//           focusColor: Colors.white60,
//           prefixIcon: const Icon(Icons.lock),
//           suffixIcon: IconButton(
//             icon: Icon(
//               controller.obscureText.value ? FlutterRemix.eye_off_line : FlutterRemix.eye_2_line,
//               color: AppColors.customBlack,
//             ),
//             onPressed: controller.toggleObscureText,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class NameInputTextFieldWidget extends StatelessWidget {
//   late final TextEditingController textEditingController;
//   final String hintText;
//
//   NameInputTextFieldWidget(this.textEditingController, this.hintText);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 46,
//       child: TextFormField(
//         controller: textEditingController,
//         obscureText: true,
//         decoration: InputDecoration(
//           //alignLabelWithHint: true,
//           focusedBorder: OutlineInputBorder(
//             borderSide: const BorderSide(color: Colors.black),
//             borderRadius: BorderRadius.circular(30), // Adjust the value to control the roundness
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: const BorderSide(color: Colors.grey), // Border when the field is not focused
//             borderRadius: BorderRadius.circular(30), // Adjust the value to control the roundness
//           ),
//           fillColor: Colors.white54,
//           hintText: hintText,
//           hintStyle: const TextStyle(color: Colors.grey),
//           contentPadding: const EdgeInsets.only(bottom: 15,left: 10),
//           focusColor: Colors.white60,
//         ),
//       ),
//     );
//   }
// }
//
