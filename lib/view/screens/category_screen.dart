import 'package:dummy_shop/view/widgets/category/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10, top: 15),
        child: Column(
          children: [
            // Align(
            //  // alignment: Alignment.topLeft,
            //   child: TextUtils(
            //     color: Get.isDarkMode ? Colors.white : Colors.black,
            //     fontSize: 30,
            //     fontWeight: FontWeight.bold,
            //     text: "Category".tr,
            //     underLine: TextDecoration.none,
            //   ),
            // ),
            const SizedBox(height: 20),
            CategoryWidget(),
          ],
        ),
      ),
    );
  }
}
