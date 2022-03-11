import 'package:dummy_shop/view/screens/category_screen.dart';
import 'package:dummy_shop/view/screens/favorites_screen.dart';
import 'package:dummy_shop/view/screens/home_screen.dart';
import 'package:dummy_shop/view/screens/setting_screen.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  var tabs = [
    const HomeScreen(),
    const CategoryScreen(),
     FavoritesScreen(),
    const SettingsScreen(),
  ].obs;

  var title = [
    "DUMMEY SHOP",
    "Categories",
    'Favourites',
    "Settings",
  ].obs;
}