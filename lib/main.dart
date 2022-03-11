import 'package:dummy_shop/logic/controllers/theme_controller.dart';
import 'package:dummy_shop/routes/routes.dart';
import 'package:dummy_shop/utils/my_string.dart';
import 'package:dummy_shop/utils/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'language/localiztion.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dummy Shop',
      debugShowCheckedModeBanner: false,
      locale: Locale(GetStorage().read("lang").toString()),
      translations: LocalizationApp(),
      fallbackLocale:Locale(ene),
      theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,
      themeMode: ThemeController().themeDataGet,
      initialRoute: FirebaseAuth.instance.currentUser != null ||
              GetStorage().read<bool>("auth") == true
          ? AppRoutes.mainScreen
          : AppRoutes.onboarding,
      getPages: AppRoutes.routes,
    );
  }
}
