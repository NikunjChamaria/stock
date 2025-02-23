import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stocks/contants/color.dart';
import 'package:stocks/screens/login_screen.dart';
import 'package:stocks/screens/stock_search_sreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final jwt = prefs.getString("jwt");

    if (jwt == null || jwt.isEmpty) {
      Get.off(() => const LoginScreen());
    } else {
      Get.off(() => const StockSearchPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.bgColor,
      body: Center(
        child: Image.asset("assets/logo_nobg.png"),
      ),
    );
  }
}
