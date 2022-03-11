import 'package:dummy_shop/logic/controllers/auth_controller.dart';
import 'package:dummy_shop/routes/routes.dart';
import 'package:dummy_shop/utils/icon_broken.dart';
import 'package:dummy_shop/utils/my_string.dart';
import 'package:dummy_shop/utils/theme.dart';
import 'package:dummy_shop/view/widgets/auth/auth_button.dart';
import 'package:dummy_shop/view/widgets/auth/auth_text_from_field.dart';
import 'package:dummy_shop/view/widgets/auth/check_widget.dart';
import 'package:dummy_shop/view/widgets/auth/container_under.dart';
import 'package:dummy_shop/view/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        //   elevation: 0,
        // ),
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
               // height: MediaQuery.of(context).size.height / 1.3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 50),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextUtils(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              text: "SIGN",
                              color: Get.isDarkMode ? pinkClr : mainColor,
                              underLine: TextDecoration.none,
                            ),
                            const SizedBox(width: 3.0),
                            TextUtils(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              text: "UP",
                              color: Get.isDarkMode
                                  ? Colors.white
                                  : Colors.black,
                              underLine: TextDecoration.none,
                            ),
                          ],
                        ),
                        const SizedBox(height: 50),
                        AuthTextFromField(
                          controller: nameController,
                          obscureText: false,
                          validator: (Value) {
                            if (Value.toString().length <= 2 ||
                                !RegExp(validationName).hasMatch(Value)) {
                              return "Enter valid name";
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Get.isDarkMode
                              ? const Icon(
                                  IconBroken.Profile,
                                  color: pinkClr,
                                  size: 30,
                                )
                              : const Icon(
                                  IconBroken.Profile,
                                  color: mainColor,
                                  size: 30,
                                ),
                          hintText: 'User Name',
                        ),
                        const SizedBox(height: 20),
                        AuthTextFromField(
                          controller: emailController,
                          obscureText: false,
                          validator: (Value) {
                            if (!RegExp(validationEmail).hasMatch(Value)) {
                              return 'Invalid Email';
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Get.isDarkMode
                              ? const Icon(
                                  IconBroken.Message,
                                  color: pinkClr,
                                  size: 30,
                                )
                              : const Icon(
                                  IconBroken.Message,
                                  color: mainColor,
                                  size: 30,
                                ),
                          hintText: 'Email',
                        ),
                        const SizedBox(height: 20),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthTextFromField(
                            controller: passwordController,
                            obscureText:
                                controller.isVisibility ? false : true,
                            validator: (Value) {
                              if (Value.toString().length < 6) {
                                return 'Password should be longer or equal 6 characters';
                              } else {
                                return null;
                              }
                            },
                            prefixIcon: Get.isDarkMode
                                ? const Icon(
                                    IconBroken.Lock,
                                    color: pinkClr,
                                    size: 30,
                                  )
                                : const Icon(
                                    IconBroken.Lock,
                                    color: mainColor,
                                    size: 30,
                                  ),
                            hintText: 'Password',
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.visibility();
                              },
                              icon: controller.isVisibility
                                  ? const Icon(
                                      Icons.visibility_off,
                                      color: Colors.black,
                                    )
                                  : const Icon(
                                      Icons.visibility,
                                      color: Colors.black,
                                    ),
                            ),
                          );
                        }),
                        const SizedBox(height: 20.0),
                        CheckWidget(),
                        const SizedBox(height: 30.0),
                        GetBuilder<AuthController>(
                          builder: (_) {
                            return AuthButton(
                              onPressed: () {
                                if (controller.isCheckBox == false) {
                                  Get.snackbar("check Box",
                                      "Please , Accept terms & conditions",
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: Colors.green[400],
                                      colorText: Colors.white);
                                } else if (formKey.currentState!.validate()) {
                                  String name = nameController.text.trim();
                                  String email = emailController.text.trim();
                                  String password = passwordController.text;
                                  controller.signUp(
                                    name: name,
                                    email: email,
                                    password: password,
                                  );
                                  controller.isCheckBox = true;
                                }
                              },
                              text: "SIGN UP",
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40.0),
              // const Divider(),
              ContainerUnder(
                text: 'Already have an Account ? ',
                textType: 'Login',
                onPressed: () {
                  Get.offNamed(Routes.loginScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
