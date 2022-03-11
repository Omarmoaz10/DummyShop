import 'package:badges/badges.dart';
import 'package:dummy_shop/logic/controllers/cart_controller.dart';
import 'package:dummy_shop/logic/controllers/main_controller.dart';
import 'package:dummy_shop/routes/routes.dart';
import 'package:dummy_shop/utils/icon_broken.dart';
import 'package:dummy_shop/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  final controller = Get.find<MainController>();
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            elevation: 0,
            leading: Container(),
            actions: [
              Obx(
                () => Badge(
                  position: BadgePosition.topEnd(top: 0, end: 3),
                  animationDuration: const Duration(milliseconds: 300),
                  animationType: BadgeAnimationType.slide,
                  badgeContent: Text(
                    cartController.quantity().toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  child: IconButton(
                    icon: const Icon(IconBroken.Buy),
                    onPressed: () {
                      Get.toNamed(Routes.cartScreen);
                    },
                  ),
                ),
              ),
            ],
            backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
            title: Text(controller.title[controller.currentIndex.value]),
            centerTitle: true,
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
            currentIndex: controller.currentIndex.value,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                activeIcon: Icon(
                  IconBroken.Home,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                icon: Icon(
                  IconBroken.Home,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  IconBroken.Category,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                icon: Icon(
                  IconBroken.Category,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  IconBroken.Heart,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                icon: Icon(
                  IconBroken.Heart,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(
                  IconBroken.Setting,
                  color: Get.isDarkMode ? pinkClr : mainColor,
                ),
                icon: Icon(
                  IconBroken.Setting,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                label: '',
              ),
            ],
            onTap: (index) {
              controller.currentIndex.value = index;
            },
          ),
          body: IndexedStack(
            index: controller.currentIndex.value,
            // ignore: invalid_use_of_protected_member
            children: controller.tabs.value,
          ),
        );
      }),
    );
  }
}
