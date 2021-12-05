import 'package:e_space_mobile/controller/splash/splash_controller.dart';
import 'package:e_space_mobile/core/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        builder: (controller) => Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [AppColors.blue, AppColors.gradientBlue]),
              ),
              child: Scaffold(
                backgroundColor: Colors.white,
                body: Center(
                  child: Image.asset(
                    'assets/svg/appstore.png',
                    height: 200,
                    width: 200,
                  ),
                ),
              ),
            ));
  }
}
