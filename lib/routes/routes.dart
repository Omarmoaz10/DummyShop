import 'package:dummy_shop/logic/bindings/auth_biniding.dart';
import 'package:dummy_shop/logic/bindings/main_binding.dart';
import 'package:dummy_shop/logic/bindings/product_binding.dart';
import 'package:dummy_shop/view/screens/auth/forget_password_screen.dart';
import 'package:dummy_shop/view/screens/auth/login_screen.dart';
import 'package:dummy_shop/view/screens/auth/signup_screen.dart';
import 'package:dummy_shop/view/screens/cart_screen.dart';
import 'package:dummy_shop/view/screens/main_screen.dart';
import 'package:dummy_shop/view/screens/onboarding_screen.dart';
import 'package:dummy_shop/view/screens/payment_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  //initialRoute
  static const onboarding = Routes.onboardingScreen;
  static const mainScreen = Routes.mainScreen;
  //get pages

  static final routes = [
    GetPage(
      name: Routes.onboardingScreen,
      page: () => OnBoardingPage(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignUpScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.mainScreen,
      page: () => MainScreen(),
      bindings: [
        AuthBinding(),
        MainBininding(),
        ProductBinding(),
      ],
    ),
    GetPage(
      name: Routes.cartScreen,
      page: () => CartScreen(),
      bindings: [
        AuthBinding(),
        ProductBinding(),
      ],
    ),
    GetPage(
      name: Routes.paymentScreen,
      page: () => PayMentScreen(),
      bindings: [
        AuthBinding(),
        ProductBinding(),
        MainBininding(),
      ],
    ),
  ];
}

class Routes {
  static const onboardingScreen = "/onboardinScreen";
  static const loginScreen = "/loginScreen";
  static const signUpScreen = "/signUpScreen";
  static const forgotPasswordScreen = '/forgotPasswordScreen';
  static const mainScreen = '/mainScreen';
  static const cartScreen = '/cartScreen';
  static const paymentScreen = '/paymentScreen';
}
