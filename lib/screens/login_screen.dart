import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:stocks/contants/color.dart';
import 'package:stocks/providers/providers.dart';
import 'package:stocks/screens/stock_search_sreen.dart';
import 'package:stocks/utils/app_text/app_text.dart';
import 'package:stocks/utils/app_text/app_text_type.dart';
import 'package:stocks/utils/text_field/app_text_field.dart';
import 'package:animate_do/animate_do.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  late TextEditingController email;
  late TextEditingController password;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    email = TextEditingController();
    password = TextEditingController();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.bgColor,
      body: Stack(
        children: [
          Image.asset(
            "assets/login_bg.png",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [ColorConstant.bgColor, Colors.transparent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FadeInDown(child: Image.asset("assets/logo_nobg.png")),
                      const SizedBox(height: 20),
                      Center(
                        child: FadeInDown(
                          delay: const Duration(milliseconds: 200),
                          child: const AppText(
                            text: "Welcome Back!!",
                            appTextType: AppTextType.heading,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Center(
                        child: FadeInDown(
                          delay: const Duration(milliseconds: 300),
                          child: const AppText(
                            text: "Start investing",
                            appTextType: AppTextType.smallText,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SlideInRight(
                        delay: const Duration(milliseconds: 400),
                        child: AppTextField(
                          label: "Email",
                          controller: email,
                          bgColor: Colors.transparent,
                          borderColor: ColorConstant.white,
                          icon: Icons.email,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email is required";
                            }
                            if (!RegExp(
                                    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                                .hasMatch(value)) {
                              return "Enter a valid email";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      SlideInRight(
                        delay: const Duration(milliseconds: 500),
                        child: AppTextField(
                          label: "Password",
                          controller: password,
                          bgColor: Colors.transparent,
                          borderColor: ColorConstant.white,
                          icon: Icons.password,
                          isObscure: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password is required";
                            }
                            if (value.length < 6) {
                              return "Password must be at least 6 characters";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 40),
                      Center(
                        child: FadeInUp(
                          delay: const Duration(milliseconds: 600),
                          child: ElevatedButton(
                            style: const ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(ColorConstant.white),
                            ),
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                setState(() {
                                  isLoading = true;
                                });
                                final credentials = {
                                  "email": email.text,
                                  "password": password.text
                                };

                                try {
                                  await ref
                                      .read(loginProvider(credentials).future);
                                  Get.offAll(() => const StockSearchPage());
                                } catch (e) {
                                  Get.snackbar("Login Failed",
                                      "Try again after some time!!",
                                      backgroundColor: Colors.red);
                                }
                                setState(() {
                                  isLoading = false;
                                });
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 30),
                              decoration: BoxDecoration(
                                color: ColorConstant.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: isLoading
                                  ? const CircularProgressIndicator()
                                  : const AppText(
                                      text: "Login",
                                      appTextType: AppTextType.bigTextDark,
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
