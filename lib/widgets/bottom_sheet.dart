// import 'dart:io';
//
// import 'package:flutter/material.dart';
//
//
// import 'package:flutter/material.dart';
//
// Future<void> Function({required BuildContext context, required Widget child})
// showCustomSheet = ({
//   required BuildContext context,
//   Color? barrierColor,
//   required Widget child,
// }) {
//   showModalBottomSheet(
//     context: context,
//     builder: (BuildContext context) {
//       return Container(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             ListTile(
//               leading: Icon(Icons.photo_library),
//               title: Text('Choose from Gallery'),
//               onTap: () {
//                 //_getImage(ImageSource.gallery);
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               leading: Icon(Icons.camera_alt),
//               title: Text('Take a Photo'),
//               onTap: () {
//                 //_getImage(ImageSource.camera);
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         ),
//       );
//     },
//   );
// };
//
//
// // Future<void> _getImage(ImageSource source) async {
// //   final picker = ImagePicker();
// //   final pickedFile = await picker.pickImage(source: source);
// //
// //   if (pickedFile != null) {
// //     setState(() {
// //       _image = File(pickedFile.path);
// //     });
// //     // You can use the `_image` file as needed (e.g., upload to server, display in UI, etc.)
// //   }
// // }
