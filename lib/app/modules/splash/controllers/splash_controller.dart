import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sos/app/routes/app_pages.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> scaleAnimation;
  late Animation<double> opacityAnimation;

  @override
  void onInit() {
    super.onInit();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    scaleAnimation = Tween<double>(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
    );

    opacityAnimation = Tween<double>(begin: 0.3, end: 0.7).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
    );

    // Auto navigation
    Timer(const Duration(seconds: 10), () {
      // TODO: change route
      Get.offAllNamed(Routes.HOME);
    });
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
