// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/simple/get_view.dart';
// import 'package:virtual_try_on/controllers/bottomBar_controller.dart';
// import 'package:virtual_try_on/screens/auth_screens/login_screen.dart';
// import 'package:virtual_try_on/screens/index_page/index_screen.dart';
// class BottomBar extends  GetView<BottomBarController> {
//   const BottomBar({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     Get.putOrFind(() => BottomBarController());
//     return SafeArea(
//       child: Scaffold(
//         body: BottomBar(
//           clip: Clip.none,
//           fit: StackFit.expand,
//           icon: (width, height) => Center(
//             child: IconButton(
//               padding: EdgeInsets.zero,
//               onPressed: null,
//               icon: Icon(
//                 Icons.arrow_upward_rounded,
//                 color: unselectedColor,
//                 size: width,
//               ),
//             ),
//           ),
//           borderRadius: BorderRadius.circular(500),
//           duration: Duration(milliseconds: 500),
//           curve: Curves.decelerate,
//           showIcon: true,
//           width: MediaQuery.of(context).size.width * 0.8,
//           barColor: colors[currentPage].computeLuminance() > 0.5 ? Colors.black : Colors.white,
//           start: 2,
//           end: 0,
//           offset: 10,
//           barAlignment: Alignment.bottomCenter,
//           iconHeight: 30,
//           iconWidth: 30,
//           reverse: false,
//           barDecoration: BoxDecoration(
//             color: colors[currentPage],
//             borderRadius: BorderRadius.circular(500),
//           ),
//           iconDecoration: BoxDecoration(
//             color: colors[currentPage],
//             borderRadius: BorderRadius.circular(500),
//           ),
//           hideOnScroll: true,
//           scrollOpposite: false,
//           onBottomBarHidden: () {},
//           onBottomBarShown: () {},
//           body: (context, controller) => TabBarView(
//             controller: tabController,
//             dragStartBehavior: DragStartBehavior.down,
//             physics: const BouncingScrollPhysics(),
//             children: const <Widget>[
//               IndexScreen(),
//               LoginScreen(),
//               // Add other screens as needed
//             ],
//           ),
//           child: Stack(
//             alignment: Alignment.center,
//             clipBehavior: Clip.none,
//             children: [
//               TabBar(
//                 indicatorPadding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
//                 controller: controller.tabController,
//                 indicator: UnderlineTabIndicator(
//                     borderSide: BorderSide(
//                       //color: currentPage <= 4 ? colors[currentPage] : unselectedColor,
//                       width: 4,
//                     ),
//                     insets: EdgeInsets.fromLTRB(16, 0, 16, 8)),
//                 tabs: [
//                   SizedBox(
//                     height: 55,
//                     width: 40,
//                     child: Center(
//                         child: Icon(
//                           Icons.home,
//                           //color: currentPage == 0 ? colors[0] : unselectedColor,
//                         )),
//                   ),
//                   SizedBox(
//                     height: 55,
//                     width: 40,
//                     child: Center(
//                       child: Icon(
//                         Icons.search,
//                         //color: currentPage == 1 ? colors[1] : unselectedColor,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 55,
//                     width: 40,
//                     child: Center(
//                       child: Icon(
//                         Icons.add,
//                         //color: currentPage == 2 ? colors[2] : unselectedColorReverse,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 55,
//                     width: 40,
//                     child: Center(
//                       child: Icon(
//                         Icons.favorite,
//                         color: currentPage == 3 ? colors[3] : unselectedColor,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 55,
//                     width: 40,
//                     child: Center(
//                       child: Icon(
//                         Icons.settings,
//                         color: currentPage == 4 ? colors[4] : unselectedColor,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Positioned(
//                 top: -25,
//                 child: FloatingActionButton(
//                   onPressed: () {},
//                   child: Icon(Icons.add),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }