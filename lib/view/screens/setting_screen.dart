import 'package:dummy_shop/utils/theme.dart';
import 'package:dummy_shop/view/widgets/setting/dark_mode_widget.dart';
import 'package:dummy_shop/view/widgets/setting/language_widget.dart';
import 'package:dummy_shop/view/widgets/setting/logout_widget.dart';
import 'package:dummy_shop/view/widgets/setting/profile_widget.dart';
import 'package:dummy_shop/view/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          ProfileWidget(),
          const SizedBox(height: 10),
          Divider(
            color: Get.isDarkMode ? Colors.white : Colors.grey,
            thickness: 2,
          ),
          const SizedBox(height: 20),
          TextUtils(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            text: "GENERAL".tr,
            color: Get.isDarkMode ? pinkClr : mainColor,
            underLine: TextDecoration.none,
          ),
          const SizedBox(height: 20),
           DarkModeWidget(),
          const SizedBox(height: 20),
           LanguageWidget(),
          const SizedBox(height: 20),
            LogOutWidget(),
        ],
      ),
    );
  }
}
// body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       TextButton(
      //         onPressed: () {},
      //         child: IconButton(
      //           onPressed: () {
      //             ThemeController().changesTheme();
      //           },
      //           icon: const Icon(
      //             IconBroken.Star,
      //           ),
      //         ),
      //       ),
      //       const SizedBox(
      //         height: 20,
      //       ),
      //       GetBuilder<AuthController>(
      //         builder: (controller) {
      //           return TextButton(
      //             onPressed: () {},
      //             child: IconButton(
      //               onPressed: () {
      //                 controller.signOut();
      //               },
      //               icon: const Icon(
      //                 IconBroken.Logout,
      //               ),
      //             ),
      //           );
      //         },
      //       ),
      //     ],
      //   ),
      // ),